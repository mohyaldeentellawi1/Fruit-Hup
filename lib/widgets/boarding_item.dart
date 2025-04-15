import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({
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
                  child: Text('Skip'),
                ),
              ),
            ],
          ),
        ),
        title,
        Text(subTitle),
      ],
    );
  }
}
