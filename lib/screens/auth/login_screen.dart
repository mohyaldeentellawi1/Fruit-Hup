import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:fruit_hup/widgets/custom_auth_app_bar.dart';
import 'package:fruit_hup/widgets/custom_social_buttom.dart';
import 'package:fruit_hup/widgets/or_divider.dart';

import '../../widgets/custom_auth_text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVsisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthappBar(context, title: S.of(context).sign_in),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomAuthTextFeild(
                obscureTex: false,
                keyboardType: TextInputType.emailAddress,
                hintText: S.of(context).email,
              ),
              SizedBox(height: 16),
              CustomAuthTextFeild(
                obscureTex: isVsisible,
                keyboardType: TextInputType.visiblePassword,
                hintText: S.of(context).password,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVsisible = !isVsisible;
                    });
                  },
                  child: Icon(
                    Icons.visibility_outlined,
                    color: Color(0xffC9CECF),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).forgot_password,
                    style: AppTextStyle.semiBold13.copyWith(
                      color: AppColors.primaryLightColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              CustomButton(onPressed: () {}, text: S.of(context).sign_in),
              SizedBox(height: 33),
              Text.rich(
                TextSpan(
                  text: S.of(context).dont_have_an_account,
                  style: AppTextStyle.semiBold16.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                  children: [
                    TextSpan(
                      text: " ${S.of(context).create_an_account}",
                      style: AppTextStyle.semiBold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              OrDivider(),
              SizedBox(height: 16),
              CustomSocialButtom(
                assetName: Assets.assetsImagesGoogle,
                title: S.of(context).sign_in_with_google,
                onPressed: () {},
              ),
              SizedBox(height: 16),
              CustomSocialButtom(
                assetName: Assets.assetsImagesApple,
                title: S.of(context).sign_in_with_apple,
                onPressed: () {},
              ),
              SizedBox(height: 16),
              CustomSocialButtom(
                assetName: Assets.assetsImagesFacebook,
                title: S.of(context).sign_in_with_facebook,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
