import 'package:flutter/material.dart';

class BlePage extends StatelessWidget {
  const BlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLE'),
      ),
      body: const Center(
        child: Text('BLE Page'),
      ),
    );
  }
}
