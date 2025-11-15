import 'package:e_commerce/utils/routes/route_manager.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Application',
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      initialRoute: RouteManager.getStartedPage,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
