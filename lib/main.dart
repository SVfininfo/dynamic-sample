import 'package:flutter/material.dart';
import 'package:hive_test/user.dart';
import 'package:provider/provider.dart';
import 'card_demo.dart';
import 'login_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("svlogin");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create:(_)=>User())
  ],child:const MyApp() ,));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext cotext) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
