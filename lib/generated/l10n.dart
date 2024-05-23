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

  /// `Мiльйони трекiв`
  String get millionsTrack {
    return Intl.message(
      'Мiльйони трекiв',
      name: 'millionsTrack',
      desc: '',
      args: [],
    );
  }

  /// `Безкоштовно в GarnoMusic`
  String get freeInApp {
    return Intl.message(
      'Безкоштовно в GarnoMusic',
      name: 'freeInApp',
      desc: '',
      args: [],
    );
  }

  /// `Зареєструватись`
  String get regestration {
    return Intl.message(
      'Зареєструватись',
      name: 'regestration',
      desc: '',
      args: [],
    );
  }

  /// `Вхiд`
  String get signIn {
    return Intl.message(
      'Вхiд',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `GARNO MUSIC`
  String get garnoMusic {
    return Intl.message(
      'GARNO MUSIC',
      name: 'garnoMusic',
      desc: '',
      args: [],
    );
  }

  /// `Початок роботи`
  String get getStarted {
    return Intl.message(
      'Початок роботи',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Пошта`
  String get email {
    return Intl.message(
      'Пошта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Поле {fieldName} обов'язкове!`
  String fieldNRequired(Object fieldName) {
    return Intl.message(
      'Поле $fieldName обов\'язкове!',
      name: 'fieldNRequired',
      desc: '',
      args: [fieldName],
    );
  }

  /// `Виникли питання?`
  String get ifNeedAnyHelp {
    return Intl.message(
      'Виникли питання?',
      name: 'ifNeedAnyHelp',
      desc: '',
      args: [],
    );
  }

  /// `Натиснiть сюди`
  String get clickHere {
    return Intl.message(
      'Натиснiть сюди',
      name: 'clickHere',
      desc: '',
      args: [],
    );
  }

  /// `HARNO`
  String get harno {
    return Intl.message(
      'HARNO',
      name: 'harno',
      desc: '',
      args: [],
    );
  }

  /// `MUSIC`
  String get musicHarno {
    return Intl.message(
      'MUSIC',
      name: 'musicHarno',
      desc: '',
      args: [],
    );
  }

  /// `Восстановить пароль`
  String get recoveryPassword {
    return Intl.message(
      'Восстановить пароль',
      name: 'recoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Або`
  String get or {
    return Intl.message(
      'Або',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Вже є аккаунт?`
  String get doYouHaveAccount {
    return Intl.message(
      'Вже є аккаунт?',
      name: 'doYouHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Немає аккаунту?`
  String get notAMember {
    return Intl.message(
      'Немає аккаунту?',
      name: 'notAMember',
      desc: '',
      args: [],
    );
  }

  /// `Зареєеструватись зараз`
  String get registerNow {
    return Intl.message(
      'Зареєеструватись зараз',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Насолоджуйтесь музикою`
  String get enjoyMusic {
    return Intl.message(
      'Насолоджуйтесь музикою',
      name: 'enjoyMusic',
      desc: '',
      args: [],
    );
  }

  /// `Створити акаунт`
  String get createAccount {
    return Intl.message(
      'Створити акаунт',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Повне iм'я`
  String get fullName {
    return Intl.message(
      'Повне iм\'я',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Вже є акаунт?`
  String get doYouHaveMember {
    return Intl.message(
      'Вже є акаунт?',
      name: 'doYouHaveMember',
      desc: '',
      args: [],
    );
  }

  /// `Введена не корректна емаiл-адресса`
  String get incorrectEmail {
    return Intl.message(
      'Введена не корректна емаiл-адресса',
      name: 'incorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Не корректна емаiл адреса`
  String get notCorrectEmail {
    return Intl.message(
      'Не корректна емаiл адреса',
      name: 'notCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Новi`
  String get news {
    return Intl.message(
      'Новi',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Вiдео`
  String get video {
    return Intl.message(
      'Вiдео',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Артисти`
  String get artists {
    return Intl.message(
      'Артисти',
      name: 'artists',
      desc: '',
      args: [],
    );
  }

  /// `Подкасти`
  String get podcasts {
    return Intl.message(
      'Подкасти',
      name: 'podcasts',
      desc: '',
      args: [],
    );
  }

  /// `Грає зараз`
  String get nowPlaying {
    return Intl.message(
      'Грає зараз',
      name: 'nowPlaying',
      desc: '',
      args: [],
    );
  }

  /// `Виникла помилка при завантаженнi данних`
  String get errorLoadData {
    return Intl.message(
      'Виникла помилка при завантаженнi данних',
      name: 'errorLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Повторити`
  String get retryLoad {
    return Intl.message(
      'Повторити',
      name: 'retryLoad',
      desc: '',
      args: [],
    );
  }

  /// `Моя медіатека`
  String get myLibrary {
    return Intl.message(
      'Моя медіатека',
      name: 'myLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Файли на пристрої`
  String get localFiles {
    return Intl.message(
      'Файли на пристрої',
      name: 'localFiles',
      desc: '',
      args: [],
    );
  }

  /// `треков`
  String get tracks {
    return Intl.message(
      'треков',
      name: 'tracks',
      desc: '',
      args: [],
    );
  }

  /// `Улюблені`
  String get likesTrack {
    return Intl.message(
      'Улюблені',
      name: 'likesTrack',
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
      Locale.fromSubtags(languageCode: 'uk'),
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
