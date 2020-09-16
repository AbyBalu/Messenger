import 'package:flutter/material.dart';
import 'package:greenlight_messenger/provider/image_upload_provider.dart';
import 'package:greenlight_messenger/provider/user_provider.dart';
import 'package:greenlight_messenger/screens/home_screen.dart';
import 'package:greenlight_messenger/screens/login_screen.dart';
import 'package:greenlight_messenger/screens/search_screen.dart';
import 'package:greenlight_messenger/screens/signup_screen.dart';
import 'package:greenlight_messenger/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageUploadProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
      title: "GreenLight",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        fontFamily: 'Raleway',
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.greenAccent,
        fontFamily: 'Raleway',
        brightness: Brightness.dark,
      ),
      home: SplashScreen(),
      //home: HomeScreen(),
      initialRoute: '/',
      routes: {
        SignUpScreen.routeName: (context) => SignUpScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        '/search_screen': (context) => SearchScreen(),
        //DemoII.routeName: (context) => DemoII(),
      },
      )
    );
  }
}