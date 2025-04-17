import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/controllers/auth_controller.dart';
import 'package:fruit_hup/core/services/single_tone_service.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruit_hup/cubit/signup_cubit/signup_state.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, email, password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthController>()),
      child: Scaffold(
        appBar: customAuthappBar(context, title: S.of(context).new_account),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  CustomAuthTextFeild(
                    onSaved: (p0) {
                      name = p0!;
                    },
                    obscureTex: false,
                    keyboardType: TextInputType.name,
                    hintText: S.of(context).full_name,
                  ),
                  SizedBox(height: 16),
                  CustomAuthTextFeild(
                    onSaved: (p0) {
                      email = p0!;
                    },
                    obscureTex: false,
                    keyboardType: TextInputType.emailAddress,
                    hintText: S.of(context).email,
                  ),
                  SizedBox(height: 16),
                  CustomAuthTextFeild(
                    onSaved: (p0) {
                      password = p0!;
                    },
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
                            color:
                                isRead ? AppColors.primaryColor : Colors.white,
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
                  Builder(
                    builder: (context) {
                      return BlocConsumer<SignupCubit, SignupState>(
                        listener: (context, state) {
                          if (state is SignupLoading) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          } else if (state is SignupSuccess) {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreen.routeName,
                            );
                          } else if (state is SignupFailure) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.error),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate() && isRead) {
                                _formKey.currentState!.save();
                                context.read<SignupCubit>().createUser(
                                  name,
                                  email,
                                  password,
                                );
                              } else if (!isRead) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("please read the terms"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                                return;
                              }
                            },
                            text: S.of(context).Createanewaccount,
                          );
                        },
                      );
                    },
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
        ),
      ),
    );
  }
}
