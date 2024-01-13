import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/controllers.dart';
import '../models/models.dart';
import '../utilities/utilities.dart';
import '../widgets/widgets.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = AppLocalizations.of(context)!;
    final width = MediaQuery.sizeOf(context).width;

    ref.read(localeProvider.notifier).initializeLocale();

    final List<LearningModel> learningList = [
      LearningModel(
          title: language.reading,
          image: "assets/learning_icons/read.svg",
          percent: 50),
      LearningModel(
          title: language.listen,
          image: "assets/learning_icons/listen.svg",
          percent: 50),
      LearningModel(
          title: language.writing,
          image: "assets/learning_icons/write.svg",
          percent: 70),
      LearningModel(
          title: language.speaking,
          image: "assets/learning_icons/speak.svg",
          percent: 25),
      LearningModel(
          title: language.books,
          image: "assets/learning_icons/books.svg",
          percent: 80),
      LearningModel(
          title: language.quiz,
          image: "assets/learning_icons/quiz.svg",
          percent: 40),
      LearningModel(
          title: language.technologies,
          image: "assets/learning_icons/read.svg",
          percent: 40),
      LearningModel(
          title: language.exercise,
          image: "assets/learning_icons/read.svg",
          percent: 50)
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(child: ActionBar()),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.userBackground,
                  child: Image.asset("assets/action_bar_icons/memoji.png"),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      language.your,
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: AppColors.altPrimary),
                    ),
                    // const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.8,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              language.learningSphere,
                              maxLines: 1,
                              style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: AppColors.altPrimary),
                            ),
                          ),
                        ),
                        SvgPicture.asset("assets/general_icons/sphere.svg")
                      ],
                    ),
                    const SizedBox(height: 10),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: width < 359
                                ? 0.7
                                : width < 375
                                    ? 1.01
                                    : (width > 480 && width < 760)
                                        ? 0.875
                                        : 1,
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 20,
                            crossAxisCount: width < 480
                                ? 2
                                : width < 760
                                    ? 3
                                    : 4),
                        itemCount: learningList.length,
                        itemBuilder: (context, i) {
                          final learnModel = learningList[i];

                          return LearningCard(
                              title: learnModel.title,
                              image: learnModel.image,
                              percent: learnModel.percent);
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
