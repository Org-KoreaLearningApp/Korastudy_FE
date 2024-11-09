import 'package:flutter/material.dart';
import 'package:korastudy_fe/firebase_options.dart';
import 'package:korastudy_fe/pages/account/login/login_screen.dart';
import 'package:korastudy_fe/pages/account/signup/register_screen.dart';
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
import 'package:korastudy_fe/pages/testpage/listTest.dart'
    as list_test; // Import đúng cho ListTestWidget
import 'package:korastudy_fe/pages/testpage/TestPageListening.dart'; // Import đúng cho TestPageListening
import 'package:firebase_core/firebase_core.dart';
// Tạo bằng Firebase CLI

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KoraStudy App",
      home: SplashScreen(),
      routes: {
        '/welcome1': (context) => WelcomePage1(),
        '/welcome2': (context) => WelcomePage2(),
        '/welcome3': (context) => WelcomePage3(),
        '/welcome4': (context) => WelcomePage4(),
        '/ChooseTopik': (context) => TopikChosePageWidget(),
        '/Home': (context) => HomeScreen(),
        '/Forum': (context) => ForumScreen(),
        '/Grammar': (context) => const GrammarMain(),
        '/vocabulary': (context) => VocabularyListWidget(),
        '/listvoca': (context) => VocabularyListMeanWidget(
              setId: '',
            ),
        '/dictionary': (context) => DictionaryVerbWidget(),
        '/flashcard': (context) => FlashcardPage(),
        '/testmixt': (context) => MatchingPage(),
        'login': (context) => LoginScreen(),
        'signup': (context) => RegisterScreen(),
        '/listTest': (context) =>
            list_test.ListTestWidget(), // Thêm route cho ListTestWidget
        '/testPageListening': (context) =>
            TestPageListening(), // Thêm route cho TestPageListening
      },
    );
  }
}
