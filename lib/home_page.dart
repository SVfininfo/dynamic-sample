import 'package:flutter/material.dart';
import 'package:hive_test/user.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String email = box1.get('email');

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, user, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          home: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                title: const Center(
                    child: Text(
                  "ePOS Home",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),

              body: Center(

                  child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                Image.asset(
                  'assets/images/epos.jpg',
                  height: 300,
                  width: 600,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "You are in ePOS now",
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: 400,
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Your Email : ",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                user.email,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "  Your Password : ",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                user.password,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                // InkWell(
                //   key: const Key("back"),
                //   onTap: () {
                //     if (_formKey.currentState!.validate()){
                //     Navigator.pushAndRemoveUntil(context,
                //         MaterialPageRoute(builder: (_) => const LoginPage()));
                //     Navigator.of(context).pushAndRemoveUntil(
                //         MaterialPageRoute(
                //             builder: (context) => const LoginPage()),
                //             (Route<dynamic> route) => false);
                //     }else{
                //       return null;
                //     }
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 100,
                //     decoration: BoxDecoration(
                //       color: Colors.deepOrangeAccent,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: const Center(
                //       child: Text(
                //         "back",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // InkWell(
                //   key: Key("home"),
                //   onTap: () {
                //     // if (_formKey.currentState!.validate()){
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (_) => LoginScreen()));
                //     // }else{
                //     //   return null;
                //     // }
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 100,
                //     decoration: BoxDecoration(
                //       color: Colors.green,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "home",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20),
                //       ),
                //     ),
                //   ),
                // ),
              ]))));
    });
  }
}
