import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:fruit_hup/screens/auth/login_screen.dart';
import 'package:fruit_hup/widgets/custom_auth_app_bar.dart';
import 'package:fruit_hup/widgets/custom_auth_text_feild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVsisible = true;
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthappBar(context, title: S.of(context).new_account),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomAuthTextFeild(
                obscureTex: false,
                keyboardType: TextInputType.name,
                hintText: S.of(context).full_name,
              ),
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRead = !isRead;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: isRead ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              isRead
                                  ? AppColors.primaryColor
                                  : Color(0xFFDDDFDF),
                        ),
                      ),
                      child:
                          isRead
                              ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 20,
                              )
                              : const SizedBox(),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text.rich(
                        TextSpan(
                          text: S.of(context).Bycreatinganaccountyouagreeto,
                          style: AppTextStyle.semiBold16.copyWith(
                            color: Color(0xFF949D9E),
                          ),
                          children: [
                            TextSpan(
                              text: S.of(context).OurTermsandConditions,
                              style: AppTextStyle.semiBold16.copyWith(
                                color: AppColors.primaryLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              CustomButton(
                onPressed: () {},
                text: S.of(context).Createanewaccount,
              ),
              SizedBox(height: 33),
              Text.rich(
                TextSpan(
                  text: S.of(context).Alreadyhaveanaccount,
                  style: AppTextStyle.semiBold16.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                  children: [
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pushNamed(
                                  context,
                                  LoginScreen.routeName,
                                );
                              }
                            },
                      text: " ${S.of(context).sign_in}",
                      style: AppTextStyle.semiBold16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
