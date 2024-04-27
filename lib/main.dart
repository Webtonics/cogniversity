import 'package:cogniversity/firebase_options.dart';
import 'package:cogniversity/providers/role_provider.dart';
import 'package:cogniversity/providers/user_provider.dart';
import 'package:cogniversity/views/auth/login.dart';
// import 'package:cogniversity/views/intro/onboarding/onboarding.dart';
// import 'package:cogniversity/views/responsive/responsive_engine.dart';
// import 'package:cogniversity/views/root.dart';
import 'package:cogniversity/views/student/studentapp.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cogniversity/views/responsive/responsive_engine.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
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
        ChangeNotifierProvider(create: (_)=> UserProvider()),
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), 
    builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const StudentApp();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }
        return const LoginScreen();
      });
    }
  
}

