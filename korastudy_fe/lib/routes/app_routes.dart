import 'package:flutter/material.dart';
import 'package:korastudy_fe/pages/forums/forums_screen.dart';
import 'package:korastudy_fe/pages/grammar/grammar_main.dart';
import 'package:korastudy_fe/pages/home/home_screen.dart';
import 'package:korastudy_fe/pages/vocabulary/dictionary_verb.dart';
import 'package:korastudy_fe/pages/vocabulary/flashcard.dart';
import 'package:korastudy_fe/pages/vocabulary/test_mix.dart';
import 'package:korastudy_fe/pages/vocabulary/vocabulary_list.dart';
import 'package:korastudy_fe/pages/vocabulary/vocabulary_list_mean.dart';
import 'package:korastudy_fe/pages/welcome/splash.dart';
import 'package:korastudy_fe/pages/welcome/topik_chose_page.dart';
import 'package:korastudy_fe/pages/welcome/welcome_page_1.dart';
import 'package:korastudy_fe/pages/welcome/welcome_page_2.dart';
import 'package:korastudy_fe/pages/welcome/welcome_page_3.dart';
import 'package:korastudy_fe/pages/welcome/welcome_page_4.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome1': (context) => WelcomePage1(),
        '/welcome2': (context) => WelcomePage2(),
        '/welcome3': (context) => WelcomePage3(),
        '/welcome4': (context) => WelcomePage4(),
        '/ChooseTopik': (context) => TopikChosePageWidget(),
        '/Home': (context) => HomeScreen(),
        '/Forum': (context) => ForumScreen(),
        '/Grammar': (context) => const GrammarMain(),
        '/vocabulary': (context) => Vocabulary_listWidget(),
        '/listvoca': (context) => Vocabulary_list_meanWidget(),
        '/dictionary': (context) => DictionaryVerbWidget(),
        '/flashcard': (context) => FlashcardPage(),
        '/testmixt': (context) => MatchingPage(),
      },
    );
  }
}
