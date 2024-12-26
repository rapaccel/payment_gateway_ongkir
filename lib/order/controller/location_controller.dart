import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';

class LocationController extends GetxController {
  var shippingCost = 0.obs;
  var isLoading = false.obs;
  var provinces = <Province>[].obs;
  var cities = <City>[].obs;
  var selectedProvinceId = 0.obs;
  var selectedCityId = 0.obs;
  late int productId;
  var visible = false.obs;
  late MidtransSDK _midtrans;
  late int price;

  @override
  void onInit() {
    initSDK();
    productId = Get.arguments['productId'] as int;
    price = Get.arguments['price'] as int;

    print("productId: $price");
    super.onInit();
    fetchProvinces();
  }

  void onClick() {
    _midtrans.startPaymentUiFlow(
      token: "377bd98b-f57f-48e1-bb3d-72786191a67f",
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  void initSDK() async {
    final url = Variabels.baseUrl;
    _midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        enableLog: true,
        clientKey: "SB-Mid-client-wUD7dKxLJFvpwSSr",
        merchantBaseUrl: "$url/api/midtrans/notify/",
        colorTheme: ColorTheme(
          colorPrimary: ColorsData.primaryColor,
          colorPrimaryDark: ColorsData.primaryColor,
          colorSecondary: ColorsData.secondaryColor,
        ),
      ),
    );
    _midtrans.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );
    _midtrans.setTransactionFinishedCallback((result) {
      print(result.toJson());
    });
  }

  @override
  void dispose() {
    _midtrans.removeTransactionFinishedCallback();
    super.dispose();
  }

  klikOrder() {
    final url = Variabels.baseUrl;
    final userId = GetStorage().read('id');
    final totalPrice = price + shippingCost.value;
    final data = {
      'product_id': productId.toString(),
      'user_id': userId.toString(),
      'total_price': totalPrice.toString(),
    };
    http.post(Uri.parse("$url/api/orders/store"), body: data).then((response) {
      var result = jsonDecode(response.body);
      var message = result['message'];
      if (response.statusCode == 200) {
        _midtrans.startPaymentUiFlow(
          token: result['snap_token'],
        );
      } else {
        Get.snackbar('Error', message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(Icons.error),
            snackPosition: SnackPosition.BOTTOM);
      }
    });
  }

  // Fungsi untuk mendapatkan data provinsi
  Future<void> fetchProvinces() async {
    try {
      visible.value = true;
      isLoading.value = true;
      var url = 'https://api.rajaongkir.com/starter/province';
      var response = await http.get(
        Uri.parse(url),
        headers: {'key': '378de919cf8d701b78b0cc8b1880d1dd'},
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var provinceList = (jsonData['rajaongkir']['results'] as List)
            .map((item) => Province.fromJson(item))
            .toList();
        provinces.assignAll(provinceList);
      } else {
        Get.snackbar('Error', 'Failed to fetch provinces');
      }
    } catch (e) {
      print('ini error $e');
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCities(int provinceId) async {
    try {
      var url = 'https://api.rajaongkir.com/starter/city?province=$provinceId';
      var response = await http.get(
        Uri.parse(url),
        headers: {'key': '378de919cf8d701b78b0cc8b1880d1dd'},
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var cityList = (jsonData['rajaongkir']['results'] as List)
            .map((item) => City.fromJson(item))
            .toList();
        cities.assignAll(cityList);
      } else {
        Get.snackbar('Error', 'Failed to fetch cities');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchShippingCost(int destinationCityId) async {
    try {
      var url = 'https://api.rajaongkir.com/starter/cost';
      var response = await http.post(
        Uri.parse(url),
        headers: {'key': '378de919cf8d701b78b0cc8b1880d1dd'},
        body: {
          'origin': "39",
          'destination': destinationCityId.toString(),
          'weight': "1",
          'courier': 'jne',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        var jsonData = json.decode(response.body);
        var costData = jsonData['rajaongkir']['results'][0]['costs'][0]['cost']
            [0]['value'];
        shippingCost.value = costData;
      } else {
        Get.snackbar('Error', 'Failed to fetch shipping cost');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

class Province {
  final int id;
  final String name;

  Province({required this.id, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: int.tryParse(json['province_id'].toString()) ??
          0, // Ensure it's an int
      name: json['province'],
    );
  }
}

class City {
  final int id;
  final String name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: int.tryParse(json['city_id'].toString()) ?? 0, // Ensure it's an int
      name: json['city_name'],
    );
  }
}
