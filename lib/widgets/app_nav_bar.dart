// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/page_controller.dart';
import '../utilities/app_theme.dart';

class AppNavBar extends ConsumerWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = AppLocalizations.of(context)!;
    final pageController = ref.watch(pageProvider);
    return BottomNavigationBar(
        elevation: 12,
        backgroundColor: AppColors.background,
        type: BottomNavigationBarType.fixed,
        currentIndex: pageController.pageIndex,
        onTap: (value) {
          pageController.switchPage(value);
        },
        selectedFontSize: 11,
        selectedItemColor: AppColors.primary,
        selectedLabelStyle: GoogleFonts.josefinSans(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
              label: language.home,
              activeIcon: const BottomBarIcon(
                  isActive: true, icon: "assets/navigation_icons/home.svg"),
              icon: const BottomBarIcon(
                  isActive: false, icon: "assets/navigation_icons/home.svg")),
          BottomNavigationBarItem(
              label: language.lesson,
              activeIcon: const BottomBarIcon(
                  isActive: true, icon: "assets/navigation_icons/lesson.svg"),
              icon: const BottomBarIcon(
                  isActive: false, icon: "assets/navigation_icons/lesson.svg")),
          BottomNavigationBarItem(
              label: language.exercise,
              activeIcon: const BottomBarIcon(
                  isActive: true, icon: "assets/navigation_icons/exercise.svg"),
              icon: const BottomBarIcon(
                  isActive: false,
                  icon: "assets/navigation_icons/exercise.svg")),
          BottomNavigationBarItem(
              label: language.games,
              activeIcon: const BottomBarIcon(
                  isActive: true, icon: "assets/navigation_icons/games.svg"),
              icon: const BottomBarIcon(
                  isActive: false, icon: "assets/navigation_icons/games.svg")),
          BottomNavigationBarItem(
              label: language.chats,
              activeIcon: const BottomBarIcon(
                  isActive: true, icon: "assets/navigation_icons/chats.svg"),
              icon: const BottomBarIcon(
                  isActive: false, icon: "assets/navigation_icons/chats.svg")),
        ]);
  }
}

class BottomBarIcon extends StatelessWidget {
  final bool isActive;
  final String icon;
  const BottomBarIcon({super.key, required this.isActive, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 5,
            width: 30,
            decoration: BoxDecoration(
                color: isActive ? AppColors.primary : null,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
          ),
          const SizedBox(height: 5),
          SvgPicture.asset(
            icon,
            color: isActive ? AppColors.primary : null,
          ),
        ],
      ),
    );
  }
}
