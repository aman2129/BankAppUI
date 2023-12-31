import 'package:flutter/material.dart';

class FeaturesTile extends StatelessWidget {
  final String icon;
  final String text;

  const FeaturesTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey.shade300, Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(5, 5), // right and bottom offset
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
