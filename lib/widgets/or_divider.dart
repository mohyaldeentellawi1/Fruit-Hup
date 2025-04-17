import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_text_style.dart';
import 'package:fruit_hup/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        const SizedBox(width: 18),
        Text(S.of(context).or, style: AppTextStyle.semiBold16),
        const SizedBox(width: 18),
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
