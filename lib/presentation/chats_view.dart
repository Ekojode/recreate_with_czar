import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/widgets.dart';

class ChatsView extends ConsumerWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: ComingSoonCard());
  }
}
