 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_sample_project/controller/AuthProvider.dart';
import 'package:new_sample_project/controller/providerController.dart';
import 'package:new_sample_project/firebase_options.dart';
import 'package:new_sample_project/view/homePage.dart';
import 'package:new_sample_project/view/loginPage.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>Authprovider()),
        ChangeNotifierProvider(create: (_)=>Providercontroller()),
      ],
      child: MaterialApp(    
        home: const HomePage(),
      ),
    );
  }
}

