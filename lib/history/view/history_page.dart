import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_gateway_ongkir/history/controller/history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.fetchHistory();
        },
        child: ListView.builder(
            itemCount: controller.dataHistory.value.length,
            itemBuilder: (context, index) {
              var history = controller.dataHistory.value[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ID: ${history.id}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Total Price: \$${history.totalPrice}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Status: ${history.status}",
                        style: const TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Created At: ${history.createdAt}",
                        style: const TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
