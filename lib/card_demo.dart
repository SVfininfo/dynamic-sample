import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({Key? key}) : super(key: key);

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      backgroundColor: Colors.green,
        title: const Center(
            child: Text(
              "Card demo",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ),
      body: Center(
        child: Container(
          height: 450,
          width: 400,
          color: Colors.greenAccent[100],
          // decoration:  BoxDecoration(
          //   // shape: BorderRadius.circular(30)
          // ),
          child: Card(
            color: Colors.greenAccent,
            elevation: 0,
            margin: const EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),),
            // shadowColor: Colors.yellow,
            child:  const Center(
              child: Text("Grafterr Go",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),),
            )
            ),

          ),
        ),
      );
  }
}
