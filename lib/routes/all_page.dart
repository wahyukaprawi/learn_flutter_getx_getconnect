import 'package:get/get.dart';
import 'package:learn_flutter_getx_getconnect/bindings/add_bindings.dart';
import 'package:learn_flutter_getx_getconnect/bindings/profile_bindings.dart';
import 'package:learn_flutter_getx_getconnect/pages/adduser_page.dart';
import 'package:learn_flutter_getx_getconnect/pages/user_page.dart';
import 'package:learn_flutter_getx_getconnect/pages/profile_page.dart';
import 'package:learn_flutter_getx_getconnect/routes/route_name.dart';

class AllPage {
  static final pages = [
    GetPage(
      name: RoutedName.userpage,
      page: () => const UserPage(),
    ),
    GetPage(
      name: RoutedName.adduserpage,
      page: () => AdduserPage(),
      binding: AddBindings()
    ),
    GetPage(
      name: RoutedName.profilepage,
      page: () => ProfilePage(),
      binding: ProfileBindings()
    ),
  ];
}
