import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/services/cache_service.dart' show CacheService;
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:fruit_hup/screens/auth/login_screen.dart';

class CustomBoardingItem extends StatelessWidget {
  const CustomBoardingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.backGroundImage,
    required this.image,
    required this.isVisible,
  });

  final Widget title;
  final String subTitle, backGroundImage, image;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backGroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                  child: GestureDetector(
                    onTap: () {
                      CacheService.save(key: "boarding_seen", value: true);
                      Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      );
                    },
                    child: Text(
                      S.of(context).skip,
                      style: AppTextStyle.regular13.copyWith(
                        color: Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.semiBold13,
          ),
        ),
      ],
    );
  }
}
