import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/controllers.dart';
import '../utilities/utilities.dart';
import '../widgets/widgets.dart';
import 'presentation.dart';

class DashbaordView extends ConsumerWidget {
  const DashbaordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(pageProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: pageController.pageIndex,
        children: const [
          HomeView(),
          LessonView(),
          ExerciseView(),
          GamesView(),
          ChatsView()
        ],
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}
