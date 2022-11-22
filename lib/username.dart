import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserName extends StatefulWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Center(
              child: Text(
            "Screen 3",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Come back Soon!",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
