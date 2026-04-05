// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRoute];

RouteBase get $homeRoute => GoRouteData.$route(
  path: '/',
  factory: $HomeRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'ble',
      factory: $BleRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'peripheral',
          factory: $BlePeripheralRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'counter-display',
          factory: $CounterDisplayRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'counter-remote/:deviceId',
          factory: $CounterRemoteRoute._fromState,
        ),
        GoRouteData.$route(
          path: ':deviceId',
          factory: $BleDeviceRoute._fromState,
        ),
      ],
    ),
  ],
);

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BleRoute on GoRouteData {
  static BleRoute _fromState(GoRouterState state) => const BleRoute();

  @override
  String get location => GoRouteData.$location('/ble');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BlePeripheralRoute on GoRouteData {
  static BlePeripheralRoute _fromState(GoRouterState state) =>
      const BlePeripheralRoute();

  @override
  String get location => GoRouteData.$location('/ble/peripheral');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CounterDisplayRoute on GoRouteData {
  static CounterDisplayRoute _fromState(GoRouterState state) =>
      const CounterDisplayRoute();

  @override
  String get location => GoRouteData.$location('/ble/counter-display');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CounterRemoteRoute on GoRouteData {
  static CounterRemoteRoute _fromState(GoRouterState state) =>
      CounterRemoteRoute(deviceId: state.pathParameters['deviceId']!);

  CounterRemoteRoute get _self => this as CounterRemoteRoute;

  @override
  String get location => GoRouteData.$location(
    '/ble/counter-remote/${Uri.encodeComponent(_self.deviceId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $BleDeviceRoute on GoRouteData {
  static BleDeviceRoute _fromState(GoRouterState state) =>
      BleDeviceRoute(deviceId: state.pathParameters['deviceId']!);

  BleDeviceRoute get _self => this as BleDeviceRoute;

  @override
  String get location =>
      GoRouteData.$location('/ble/${Uri.encodeComponent(_self.deviceId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
