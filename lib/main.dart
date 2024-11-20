import 'package:departure_gita/provider/data_provider.dart';
import 'package:departure_gita/provider/lag_provider.dart';
import 'package:departure_gita/provider/them_provider.dart';
import 'package:departure_gita/screens/detail_screen.dart';
import 'package:departure_gita/screens/home_screen.dart';
import 'package:departure_gita/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
bool isLightMode = prefs.getBool('isLightMode') ?? true;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LagProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()..themeModel.isLight = isLightMode),
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData.light(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white
            ),
            dropdownMenuTheme: DropdownMenuThemeData(
              menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
          darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.black
            )
          ),
          themeMode: Provider.of<ThemeProvider>(context).themeModel.isLight
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "home_page": (context) => HomeScreen(),
            "/": (context) => SplashScreen(),
            "detail_page": (context) => DetailPage(),
          },
        );
      },
    ),
  );
}
