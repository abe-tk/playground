import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/app.dart';
import 'package:playground/feature/ble/ui/page/ble_device_page.dart';
import 'package:playground/feature/ble/ui/page/ble_page.dart';
import 'package:playground/feature/ble/ui/page/ble_peripheral_page.dart';
import 'package:playground/feature/ble/ui/page/counter_display_page.dart';
import 'package:playground/feature/ble/ui/page/counter_remote_page.dart';
import 'package:playground/feature/nfc/ui/page/nfc_page.dart';
import 'package:playground/feature/wifi/ui/page/wifi_browser_page.dart';
import 'package:playground/feature/wifi/ui/page/wifi_client_page.dart';
import 'package:playground/feature/wifi/ui/page/wifi_server_page.dart';

part 'route.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<BleRoute>(
      path: 'ble',
      routes: [
        TypedGoRoute<BlePeripheralRoute>(path: 'peripheral'),
        TypedGoRoute<CounterDisplayRoute>(path: 'counter-display'),
        TypedGoRoute<CounterRemoteRoute>(path: 'counter-remote/:deviceId'),
        TypedGoRoute<BleDeviceRoute>(path: ':deviceId'),
      ],
    ),
    TypedGoRoute<WifiBrowserRoute>(
      path: 'wifi',
      routes: [
        TypedGoRoute<WifiServerRoute>(path: 'server'),
        TypedGoRoute<WifiClientRoute>(path: 'chat/:host/:port'),
      ],
    ),
    TypedGoRoute<NfcRoute>(path: 'nfc'),
  ],
)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MyHomePage();
}

class BleRoute extends GoRouteData with $BleRoute {
  const BleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const BlePage();
}

class BleDeviceRoute extends GoRouteData with $BleDeviceRoute {
  const BleDeviceRoute({required this.deviceId});

  final String deviceId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      BleDevicePage(deviceId: deviceId);
}

class BlePeripheralRoute extends GoRouteData with $BlePeripheralRoute {
  const BlePeripheralRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const BlePeripheralPage();
}

class CounterDisplayRoute extends GoRouteData with $CounterDisplayRoute {
  const CounterDisplayRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CounterDisplayPage();
}

class CounterRemoteRoute extends GoRouteData with $CounterRemoteRoute {
  const CounterRemoteRoute({required this.deviceId});

  final String deviceId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CounterRemotePage(deviceId: deviceId);
}

class WifiBrowserRoute extends GoRouteData with $WifiBrowserRoute {
  const WifiBrowserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WifiBrowserPage();
}

class WifiServerRoute extends GoRouteData with $WifiServerRoute {
  const WifiServerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WifiServerPage();
}

class WifiClientRoute extends GoRouteData with $WifiClientRoute {
  const WifiClientRoute({required this.host, required this.port});

  final String host;
  final int port;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      WifiClientPage(host: host, port: port);
}

class NfcRoute extends GoRouteData with $NfcRoute {
  const NfcRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NfcPage();
}
