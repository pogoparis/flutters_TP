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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const TwitterPage());
  }
}

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Twitter"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: const Column(
          children: [
            top_widget_navigation_bar(),
          ],
        ),
        bottomNavigationBar: const bottom_navigation_bar_widgrt());
  }
}

class bottom_navigation_bar_widgrt extends StatelessWidget {
  const bottom_navigation_bar_widgrt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child:
                const Text("Fil", style: TextStyle(color: Colors.black26))),
        TextButton(
            onPressed: () {},
            child: const Text("Notifications",
                style: TextStyle(color: Colors.black26))),
        TextButton(
            onPressed: () {},
            child: const Text("Messages",
                style: TextStyle(color: Colors.black26))),
        TextButton(
            onPressed: () {},
            child: const Text("Moi",
                style: TextStyle(color: Colors.black26))),
      ],
    );
  }
}

class top_widget_navigation_bar extends StatelessWidget {
  const top_widget_navigation_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0xFF, 0x58, 0x80, 0xF0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Nouveau",
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Accueil",
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Rechercher",
                style: TextStyle(color: Colors.white),
              )),
        ]),
      ),
    );
  }
}
