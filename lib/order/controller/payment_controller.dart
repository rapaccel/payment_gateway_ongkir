import 'package:get/get.dart';

class PaymentController extends GetxController {
  // late MidtransSDK _midtrans;

  @override
  void onInit() {
    super.onInit();
  }

  // var config = MidtransConfig(
  //   clientKey: "SB-Mid-client-__e16A8Ouz1L65_P" ?? "",
  //   merchantBaseUrl: "${Variabels.baseUrl}/api/midtrans/notify" ?? "",
  //   colorTheme: ColorTheme(
  //     colorPrimary: ColorsData.primaryColor,
  //     colorPrimaryDark: ColorsData.primaryColor,
  //     colorSecondary: ColorsData.secondaryColor,
  //   ),
  // );

  // void _initMidtrans() async {
  //   _midtrans = await MidtransSDK.init(config: config);
  //   _midtrans.setTransactionFinishedCallback((result) {
  //     print('Transaction finished: ${result.transactionStatus}');
  //     if (result.transactionStatus == 'success') {
  //       Get.snackbar('Success', 'Payment was successful');
  //     } else if (result.transactionStatus == 'pending') {
  //       Get.snackbar('Pending', 'Payment is pending');
  //     } else {
  //       Get.snackbar('Failed', 'Payment failed');
  //     }
  //   });
  // }
}
