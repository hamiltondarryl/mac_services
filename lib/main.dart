import 'package:flutter/material.dart';
import 'package:mac_services/config/colors.dart';
import 'package:mac_services/providers/cart_provider.dart';
import 'package:mac_services/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CartProvider()),
      ],
      child: MaterialApp(
        title: 'Mac services',
        theme: ThemeData(
          primarySwatch: ColorsSys.redSy,
        ),
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
