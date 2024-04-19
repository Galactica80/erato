import 'package:flutter/material.dart';

class SubscriptionButton extends StatelessWidget {
  final String text;
  const SubscriptionButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 20,
        shadowColor: const Color(0XFF414BB2),
        backgroundColor: const Color(0XFF414BB2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      onPressed: () {},
      child: Text(text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }
}
