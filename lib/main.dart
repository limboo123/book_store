import 'package:book_store/Page/Cart_page.dart';
import 'package:book_store/Page/Favorite_page.dart';
import 'package:book_store/Page/Home_Page.dart';
import 'package:book_store/Page/Login_Page.dart';
import 'package:book_store/Page/book_details.dart';
import 'package:book_store/Page/bottom_navigator_bar.dart';
import 'package:book_store/Page/delivery_page.dart';
import 'package:book_store/Page/class.dart';
import 'package:book_store/Page/forgot_password.dart';
import 'package:book_store/Page/payment_page.dart';
import 'package:book_store/Page/profile_page.dart';
import 'package:book_store/Page/purchase.dart';
import 'package:book_store/Page/signin_page.dart';
import 'package:book_store/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ManageState()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Registration(),
    );
  }
}
