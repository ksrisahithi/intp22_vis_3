import 'package:get/get.dart';
import '../views/homepage.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.homepage;

  static final routes = [
    GetPage(
      name: _Paths.homepage, 
      page: () => HomePage(),
    ),
    GetPage(
      name: _Paths.porders, 
      page: () => POrdersPage(),
      arguments: const []
    ),
    GetPage(
      name: _Paths.corders, 
      page: () => const COrdersPage(),
      arguments: const []
    ),
  ];
}