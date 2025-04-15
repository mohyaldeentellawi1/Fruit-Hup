import 'package:flutter/material.dart';
import 'package:fruit_hup/core/services/cache_service.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart' show Assets;
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:fruit_hup/screens/auth/login_screen.dart';
import 'package:fruit_hup/widgets/custom_boarding_item.dart';
import 'package:fruit_hup/widgets/custom_indicator.dart' show CustomIndicator;

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});
  static const String routeName = "boarding";

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  late PageController pageController;

  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                CustomBoardingItem(
                  isVisible: true,
                  backGroundImage: Assets.assetsImagesOnBoardingBack1Image,
                  image: Assets.assetsImagesOnBoarding1Image,
                  title: Text(
                    S.of(context).search_shop,
                    style: AppTextStyle.bold23,
                  ),
                  subTitle: S.of(context).We_offer_you_the_finest,
                ),
                CustomBoardingItem(
                  isVisible: false,
                  backGroundImage: Assets.assetsImagesOnBoardingBack2Image,
                  image: Assets.assetsImagesOnBoarding2Image,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).welcome_to,
                        style: AppTextStyle.bold23,
                      ),
                      SizedBox(width: 10),
                      Localizations.localeOf(context).languageCode == "en"
                          ? Wrap(
                            children: [
                              Text(
                                S.of(context).Fruit,
                                style: AppTextStyle.bold23.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              Text(
                                S.of(context).hup,
                                style: AppTextStyle.bold23.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          )
                          : Wrap(
                            children: [
                              Text(
                                S.of(context).hup,
                                style: AppTextStyle.bold23.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                S.of(context).Fruit,
                                style: AppTextStyle.bold23.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),
                  subTitle:
                      S
                          .of(context)
                          .Discover_a_unique_shopping_experience_with_FruitHUB,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIndicator(isActive: currentIndex >= 0),
              SizedBox(width: 10),
              CustomIndicator(isActive: currentIndex >= 1),
            ],
          ),
          currentIndex == 0 ? SizedBox(height: 85) : SizedBox(height: 29),
          Visibility(
            visible: currentIndex == 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                onPressed: () {
                  CacheService.save(key: "boarding_seen", value: true);
                  Navigator.pushReplacementNamed(
                    context,
                    LoginScreen.routeName,
                  );
                },
                text: S.of(context).get_started,
              ),
            ),
          ),
          SizedBox(height: 45),
        ],
      ),
    );
  }
}
