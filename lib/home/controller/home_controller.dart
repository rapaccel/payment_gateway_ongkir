import 'dart:convert';

import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';
import 'package:payment_gateway_ongkir/home/product_Data.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Rx<List<ProductData>> productData = Rx<List<ProductData>>([]);
  final name = "Home Page".obs;
  @override
  void onInit() {
    super.onInit();
    print('HomeController onInit');
    fetchProducts();
  }

  @override
  void onReady() {
    super.onReady();
    fetchProducts();
    print('HomeController onReady');
  }

  Future<void> fetchProducts() async {
    var isLoading = false.obs;
    try {
      var url = '${Variabels.baseUrl}/api/product/index';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print(response.body);
        var jsonData = json.decode(response.body);
        var products = (jsonData['data'] as List)
            .map((item) => ProductData.fromJson(item))
            .toList();

        productData.value = products; // Update daftar produk
      } else {
        Get.snackbar('Error', 'Failed to fetch products');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
