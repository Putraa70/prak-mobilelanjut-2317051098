import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saatnya Menabung')), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ), // Image.asset
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: const Text('AYO Mulai Menabung!'),
            ), // ElevatedButton
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}
