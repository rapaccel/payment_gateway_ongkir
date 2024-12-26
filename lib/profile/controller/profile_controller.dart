import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    print('ProfileController onInit');
    loadData();
    super.onInit();
  }

  var name = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;

  // Fungsi untuk mengambil data dari GetStorage
  void loadData() {
    final storage = GetStorage();
    name.value = storage.read('name') ?? 'No Name';
    email.value = storage.read('email') ?? 'No Email';
    phoneNumber.value = storage.read('phone_number') ?? 'No Phone Number';
  }

  @override
  void onReady() {
    print('ProfileController onReady');
  }
}
