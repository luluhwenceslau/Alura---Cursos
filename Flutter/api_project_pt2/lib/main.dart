// ignore_for_file: unused_local_variable

import 'package:api_project/models/journal.dart';
import 'package:api_project/screens/add_journal_screen/add_journal_screen.dart';
import 'package:api_project/services/journal_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogged = await verifyToken();
  runApp(MyApp(
    isLogged: isLogged,
  ));

  JournalService service = JournalService();
  //service.register(Journal.empty());
  //service.getAll();
}

Future<bool> verifyToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("accessToken");
  if (token != null) {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  final bool isLogged;
  const MyApp({Key? key, required this.isLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.bitterTextTheme(),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: (isLogged) ? "home" : "login",
      routes: {
        "home": (context) => const HomeScreen(),
        "login": (context) => LoginScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "add-journal") {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
          final Journal journal = map["journal"] as Journal;
          final bool isEditing = map["is_editing"];
          return MaterialPageRoute(builder: (context) {
            return AddJournalScreen(
              journal: journal,
              isEditing: isEditing,
            );
          });
        }

        return null;
      },
    );
  }
}
