import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tmcars_clone/applications/settings_singleton.dart';
import 'package:tmcars_clone/core/lanuage_delagate.dart';
import 'package:tmcars_clone/data/providers/all_carbyid_provider.dart';
import 'package:tmcars_clone/data/providers/cars_catigorys_provider.dart';
import 'package:tmcars_clone/data/providers/cars_data_provider.dart';
import 'package:tmcars_clone/data/providers/cars_moders_provider.dart';
import 'package:tmcars_clone/data/providers/getUser_provider.dart';
import 'package:tmcars_clone/data/providers/get_allcars_provider.dart';
import 'package:tmcars_clone/data/providers/login_provider.dart';
import 'package:tmcars_clone/data/providers/register_provider.dart';
import 'package:tmcars_clone/presentation/pages/initial/initial.dart';
import 'package:tmcars_clone/utils/design/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('tk'),
        Locale('ru'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('tk'),
      startLocale: const Locale('tk'),
      child: MultiProvider(providers: [
        ChangeNotifierProvider<RegistrationProvider>(
          create: (_) => RegistrationProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider<SettingsSingleton>(
          create: (_) => SettingsSingleton(),
        ),
        ChangeNotifierProvider<GetUserProvider>(
          create: (_) => GetUserProvider(),
        ),
        ChangeNotifierProvider<CarsModelsProvider>(
          create: (_) => CarsModelsProvider(),
        ),
        ChangeNotifierProvider<CarsCatigorysProvider>(
          create: (_) => CarsCatigorysProvider(),
        ),
        ChangeNotifierProvider<CarsCatigorysByIdProvider>(
          create: (_) => CarsCatigorysByIdProvider(),
        ),
        ChangeNotifierProvider<AllCarsProvider>(
          create: (_) => AllCarsProvider(),
        ),
        ChangeNotifierProvider<AllCarsByIdProvider>(
          create: (_) => AllCarsByIdProvider(),
        ),
      ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, primaryColor: AppColors.primary),
      localizationsDelegates: [
        ...context.localizationDelegates,
        MaterialLocalizationTkDelegate(),
        CupertinoLocalizationTkDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const Initial(),
    );
  }
}
