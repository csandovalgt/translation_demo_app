import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lokalise_flutter_sdk/lokalise_flutter_sdk.dart';
import 'package:phrase_demo/app/app.bottomsheets.dart';
import 'package:phrase_demo/app/app.dialogs.dart';
import 'package:phrase_demo/app/app.locator.dart';
import 'package:phrase_demo/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'l10n/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await Lokalise.init(
    projectId: '4106468765121b2ad770b3.24671211',
    sdkToken: 'ced085256b93af1e634fcb5802e8cb9a69cb', // Make sure that the `sdkToken` is an SDK token (not an API token or JWT).
    preRelease: true, // Add this only if you want to use prereleases. Use the Bundle freeze functionality in production
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        Lt.delegate, // This adds Lt to the delegate call stack
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Lt.supportedLocales,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}


//https://ota.eu.phrase.com/
// 64666db55e7178a10a710f9327514f0a/
// Y728yrB1UNmYk-9g6mKKFiK2HU50LSzX2rlSg-7KNTU/
// en/
// arb?
// client=flutter
// sdk_version=1.0.5
// unique_identifier=59e3121f-f25a-4ba4-b5b2-d1e04dc52be6
// last_update=1695785025
// current_version=2
// app_version=0.1.0