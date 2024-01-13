import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utilities/utilities.dart';

class LessonSelector extends StatefulWidget {
  const LessonSelector({super.key});

  @override
  State<LessonSelector> createState() => _LessonSelectorState();
}

class _LessonSelectorState extends State<LessonSelector> {
  String lessonState = "audio";

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.ash1.withOpacity(0.5))),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SelectorChip(
              isActive: lessonState == "audio",
              text: language.audio,
              onSelected: () {
                setState(() {
                  lessonState = "audio";
                });
              },
            ),
          ),
          Expanded(
            child: SelectorChip(
              isActive: lessonState == "video",
              text: language.video,
              onSelected: () {
                setState(() {
                  lessonState = "video";
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SelectorChip extends StatelessWidget {
  final bool isActive;
  final String text;
  final VoidCallback onSelected;
  const SelectorChip(
      {super.key,
      required this.isActive,
      required this.text,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: isActive ? AppColors.primary : AppColors.background,
      backgroundColor: AppColors.background,
      onSelected: (value) {
        onSelected();
      },
      //padding: EdgeInsetsDirectional.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 20),

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: AppColors.background)),
      labelStyle: GoogleFonts.josefinSans(
          fontSize: 16,
          // color: AppColors.white,
          color: isActive ? AppColors.white : AppColors.ash1,
          fontWeight: FontWeight.w500),
      showCheckmark: false,
      label: Text(
        text,
        style: GoogleFonts.josefinSans(
            fontSize: 16,
            //  color: AppColors.white,
            color: isActive ? AppColors.white : AppColors.ash1,
            fontWeight: FontWeight.w500),
      ),
      selected: isActive,
    );
  }
}
