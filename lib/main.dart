import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'controllers/locale_controller.dart';
import 'l10n/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final appLocale = ref.watch(localeProvider).appLocale;
      return MaterialApp(
        title: 'Flutter Demo',
        supportedLocales: L10n.all,
        locale: appLocale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageConsumerState();
}

class _MyHomePageConsumerState extends ConsumerState<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    ref.read(localeProvider.notifier).initializeLocale();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              language.flag,
              style: const TextStyle(fontSize: 30),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            PopupMenuButton<SupportedLocale>(
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
