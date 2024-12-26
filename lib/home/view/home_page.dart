import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/assets/variabels/variabels.dart';
import 'package:payment_gateway_ongkir/home/controller/home_controller.dart';
import 'package:payment_gateway_ongkir/routes/route.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name.value),
        centerTitle: true,
      ),
      body: Center(
        child: Expanded(
          child: Obx(() {
            if (controller.productData.value.isEmpty) {
              return Center(
                  child: CircularProgressIndicator()); // Menunggu data
            } else {
              return ListView.separated(
                itemCount: controller.productData.value.length,
                itemBuilder: (context, index) {
                  var product = controller.productData.value[index];
                  return ProductCard(
                    name: product.name,
                    price: product.price.toString(),
                    image: product.image,
                    onPressed: () {
                      Get.toNamed(
                        RouteName.location,
                        arguments: {
                          'productId': product.id,
                          'price': product.price
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
              );
            }
          }),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final Function() onPressed;
  const ProductCard(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(Variabels.baseUrl + '/images/$image',
              width: 100, height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(
              children: [
                Text(name),
                Text("Rp. $price"),
              ],
            ),
          ),
          const SizedBox(width: 100),
          ElevatedButton(
              onPressed: () {
                onPressed();
                // Get.toNamed(RouteName.payment);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsData.primaryColor),
              child: const Text(
                'Beli',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
