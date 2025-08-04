import 'package:eco_mart/app/app_routes.dart';
import 'package:eco_mart/app/app_theme.dart';
import 'package:eco_mart/app/controller_binder.dart';
import 'package:eco_mart/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      initialBinding: ControllerBinder(),
      theme: AppTheme.lightThemeData,
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

