import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/view/login.dart';
import 'package:internship/view/register.dart';
import 'package:internship/view/splash.dart';
void main() => runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/login', page: () =>Login()),
      GetPage(name: '/register',page: () =>Register())
    ]
    ,
    home:const Splash() ));
