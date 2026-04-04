import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/app.dart';
import 'package:playground/feature/ble/ble_page.dart';

part 'route.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<BleRoute>(path: 'ble'),
  ],
)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyHomePage();
}

class BleRoute extends GoRouteData with $BleRoute {
  const BleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const BlePage();
}
