import 'package:flutter/material.dart';

class BillsTile extends StatelessWidget {
  final String icon;
  final String text;
  const BillsTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 61,
          width: 67,
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
          child: Image.asset(icon),
        ),
        const SizedBox(height: 5,),
        Text(text)
      ],
    );
  }
}
