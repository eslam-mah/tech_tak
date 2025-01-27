import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tech_tak/core/config/colors_box.dart';
import 'package:tech_tak/core/responsive/responsive_manager.dart';
import 'package:tech_tak/core/utils/constants.dart';
import 'package:tech_tak/core/utils/router.dart';
import 'package:tech_tak/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Constants.supaBaseUrl,
    anonKey: Constants.supaBaseAnonKey,
  );
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => Directionality(
      textDirection: intl.Intl.getCurrentLocale() == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: const TechTak(),
    ),
  ));
}

class TechTak extends StatefulWidget {
  const TechTak({super.key});

  // ignore: library_private_types_in_public_api
  static _TechTakState? of(BuildContext context) =>
      context.findAncestorStateOfType<_TechTakState>();

  @override
  State<TechTak> createState() => _TechTakState();
}

class _TechTakState extends State<TechTak> {
  Locale _locale = const Locale('ar');

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    RM.data.init(context);

    // Dynamically set the font family based on the current locale
    final textTheme = ThemeData.light().textTheme.apply(
          fontFamily: _locale.languageCode == 'ar'
              ? GoogleFonts.almarai().fontFamily
              : GoogleFonts.aDLaMDisplay().fontFamily,
        );

    return MaterialApp.router(
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: Rout.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: textTheme,
        drawerTheme: const DrawerThemeData(
          backgroundColor: ColorsBox.white,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: ColorsBox.primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsBox.white,
        ),
        scaffoldBackgroundColor: ColorsBox.white,
      ),
    );
  }
}
