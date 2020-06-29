import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/ui/tab_manager.dart';
import 'package:covid_app/ui/tips/mask/mask.dart';
import 'package:covid_app/ui/tips/wash/wash.dart';
import 'package:flutter/material.dart';

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CovidApp',
      theme: ThemeData(
        fontFamily: 'Poppins',
        backgroundColor: Color(0xCECECECE),
      ),
      initialRoute: Routes.tabManager,
      routes: {
        Routes.tabManager: (ctx) => TabManager(),
        Routes.wash: (ctx) => WashScreen(),
        Routes.mask: (ctx) => MaskScreen()
      },
    );
  }
}