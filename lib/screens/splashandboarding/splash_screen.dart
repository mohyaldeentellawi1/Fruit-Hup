import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/services/cache_service.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/screens/auth/login_screen.dart';
import 'package:fruit_hup/screens/splashandboarding/boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    excuteNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment:
                Localizations.localeOf(context).languageCode == "ar"
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [SvgPicture.asset(Assets.assetsImagesPlant)],
          ),
          SvgPicture.asset(Assets.assetsImagesLogo),
          SvgPicture.asset(Assets.assetsImagesSplashbottom, fit: BoxFit.fill),
        ],
      ),
    );
  }

  void excuteNavigate() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        bool? boardingSeen =
            CacheService.sharedPreferences.getBool("boarding_seen") ?? false;
        if (boardingSeen) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, BoardingScreen.routeName);
        }
      }
    });
  }
}
