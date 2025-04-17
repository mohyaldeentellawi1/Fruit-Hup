import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';

class CustomSocialButtom extends StatelessWidget {
  const CustomSocialButtom({
    super.key,
    required this.assetName,
    required this.title,
    required this.onPressed,
  });
  final String assetName, title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFDDDFDF)),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(assetName),
          title: Text(
            title,
            style: AppTextStyle.semiBold16,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
