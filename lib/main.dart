import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_appp/app_provider/app_provider.dart';
import 'package:movie_appp/firebase_options.dart';
import 'package:movie_appp/my_theme.dart';
import 'package:movie_appp/pages/home_screen/my_bloc_observer.dart';
import 'package:movie_appp/pages/init_route/init_route.dart';

import 'package:movie_appp/pages/watch_list/watch_list_view.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  // Ensure proper binding and initialization before any async operations.
  WidgetsFlutterBinding.ensureInitialized();

  // Set up Bloc observer for debugging and monitoring Bloc events.
  Bloc.observer = MyBlocObserver();

  // Initialize Firebase with platform-specific options.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable Firestore network; useful if previously disabled.
  await FirebaseFirestore.instance.enableNetwork();

  // Start the application with ChangeNotifierProvider for AppProvider.
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the AppProvider instance from the context.
    var provider = Provider.of<AppProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: Locale(provider.appLanguage),
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          initialRoute: InitRoute.routeName,
          routes: {
            InitRoute.routeName: (context) => InitRoute(),
          },
          theme: MyTheme.myTheme,
        );
      },
    );
  }
}
