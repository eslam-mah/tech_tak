// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tech tak`
  String get title {
    return Intl.message(
      'Tech tak',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Choose your language`
  String get chooseLang {
    return Intl.message(
      'Choose your language',
      name: 'chooseLang',
      desc: '',
      args: [],
    );
  }

  /// `En`
  String get currentLang {
    return Intl.message(
      'En',
      name: 'currentLang',
      desc: '',
      args: [],
    );
  }

  /// `Your Digital Dreams, Built to Life!`
  String get slogan1 {
    return Intl.message(
      'Your Digital Dreams, Built to Life!',
      name: 'slogan1',
      desc: '',
      args: [],
    );
  }

  /// `Innovative Websites and Apps for a Smarter Future.`
  String get slogan2 {
    return Intl.message(
      'Transforming Concepts into Mobile Realities.',
      name: 'slogan2',
      desc: '',
      args: [],
    );
  }

  /// `Crafting Digital Experiences That Inspire.`
  String get slogan3 {
    return Intl.message(
      'Crafting Websites That Speak for Your Brand.',
      name: 'slogan3',
      desc: '',
      args: [],
    );
  }

  /// `Your Partner in Digital Growth.`
  String get slogan4 {
    return Intl.message(
      'Tech tak is Your Partner in Digital Growth.',
      name: 'slogan4',
      desc: '',
      args: [],
    );
  }

  /// `From Vision to Reality: Websites and Apps Done Right.`
  String get slogan5 {
    return Intl.message(
      'From Vision to Reality: Websites and Apps Done Right.',
      name: 'slogan5',
      desc: '',
      args: [],
    );
  }

  /// `Seamless Solutions for Your Digital Needs.`
  String get slogan6 {
    return Intl.message(
      'Seamless Solutions for Your Digital Needs.',
      name: 'slogan6',
      desc: '',
      args: [],
    );
  }

  /// `Building Your Online Presence with Precision.`
  String get slogan7 {
    return Intl.message(
      'Building Your Online Presence with Precision.',
      name: 'slogan7',
      desc: '',
      args: [],
    );
  }

  /// `Websites and Apps That Define Your Brand.`
  String get slogan8 {
    return Intl.message(
      'Websites and Apps That Define Your Brand.',
      name: 'slogan8',
      desc: '',
      args: [],
    );
  }

  /// `Simplifying Technology, Amplifying Results.`
  String get slogan9 {
    return Intl.message(
      'Simplifying Technology, Amplifying Results.',
      name: 'slogan9',
      desc: '',
      args: [],
    );
  }

  /// `Creating Digital Masterpieces for Your Business.`
  String get slogan10 {
    return Intl.message(
      'Creating Digital Masterpieces for Your Business.',
      name: 'slogan10',
      desc: '',
      args: [],
    );
  }

  String get bookNow {
    return Intl.message(
      'Start now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  String get bookingText {
    return Intl.message(
        'Build Your Website and Mobile App Today, Turn Your Vision into Reality!',
        name: 'bookingText',
        desc: '',
        args: []);
  }

  String get name {
    return Intl.message('name', name: 'name', desc: '', args: []);
  }

  String get projectDescription {
    return Intl.message('Project description',
        name: 'projectDescription', desc: '', args: []);
  }

  String get phoneNumber {
    return Intl.message('Phone number',
        name: 'phoneNumber', desc: '', args: []);
  }

  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  String get website {
    return Intl.message('Website', name: 'website', desc: '', args: []);
  }

  String get mobileApp {
    return Intl.message('Mobile App', name: 'mobileApp', desc: '', args: []);
  }

  String get submitText {
    return Intl.message(
        'Thank you for submitting your form! Our team will reach out to you as soon as possible.',
        name: 'submitText',
        desc: '',
        args: []);
  }

  String get backHome {
    return Intl.message('Back to Home', name: 'backHome', desc: '', args: []);
  }

  String get chooseCountry {
    return Intl.message('Choose your country',
        name: 'chooseCountry', desc: '', args: []);
  }

  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  String get projectType {
    return Intl.message('Project Type',
        name: 'projectType', desc: '', args: []);
  }

  String get fieldRequired {
    return Intl.message('This field is required',
        name: 'fieldRequired', desc: '', args: []);
  }

  String get yourName {
    return Intl.message('Your Name', name: 'yourName', desc: '', args: []);
  }

  String get yourNumber {
    return Intl.message('Your Phone Number',
        name: 'yourNumber', desc: '', args: []);
  }

  String get describe {
    return Intl.message('Describe Your Project',
        name: 'describe', desc: '', args: []);
  }

  String get choose {
    return Intl.message('Choose Project Type',
        name: 'choose', desc: '', args: []);
  }

  String get ourProjects {
    return Intl.message(
      'Our Projects',
      name: 'ourProjects',
      desc: '',
      args: [],
    );
  }

  String get description {
    return Intl.message(
      'Every Line of Code is Designed to Shield Your Business and Users.',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  String get error {
    return Intl.message(
      'Error sending data, please try again later.',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  String get visitWebsite {
    return Intl.message(
      'Visit Website',
      name: 'visitWebsite',
      desc: '',
      args: [],
    );
  }

  String get downloadFrom {
    return Intl.message(
      'Download from',
      name: 'downloadFrom',
      desc: '',
      args: [],
    );
  }

  String get description2 {
    return Intl.message(
      'Clean, Scalable, and Future-Ready Code.',
      name: 'description2',
      desc: '',
      args: [],
    );
  }

  String get description3 {
    return Intl.message(
      'Blazing-Fast Websites and Apps That Keep Your Users Coming Back.',
      name: 'description3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
