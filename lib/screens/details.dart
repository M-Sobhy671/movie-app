import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121312),
        title: const Text("Details"),
      ),
      body: const Center(
        child: Text(
          "Details Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
