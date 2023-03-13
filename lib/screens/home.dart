import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_memo_app/helpers/style.dart';
import 'package:resume_memo_app/screens/history.dart';
import 'package:resume_memo_app/screens/license.dart';
import 'package:resume_memo_app/screens/motivation.dart';
import 'package:resume_memo_app/screens/user.dart';
import 'package:resume_memo_app/widgets/custom_ad_widget.dart';
import 'package:resume_memo_app/widgets/custom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabsContent = [
    const UserScreen(),
    const HistoryScreen(),
    const LicenseScreen(),
    const MotivationScreen(),
  ];
  List<String> tabsName = [
    '個人情報',
    '学歴・職歴',
    '免許・資格',
    '志望動機など',
  ];

  final BannerAd bannerAd = BannerAd(
    adUnitId: Platform.isAndroid ? androidAdUnitId : iosAdUnitId,
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) {},
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        ad.dispose();
      },
      onAdOpened: (Ad ad) {},
      onAdClosed: (Ad ad) {},
      onAdImpression: (Ad ad) {},
    ),
  );

  Future initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initPlugin());
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('履歴書メモ > ${tabsName[currentIndex]}'),
        actions: [
          IconButton(
            onPressed: () async {
              final pdf = pw.Document();
              final font = await rootBundle.load(
                'assets/fonts/SourceHanSerif-Regular.otf',
              );
              final ttf = pw.Font.ttf(font);
              pdf.addPage(pw.Page(
                pageFormat: PdfPageFormat.a3,
                build: (context) => pw.Column(
                  children: [
                    pw.Text('島村裕太'),
                  ],
                ),
              ));
              final file = File('example.pdf');
              await file.writeAsBytes(await pdf.save());
            },
            icon: const Icon(Icons.print, color: Colors.blue),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomAdWidget(bannerAd: bannerAd),
          Expanded(
            child: tabsContent[currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
