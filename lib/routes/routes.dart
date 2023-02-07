import '../export.dart';

class AppRoutes {
  static String initialRoute = '/initialRoute';
  static String universityList = '/university';
  static String getStarted = '/getStarted';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: getStarted,
      page: () => const GetStarted(),
    ),
    GetPage(
      name: universityList,
      page: () => const ListUniversityScreen(),
    ),
  ];
}
