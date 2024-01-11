// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recreate_with_czar/utilities/app_theme.dart';

class AppNavBar extends ConsumerWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = AppLocalizations.of(context)!;
    return BottomNavigationBar(
        elevation: 12,
        backgroundColor: AppColors.background,
        items: [
          BottomNavigationBarItem(
              label: language.home,
              activeIcon: SvgPicture.asset(
                "assets/navigation_icons/home.svg",
                color: AppColors.primary,
              ),
              icon: SvgPicture.asset("assets/navigation_icons/home.svg")),
          BottomNavigationBarItem(
              label: language.home,
              icon: SvgPicture.asset("assets/navigation_icons/home.svg")),
          BottomNavigationBarItem(
              label: language.home,
              icon: SvgPicture.asset("assets/navigation_icons/home.svg")),
        ]);
  }
}
