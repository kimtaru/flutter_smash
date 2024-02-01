import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_base/app.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    //const MyApp()
    EasyLocalization(
      supportedLocales: const [
        Locale('ko'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ko'),
      useOnlyLangCode: true,
      child: const GetMaterialApp(home: MyApp()),
    ),
  );
}
