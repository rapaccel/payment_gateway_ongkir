import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';
import 'package:payment_gateway_ongkir/history/data_history.dart';
import 'package:http/http.dart' as http;

class HistoryController extends GetxController {
  Rx<List<DataHistory>> dataHistory = Rx<List<DataHistory>>([]);

  @override
  void onInit() {
    fetchHistory();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> fetchHistory() async {
    try {
      final getId = GetStorage().read('id');
      var url = '${Variabels.baseUrl}/api/orders/users/$getId';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
        final List<dynamic> data = json.decode(response.body);
        dataHistory.value =
            data.map((json) => DataHistory.fromJson(json)).toList();
        update();
      } else {
        Get.snackbar(
            'Error', 'Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
