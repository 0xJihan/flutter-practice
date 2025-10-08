import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/CarouselDemoPage.dart';
import 'package:flutter_practice/TextFormValidation.dart';
import 'package:flutter_practice/Toast_Snacks.dart';
import 'package:flutter_practice/dio_product_example/ProductsListPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS))  {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 600),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setMinimumSize(const Size(800, 600));
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(
    ScreenUtilInit(
      designSize: const Size(411, 915),
      builder: (context,child)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Practice",
        home: child,

      ),
      child: TextFormValidationExample(),

    )
  );
}

