part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  
  static const DASHBOARD = _Paths.DASHBOARD;
  static const REGISTRATION = _Paths.REGISTRATION;
}

abstract class _Paths {
  _Paths._();
  
  static const DASHBOARD = '/dashboard';
  static const REGISTRATION = '/registration';
}