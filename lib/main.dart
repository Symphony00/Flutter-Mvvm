import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/utils/routes/routes_Names.dart';
import 'package:mvvm/view_model/call_api_provider.dart';
import 'package:mvvm/view_model/user_model_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CallingApiProvider()),
        ChangeNotifierProvider(create: (_) => UserModelProvider())
      ],
      child: const MaterialApp(
        initialRoute: RoutesNames.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
