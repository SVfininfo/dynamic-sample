import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/user.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  // String name = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  late Box box1;

  @override
  void initState() {
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }

  void getdata() async {
    if (box1.get('email') != null) {
      email.text = box1.get('email');
      isChecked = true;
      // setState(() {
      //   // box1.put('email', '');
      // });
    }
    if (box1.get('password') != null) {
      password.text = box1.get('password');
      isChecked = true;
      setState(() {
        // box1.put('password', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: const Center(
                child: Text(
              "ePOS Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
          body: Center(
            child: Column(children: [
              Image.asset(
                'assets/images/epos.jpg',
                height: 250,
                width: 200,
              ),
              const Text(
                "Login to ePOS here",
                style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        key: const Key("emailf"),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        // onChanged: (val) {
                        //   setState(() {
                        //     name = val;
                        //     if (kDebugMode) {

                        //       print(name);
                        //     }
                        //   });
                        // },
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Your Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (RegExp(emailRegex).hasMatch(value!)) {
                          } else if (value == null || value.isEmpty) {
                            return "Email is required";
                          } else {
                            return "Enter correct email ";
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        key: Key('passwordf'),
                        obscureText: true,
                        controller: password,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          } else if (value.length < 6) {
                            return "Must be 6 characters";
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      key: const Key("epos login"),
                      onTap: () {
                        Provider.of<User>(context, listen: false).signIn(
                            email.text.toString(), password.text.toString());
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()));
                        } else {
                          return null;
                        }
                        login();
                        // setState(() {
                        //   name = email.text;
                        // });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Remember Me",
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        Checkbox(
                          key: Key("remember me"),
                          value: isChecked,
                          onChanged: (value) {
                            isChecked = !isChecked;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    // InkWell(
                    //   key: const Key("back2 fin home"),
                    //   onTap: () {
                    //     // if (_formKey.currentState!.validate()){
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (_) => const WelcomeScreen()));
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
                    //         "back",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 20),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ]),
                ),
              ),
            ]),
          ),
        ));
  }

  void login() {
    if (isChecked) {
      box1.put('email', email.text);
      box1.put('password', password.text);
    }
  }
}
