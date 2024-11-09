import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wire_sense/main.dart';
import '../Services/global.dart';
class appPages {
  static List<RouteEntity> routes() {
    return [
      // RouteEntity(
      //     path: AppRoutes.SPLASH,
      //     page: const ProviderScope(child: SplashScreen())),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print('current route name is ${settings.name}');
    }
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      //   bool userRegisteredEarlier =
      //   Global.storageServices.getUserRegisteredEarlier();
      //   bool locationGranted = Global.storageServices.getLocationGranted();
      //
      //   bool openedFirstTime = Global.storageServices.getOpenedFirstTime();
      //
      //   /// NOW HERE WE ARE CHECKING IF THE CURRENT ROUTE IS WELCOME PAGE ROUTE AND Device has been opened earlier...
      //   /// and if it is true then navigate the user to the login screen..not to the welcome screen anymore
      //   /// NOTE- THIS INFORMATION WHETHER THE DEVICE IS OPENED FIRST TIME OR NOT WILL BE STORED UNDER THE getDeviceOpenedEarlier()
      //   /// FUNCTION OF STORAGE SERVICES WHICH IS CAPABLE OF STORING THE STATE EVEN IF THE APP IS CLOSED....
      //   ///  THIS STATE OF getDeviceOpenedEarlier() WILL BE STORED IN THE PERMANENT MEMORY...
      //   if (result.first.path == AppRoutes.WELCOME && !openedFirstTime) {
      //     {
      //       bool isLoggedIn = userRegisteredEarlier;
      //       if (isLoggedIn) {
      //         bool isLocationGranted = locationGranted;
      //         if (isLocationGranted) {
      //           return MaterialPageRoute(
      //               builder: (_) =>
      //               const ProviderScope(child: Application()),
      //               settings: settings);
      //         } else {
      //           return MaterialPageRoute(
      //               builder: (_) =>
      //               const ProviderScope(child: LocationRequestScreen()),
      //               settings: settings);
      //         }
      //       } else {
      //         return MaterialPageRoute(
      //             builder: (_) => const ProviderScope(child: SignUpScreen()),
      //             settings: settings);
      //       }
      //     }
      //   } else {
      //     return MaterialPageRoute(
      //         builder: (_) => result.first.page, settings: settings);
      //   }
      // }
    }
    return MaterialPageRoute(
        builder: (_) => const ProviderScope(child: TestScreen()),
        settings: settings);
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}
