import 'package:flutter/material.dart';

import '../services/storage.dart';
import '../utils/features_tile.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'branchX',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Banking for Bharat',
              style: TextStyle(
                fontSize: 8,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel_outlined,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gridItems.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          final data = gridItems[index];
          return FeaturesTile(
            icon: data.icon,
            text: data.text,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.account_box_outlined),
                SizedBox(
                  width: 20,
                ),
                Text('Rahul'),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.power_settings_new_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
