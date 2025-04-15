import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_images.dart' show Assets;
import 'package:fruit_hup/widgets/boarding_item.dart';

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
                BoardingItem(
                  isVisible: true,
                  backGroundImage: Assets.assetsImagesOnBoardingBack1Image,
                  image: Assets.assetsImagesOnBoarding1Image,
                  title: Text('Title 1'),
                  subTitle: 'Subtitle 1',
                ),
                BoardingItem(
                  isVisible: false,
                  backGroundImage: Assets.assetsImagesOnBoardingBack2Image,
                  image: Assets.assetsImagesOnBoarding2Image,
                  title: Text('Title 2'),
                  subTitle: 'Subtitle 2',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
