import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/ui/tab_manager.dart';
import 'package:flutter/material.dart';

class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CovidApp',
      initialRoute: Routes.tabManager,
      routes: {
        Routes.tabManager: (ctx) => TabManager()
      },
    );
  }
}