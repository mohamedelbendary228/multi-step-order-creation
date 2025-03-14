import 'package:baridx_order_creation/core/resources/app_theme.dart';
import 'package:baridx_order_creation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(430, 932),
        builder: (context, widget) {
          return MaterialApp.router(
            title: 'Order Creation',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
            routerConfig: router,
          );
        });
  }
}
