import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/order/controller/location_controller.dart';

class LocationPage extends GetView<LocationController> {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Province and City')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown untuk memilih Provinsi
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Select Province'),
                value: controller.selectedProvinceId.value == 0
                    ? null
                    : controller.selectedProvinceId.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedProvinceId.value = value;
                    controller.selectedCityId.value = 0;
                    controller.fetchCities(value);
                  }
                },
                items: controller.provinces
                    .map((province) => DropdownMenuItem<int>(
                          value: province.id,
                          child: Text(province.name),
                        ))
                    .toList(),
              );
            }),

            SizedBox(height: 20),

            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Select City'),
                value: controller.selectedCityId.value == 0
                    ? null
                    : controller.selectedCityId.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCityId.value = value;
                    controller.shippingCost.value = 0;
                    controller
                        .fetchShippingCost(controller.selectedCityId.value);
                  }
                },
                items: controller.cities
                    .map((city) => DropdownMenuItem<int>(
                          value: city.id,
                          child: Text(city.name),
                        ))
                    .toList(),
              );
            }),
            Obx(() {
              return controller.shippingCost.value > 0
                  ? Text('Ongkir: Rp ${controller.shippingCost.value}')
                  : Container();
            }),
          ],
        ),
      ),
    );
  }
}
