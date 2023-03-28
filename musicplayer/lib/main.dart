import 'package:flutter/material.dart';
import 'package:music_player/components/theme.dart';
import '/views/home.dart';
import '/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musicplayer',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: MusicPlayerTheme().primaryAppBarColor)),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
