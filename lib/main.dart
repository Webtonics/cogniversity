import 'package:cogniversity/firebase_options.dart';
import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/views/responsive/responsive_engine.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider(create: (_){ Role();}),
        ChangeNotifierProvider(create: (_)=> RoleProvider()),
      ],
      child: MaterialApp(
        title: 'Cogniversity',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme( 
            titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white, ),
            titleMedium:TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.deepPurple, )
          )
        ),
        //run the root app
        home: const Authuser(),
      ),
    );
  }

  //Authenticate user

  

}

class Authuser extends StatelessWidget {
  const Authuser({super.key});

  //funtion to auth user i.e on Authstatechange
    //check user type {teacher, student}
    //login to user app

  @override
  Widget build(BuildContext context) {
    return const ResponsiveEngine();
    // return const StudentHome();
  }
}

