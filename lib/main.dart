import 'package:flutter/material.dart';
import 'package:worldtime/app_pages/home.dart';
import 'package:worldtime/app_pages/location.dart';
import 'package:worldtime/app_pages/loading_screen.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoadingScreen(),
          '/home': (context) => Home(),
          '/location': (context) => Location()
        },
      ),
    );
