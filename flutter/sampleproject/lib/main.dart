import 'package:firebase_core/firebase_core.dart';
import 'package:sampleproject/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/LuckyDraw/SpinWheelScreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sarmaya',
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primarySwatch: Colors.deepOrange,
      ),
      home: SplashScreen()
    );
  }
}


// class SettingsUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // primarySwatch: Colors.orange,
//       ),
//       title: "Setting UI",
//       home:Navbar(),
//     );
//   }
// }



