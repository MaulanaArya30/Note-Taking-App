import 'package:app_client/blocs/notes_color_cubit.dart';
import 'package:app_client/blocs/notes_cubit.dart';
import 'package:app_client/ui/add_note_screen.dart';
import 'package:app_client/ui/login_page.dart';
import 'package:app_client/ui/main_screen.dart';
import 'package:app_client/ui/search_screen.dart';
import 'package:app_client/ui/show_note_screen.dart';
import 'package:app_client/ui/signup_page.dart';
import 'package:app_client/ui/theme/app_theme.dart';
//import 'package:app_client/ui/welcome_page.dart';
import 'package:app_client/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/notes_search_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NotesCubit>(
          create: (context) => NotesCubit(),
          dispose: (context, value) => value.close(),
        ),
        Provider<NotesColorCubit>(
          create: (context) => NotesColorCubit(),
          dispose: (context, value) => value.close(),
        ),
        Provider<NotesSearchCubit>(
          create: (context) => NotesSearchCubit(),
          dispose: (context, value) => value.close(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/mainscreen': (context) => const MainScreen(),
          '/search': (context) => const SearchScreen(),
          '/add': (context) => NoteAddScreen(),
          '/show': (context) => ShowNoteScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
        },
      ),
    );
  }
}
