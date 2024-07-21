import 'package:fashion_app/Men.dart';
import 'package:fashion_app/cartProvider.dart';
import 'package:fashion_app/onBoaarding.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) {
        return CartProvider();
      })
    ], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'men': (context) {
          return const Men();
        },
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(255, 255, 255, 1),
          buttonTheme: const ButtonThemeData(
            buttonColor: Color.fromRGBO(255, 122, 0, 1),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color.fromRGBO(3, 13, 14, 1),
            tertiary: const Color.fromRGBO(121, 119, 128, 1),
          )),
      home: const onBoarding(),
    );
  }
}
