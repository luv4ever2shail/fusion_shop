import 'dart:io';
import 'package:fusion_shop/src/config/MyCart.dart';
import 'package:fusion_shop/src/config/MyItems.dart';
import 'package:fusion_shop/src/config/route.dart';
import 'package:fusion_shop/src/pages/HomeScreen.dart';
import 'package:fusion_shop/src/themes/theme.dart';
import 'package:fusion_shop/src/widgets/BottomNavigationBar/bottomTabScreen.dart';
import 'package:fusion_shop/src/widgets/appRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyItems>(
          create: (_) => MyItems.instance(),
        ),
        ChangeNotifierProvider<MyCart>(
          create: (_) => MyCart.instance(),
        ),
      ],
      child: MaterialApp(
        title: 'Fusion Shop',
        theme: ThemeData(
          textTheme: AppTheme.textTheme,
          platform: TargetPlatform.iOS,
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.getRoute(),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name.contains('home')) {
            return AppRoutes<bool>(
                builder: (BuildContext context) => HomeScreen());
          } else {
            return AppRoutes<bool>(
                builder: (BuildContext context) => BottomTabScreen());
          }
        },
        initialRoute: "BottomTabScreen",
      ),
    );
  }
}
