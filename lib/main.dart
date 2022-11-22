import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_test/router.dart' as Routes;
import 'package:hive_test/router.dart';
// import 'package:epos_go/consts/router.dart' as Routes;
import 'package:hive_test/user.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("svlogin");
  runApp(const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => User())],
      // child:Consumer( builder: (context, theme, snapshot),
      child:MaterialApp(
      onGenerateRoute: Routes.Router.generateRoute,
      initialRoute: splashRoute,
      // initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(primarySwatch: Colors.green),
    ));
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     super.initState();
     Timer(const Duration(seconds: 3),
         ()=>  Navigator.pushNamed(context, '/loginScreen'));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage())));
  }
  // @override
  // void dispose() {
  //   animationController.dispose();
  //   timer?.cancel();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/launch_image.png",height: 300,width: 200,),
          const Text("Grafterr GO",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
          const SizedBox(height: 30,),
          const CircularProgressIndicator(),
        ],
      ),)
    );
  }
}


