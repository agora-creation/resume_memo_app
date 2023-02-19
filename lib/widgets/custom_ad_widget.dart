import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomAdWidget extends StatelessWidget {
  final BannerAd bannerAd;

  const CustomAdWidget({
    required this.bannerAd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFEFEFE),
        ),
        alignment: Alignment.center,
        width: bannerAd.size.width.toDouble(),
        height: bannerAd.size.height.toDouble(),
        child: AdWidget(ad: bannerAd),
      ),
    );
  }
}
