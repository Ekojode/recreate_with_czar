import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/utilities.dart';

class LessonCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Color color;
  const LessonCard(
      {super.key,
      required this.image,
      required this.title,
      required this.color,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(image),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.josefinSans(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                        width: width * 0.45,
                        child: Text(
                          description,
                          style: GoogleFonts.josefinSans(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        )),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
          Positioned(
              bottom: 0,
              right: 10,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: color,
                child: SvgPicture.asset("assets/general_icons/play_icon.svg"),
              ))
        ],
      ),
    );
  }
}
