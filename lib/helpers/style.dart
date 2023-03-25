import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFEFEFE),
    fontFamily: 'SourceHanSerif-Regular',
    appBarTheme: const AppBarTheme(
      color: Color(0xFFFEFEFE),
      elevation: 0,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        color: Color(0xFF333333),
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'SourceHanSerif-Bold',
      ),
      iconTheme: IconThemeData(color: Color(0xFF333333)),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color(0xFF333333), fontSize: 18),
      bodyText2: TextStyle(color: Color(0xFF333333), fontSize: 18),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

const String androidAdUnitId = 'ca-app-pub-9791675225952080/8010777372'; //本番
//const String androidAdUnitId = 'ca-app-pub-3940256099942544/6300978111'; //テスト
const String iosAdUnitId = 'ca-app-pub-9791675225952080/5787374061'; //本番
//const String iosAdUnitId = 'ca-app-pub-3940256099942544/2934735716'; //テスト
