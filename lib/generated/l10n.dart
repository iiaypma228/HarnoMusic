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

  /// `Millions of Tracks`
  String get millionsTrack {
    return Intl.message(
      'Millions of Tracks',
      name: 'millionsTrack',
      desc: '',
      args: [],
    );
  }

  /// `Free in GarnoMusic`
  String get freeInApp {
    return Intl.message(
      'Free in GarnoMusic',
      name: 'freeInApp',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get regestration {
    return Intl.message(
      'Register',
      name: 'regestration',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
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

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `{fieldName} field is required!`
  String fieldNRequired(Object fieldName) {
    return Intl.message(
      '$fieldName field is required!',
      name: 'fieldNRequired',
      desc: '',
      args: [fieldName],
    );
  }

  /// `Need help?`
  String get ifNeedAnyHelp {
    return Intl.message(
      'Need help?',
      name: 'ifNeedAnyHelp',
      desc: '',
      args: [],
    );
  }

  /// `Click here`
  String get clickHere {
    return Intl.message(
      'Click here',
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

  /// `Recover Password`
  String get recoveryPassword {
    return Intl.message(
      'Recover Password',
      name: 'recoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get doYouHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'doYouHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get notAMember {
    return Intl.message(
      'Don\'t have an account?',
      name: 'notAMember',
      desc: '',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy the music`
  String get enjoyMusic {
    return Intl.message(
      'Enjoy the music',
      name: 'enjoyMusic',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get doYouHaveMember {
    return Intl.message(
      'Already have an account?',
      name: 'doYouHaveMember',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email address entered`
  String get incorrectEmail {
    return Intl.message(
      'Incorrect email address entered',
      name: 'incorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get notCorrectEmail {
    return Intl.message(
      'Invalid email address',
      name: 'notCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Artists`
  String get artists {
    return Intl.message(
      'Artists',
      name: 'artists',
      desc: '',
      args: [],
    );
  }

  /// `Podcasts`
  String get podcasts {
    return Intl.message(
      'Podcasts',
      name: 'podcasts',
      desc: '',
      args: [],
    );
  }

  /// `Now Playing`
  String get nowPlaying {
    return Intl.message(
      'Now Playing',
      name: 'nowPlaying',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while loading data`
  String get errorLoadData {
    return Intl.message(
      'An error occurred while loading data',
      name: 'errorLoadData',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retryLoad {
    return Intl.message(
      'Retry',
      name: 'retryLoad',
      desc: '',
      args: [],
    );
  }

  /// `My Library`
  String get myLibrary {
    return Intl.message(
      'My Library',
      name: 'myLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Local Files`
  String get localFiles {
    return Intl.message(
      'Local Files',
      name: 'localFiles',
      desc: '',
      args: [],
    );
  }

  /// `tracks`
  String get tracks {
    return Intl.message(
      'tracks',
      name: 'tracks',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get likesTrack {
    return Intl.message(
      'Favorites',
      name: 'likesTrack',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguge {
    return Intl.message(
      'Select Language',
      name: 'selectLanguge',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logoutFromApp {
    return Intl.message(
      'Log Out',
      name: 'logoutFromApp',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get createPlayList {
    return Intl.message(
      'Create',
      name: 'createPlayList',
      desc: '',
      args: [],
    );
  }

  /// `Enter playlist name!`
  String get inputPlayListName {
    return Intl.message(
      'Enter playlist name!',
      name: 'inputPlayListName',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to listen to?`
  String get whatDoYouWantListen {
    return Intl.message(
      'What do you want to listen to?',
      name: 'whatDoYouWantListen',
      desc: '',
      args: [],
    );
  }

  /// `Hip-Hop`
  String get hipHop {
    return Intl.message(
      'Hip-Hop',
      name: 'hipHop',
      desc: '',
      args: [],
    );
  }

  /// `Pop`
  String get popGenre {
    return Intl.message(
      'Pop',
      name: 'popGenre',
      desc: '',
      args: [],
    );
  }

  /// `Rock`
  String get rockGenre {
    return Intl.message(
      'Rock',
      name: 'rockGenre',
      desc: '',
      args: [],
    );
  }

  /// `K-Pop`
  String get kpopGenre {
    return Intl.message(
      'K-Pop',
      name: 'kpopGenre',
      desc: '',
      args: [],
    );
  }

  /// `Metal`
  String get metalGenre {
    return Intl.message(
      'Metal',
      name: 'metalGenre',
      desc: '',
      args: [],
    );
  }

  /// `Jazz`
  String get jazGenre {
    return Intl.message(
      'Jazz',
      name: 'jazGenre',
      desc: '',
      args: [],
    );
  }

  /// `Classical`
  String get classicGenre {
    return Intl.message(
      'Classical',
      name: 'classicGenre',
      desc: '',
      args: [],
    );
  }

  /// `Punk`
  String get pankGenre {
    return Intl.message(
      'Punk',
      name: 'pankGenre',
      desc: '',
      args: [],
    );
  }

  /// `Blues`
  String get bluesGenre {
    return Intl.message(
      'Blues',
      name: 'bluesGenre',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get countryGenre {
    return Intl.message(
      'Country',
      name: 'countryGenre',
      desc: '',
      args: [],
    );
  }

  /// `Soul`
  String get soulGenre {
    return Intl.message(
      'Soul',
      name: 'soulGenre',
      desc: '',
      args: [],
    );
  }

  /// `Find here`
  String get findHere {
    return Intl.message(
      'Find here',
      name: 'findHere',
      desc: '',
      args: [],
    );
  }

  /// `Change Avatar`
  String get changeAvatar {
    return Intl.message(
      'Change Avatar',
      name: 'changeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appLanguage {
    return Intl.message(
      'App Language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Join Room`
  String get joinToRoom {
    return Intl.message(
      'Join Room',
      name: 'joinToRoom',
      desc: '',
      args: [],
    );
  }

  /// `Create Room`
  String get createRoom {
    return Intl.message(
      'Create Room',
      name: 'createRoom',
      desc: '',
      args: [],
    );
  }

  /// `Enter Room Code`
  String get inputCodeRoom {
    return Intl.message(
      'Enter Room Code',
      name: 'inputCodeRoom',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get voyti {
    return Intl.message(
      'Log In',
      name: 'voyti',
      desc: '',
      args: [],
    );
  }

  /// `Kick User`
  String get kickUser {
    return Intl.message(
      'Kick User',
      name: 'kickUser',
      desc: '',
      args: [],
    );
  }

  /// `Current Room`
  String get currentRoom {
    return Intl.message(
      'Current Room',
      name: 'currentRoom',
      desc: '',
      args: [],
    );
  }

  /// `Code copied!`
  String get codeCopySuccses {
    return Intl.message(
      'Code copied!',
      name: 'codeCopySuccses',
      desc: '',
      args: [],
    );
  }

  /// `Leave Room`
  String get leaveRoom {
    return Intl.message(
      'Leave Room',
      name: 'leaveRoom',
      desc: '',
      args: [],
    );
  }

  /// `You are listening to music alone`
  String get youListenMusicSingle {
    return Intl.message(
      'You are listening to music alone',
      name: 'youListenMusicSingle',
      desc: '',
      args: [],
    );
  }

  /// `Let's fix this!`
  String get goCorrectThis {
    return Intl.message(
      'Let\'s fix this!',
      name: 'goCorrectThis',
      desc: '',
      args: [],
    );
  }

  /// `(це ви)`
  String get itsYou {
    return Intl.message(
      '(це ви)',
      name: 'itsYou',
      desc: '',
      args: [],
    );
  }

  /// `Історія прослуховування`
  String get listenHistory {
    return Intl.message(
      'Історія прослуховування',
      name: 'listenHistory',
      desc: '',
      args: [],
    );
  }

  /// `Додати в улюблені`
  String get addToLiked {
    return Intl.message(
      'Додати в улюблені',
      name: 'addToLiked',
      desc: '',
      args: [],
    );
  }

  /// `Прибрати з улюблених`
  String get removeFromLiked {
    return Intl.message(
      'Прибрати з улюблених',
      name: 'removeFromLiked',
      desc: '',
      args: [],
    );
  }

  /// `Така назва вже використовується!`
  String get nameAlreadyUsed {
    return Intl.message(
      'Така назва вже використовується!',
      name: 'nameAlreadyUsed',
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
