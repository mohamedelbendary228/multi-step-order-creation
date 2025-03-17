import 'package:baridx_order_creation/core/resources/app_theme.dart';
import 'package:baridx_order_creation/features/order_steps_flow/presentation/cubit/order_steps_cubit.dart';
import 'package:baridx_order_creation/injection_contianer.dart';
import 'package:baridx_order_creation/routes/router.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<OrderStepsCubit>(),
        )
      ],
      child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(430, 932),
          builder: (context, widget) {
            return MaterialApp.router(
              title: 'Order Creation',
              debugShowCheckedModeBanner: false,
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.5),
                  ),
                  child: widget!,
                );
              },
              theme: AppTheme.appTheme,
              routerConfig: router,
              locale: const Locale("en"),
              localizationsDelegates: const [
                CountryLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          }),
    );
  }
}
