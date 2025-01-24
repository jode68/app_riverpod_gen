import 'package:get/get.dart';
import 'package:template68/screens/detail/detail_page.dart';
import 'package:template68/screens/home/home_page.dart';

class Routes {
  static const String homePage = '/homePage';
  static const String detailPage = '/detailPage';

  static final routes = [
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(name: detailPage, page: () => const DetailPage()),
  ];
}
