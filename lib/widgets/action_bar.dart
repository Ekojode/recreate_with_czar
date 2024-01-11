import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/locale_controller.dart';
import '../l10n/l10n.dart';
import '../utilities/app_theme.dart';

class ActionBar extends ConsumerWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.ash1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton<SupportedLocale>(
            child: Row(
              children: [
                Text(
                  language.flag,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(
                  "assets/action_bar_icons/down.svg",
                  width: 12,
                )
              ],
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: SupportedLocale.en,
                  child: Text(language.english),
                ),
                PopupMenuItem(
                  value: SupportedLocale.fr,
                  child: Text(language.french),
                ),
                PopupMenuItem(
                  value: SupportedLocale.es,
                  child: Text(language.spanish),
                ),
                PopupMenuItem(
                  value: SupportedLocale.de,
                  child: Text(language.german),
                ),
                PopupMenuItem(
                  value: SupportedLocale.it,
                  child: Text(language.italian),
                ),
              ];
            },
            onSelected: (locale) {
              // print(locale.code);
              ref.read(localeProvider.notifier).changeLocale(locale.code);
            },
          ),
          const ActionNum(
            image: "assets/action_bar_icons/fire.svg",
            num: "2",
          ),
          const ActionNum(
            image: "assets/action_bar_icons/goal.svg",
            num: "17",
          ),
          const ActionNum(image: "assets/action_bar_icons/notification.svg")
        ],
      ),
    );
  }
}

class ActionNum extends StatelessWidget {
  final String? num;
  final String image;

  const ActionNum({super.key, this.num, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          width: 15,
          height: 15,
        ),
        const SizedBox(width: 3),
        Text(
          num ?? "",
          style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
