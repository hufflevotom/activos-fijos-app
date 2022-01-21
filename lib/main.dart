import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:activos_fijos_app/Pages/pages.dart';
import 'package:activos_fijos_app/Services/services.dart';
import 'package:activos_fijos_app/Utils/Styles/styles.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginService()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Chutana',
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreen(),
        'home': (_) => const HomeScreen(),
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: CustomColors.azul_100,
          ),
          fontFamily: 'NoirPro'),
    );
  }
}
