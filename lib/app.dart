import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/router/route.dart';
import 'package:playground/router/router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Playground',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () => const BleRoute().push<void>(context),
            child: const Text('BLE'),
          ),
          TextButton(
            onPressed: () => const WifiBrowserRoute().push<void>(context),
            child: const Text('Wi-Fi'),
          ),
          TextButton(
            onPressed: () => const NfcRoute().push<void>(context),
            child: const Text('NFC'),
          ),
        ],
      ),
    );
  }
}
