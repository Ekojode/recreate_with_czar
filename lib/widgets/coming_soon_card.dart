import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utilities/utilities.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({super.key});

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/general_icons/bro.svg"),
        const SizedBox(height: 10),
        SizedBox(
          width: 275,
          child: Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset("assets/general_icons/loading.svg"),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          language.comingSoon,
          style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w600,
              fontSize: 32,
              color: AppColors.primary),
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            const SizedBox(width: double.infinity),
            Center(
              child: Container(
                width: 195,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  language.comingSoonMessage,
                  style: GoogleFonts.josefinSans(
                      fontSize: 14, color: const Color(0XFF616161)),
                ),
              ),
            ),
            Positioned(
                left: width < 310 ? 10 : 40,
                top: 20,
                child: SvgPicture.asset("assets/general_icons/bolt.svg"))
          ],
        )
      ],
    );
  }
}
