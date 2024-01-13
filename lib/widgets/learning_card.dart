import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utilities/utilities.dart';

class LearningCard extends StatelessWidget {
  final String title;
  final String image;
  final int percent;
  const LearningCard(
      {super.key,
      required this.title,
      required this.image,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;
    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.5),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            image,
            width: 33,
            height: 33,
          ),
          const SizedBox(height: 5),
          Text(title,
              style: GoogleFonts.josefinSans(
                  fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 5),
          Text(
            "${language.youCompleted} $percent%",
            style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.ash1),
          ),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            minHeight: 8,
            borderRadius: BorderRadius.circular(20),
            value: percent / 100,
            color: AppColors.primary,
            backgroundColor: AppColors.ash1,
            //   valueColor: AppColors.primary,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
