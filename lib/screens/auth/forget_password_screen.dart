import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:fruit_hup/widgets/custom_auth_app_bar.dart';
import 'package:fruit_hup/widgets/custom_auth_text_feild.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const String routeName = "forget_password";

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthappBar(context, title: S.of(context).forgot_passwordd),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      S.of(context).Dontworryjustenteryourphonenumber,
                      style: AppTextStyle.semiBold16.copyWith(
                        color: const Color(0xFF616A6B),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              CustomAuthTextFeild(
                hintText: S.of(context).phone_number,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 50),
              CustomButton(
                onPressed: () {},
                text: S.of(context).forgot_passworddd,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
