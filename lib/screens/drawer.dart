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
        title: Image.asset('assets/images/drawer/branchX.png', height: 30,),
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
        itemCount: gridDrawerItems.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          final data = gridDrawerItems[index];
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
             Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset('assets/images/drawer/user.png'),
                const SizedBox(
                  width: 20,
                ),
                const Text('Rahul'),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Image.asset('assets/images/drawer/Power button.png')
          ],
        ),
      ),
    );
  }
}
