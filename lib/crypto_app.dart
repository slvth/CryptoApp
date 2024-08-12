import 'package:flutter/material.dart';
import 'router/route.dart';
import 'theme/theme.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
