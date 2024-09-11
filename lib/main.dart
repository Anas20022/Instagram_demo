import 'package:easy_localization/easy_localization.dart';
import 'package:first_project_1/models/sp_signIn.dart';
import 'package:first_project_1/views/screens/login_screen.dart';
import 'package:first_project_1/views/screens/out_boarding_screen.dart';
import 'package:first_project_1/views/screens/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SpHelperSignIn.spHelper.initSp();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
    designSize: const Size(448, 998),
    minTextAdapt: true,
    splitScreenMode: true,
      builder: (context,child) {
        return MaterialApp(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              //start and end this is width
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
            breakpointsLandscape: [
              const Breakpoint(start: 0, end: 1320, name: MOBILE),
              const Breakpoint(start: 1024, end: 1599, name: TABLET),
              const Breakpoint(start: 1600, end: double.infinity, name: DESKTOP),

            ]
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          // home: MainScreen(),
          // home: MainScreen(),
            initialRoute: "/",

            routes: {
              "/":(context)=>OutBoardingScreen(),
              "/login_screen":(context)=>LoginScreen(),
            },
            onGenerateRoute: (RouteSettings settings){
              return MaterialPageRoute(builder: (context)=>PageNotFound());
            }

        );
      }
    );
  }
}


