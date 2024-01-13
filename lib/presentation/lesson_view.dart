import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/models.dart';
import '../utilities/utilities.dart';
import '../widgets/widgets.dart';

class LessonView extends ConsumerWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = AppLocalizations.of(context)!;
    final List<LessonModel> lessonModels = [
      LessonModel(
          title: language.firstTrip,
          description: language.firstTripDescription,
          image: "assets/lesson_images/firsttrip.png",
          color: const Color(0XFFE16723)),
      LessonModel(
          title: language.freelance,
          description: language.freelanceDescription,
          image: "assets/lesson_images/freelance.png",
          color: AppColors.ash1),
      LessonModel(
          title: language.firstMeeting,
          description: language.firstMeetingDescription,
          image: "assets/lesson_images/firstmeeting.png",
          color: const Color(0XFFCB9937)),
      LessonModel(
          title: language.partnersMeeting,
          description: language.partnersMeetingDescription,
          image: "assets/lesson_images/partnersmeeting.png",
          color: AppColors.black.withOpacity(0.89)),
    ];
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ActionBar(),
          ),
          const SizedBox(height: 20),
          const LessonSelector(),
          const SizedBox(height: 10),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                    //   physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lessonModels.length,
                    itemBuilder: (context, i) {
                      final lesson = lessonModels[i];
                      return LessonCard(
                          image: lesson.image,
                          title: lesson.title,
                          color: lesson.color,
                          description: lesson.description);
                    })),
          )
        ],
      ),
    ));
  }
}
