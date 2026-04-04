import 'package:flutter/services.dart';

enum Flavor {
  dev,
  prod;

  static Flavor get current {
    final f = appFlavor ?? (throw UnimplementedError());
    return Flavor.values.byName(f);
  }

  static const bool isDev = appFlavor == 'dev';
  static const bool isProd = appFlavor == 'prod';
}

class Env {
  static String get apiBaseUrl => switch (Flavor.current) {
    Flavor.dev => 'https://example.dev.com',
    Flavor.prod => 'https://example.prod.com',
  };
}
