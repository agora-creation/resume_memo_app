import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:resume_memo_app/helpers/style.dart';
import 'package:resume_memo_app/screens/history.dart';
import 'package:resume_memo_app/screens/license.dart';
import 'package:resume_memo_app/screens/motivation.dart';
import 'package:resume_memo_app/screens/user.dart';
import 'package:resume_memo_app/widgets/custom_ad_widget.dart';
import 'package:resume_memo_app/widgets/custom_navigation_bar.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

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
              PdfDocument document = PdfDocument();
              document.pages.add().graphics.drawString(
                    'HelloWorld',
                    PdfStandardFont(PdfFontFamily.helvetica, 12),
                    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                    bounds: const Rect.fromLTWH(0, 0, 150, 20),
                  );
              File('HelloWorld.pdf').writeAsBytes(await document.save());
              document.dispose();
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
