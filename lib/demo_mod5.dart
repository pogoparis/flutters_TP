import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Module5Page());
  }
}

class Module5Page extends StatelessWidget {
  const Module5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text("Module 5 Demo"),
      ),

        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fond.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Hello World!",
                style: TextStyle(
                  color: Colors.white, // Définit la couleur du texte en blanc.
                ),),
              const Text("Hello World!"),
              const Icon(Icons.car_rental_outlined),
              ElevatedButton(onPressed: () {}, child : const Text("Click"))
            ],
          ),
        ),
      )
    );
  }
}
