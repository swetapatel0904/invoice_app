import 'package:flutter/cupertino.dart';
import '../screen/bill/bill_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/signIn/signIn_screen.dart';
import '../screen/splash/splash_screen.dart';

Map<String,WidgetBuilder> app_route={
  "/":(context) => SplashScreen(),
  "sign":(context) => SignInScreen(),
  "home":(context) => HomeScreen(),
  "bill":(context) => BillScreen(),
};