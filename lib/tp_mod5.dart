import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Twitter',
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
        backgroundColor: Colors.blue,
        title: const Text(
          "Twitter",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const TopNavigationWidget(),
          const Card(
            child: Column(
              children: [
                // Première rangée principale
                FirstRowImageEtTexte(),

                // Deuxième rangée principale
                SecondeRow3Buttons(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white60,
            ),
          ),
          const BottomNavBar()
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white60,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Fil",
                      style: TextStyle(color: Colors.black38),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Notifications",
                      style: TextStyle(color: Colors.black38),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Messages",
                      style: TextStyle(color: Colors.black38),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Moi",
                      style: TextStyle(color: Colors.black38),
                    )),
              ]),
        ));
  }
}

class SecondeRow3Buttons extends StatelessWidget {
  const SecondeRow3Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Répondre"),
              ),
            ],
          ),
           Column(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Retweet"),
              ),
            ],
          ),
           Column(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Favoris"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstRowImageEtTexte extends StatelessWidget {
  const FirstRowImageEtTexte({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://picsum.photos/200/300', width: 125, height: 125,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            children: [
              // Première Row de contenu dans la première row principale
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("Lacrevette@Chocolate"),
                  Text("50s", style: TextStyle(color: Colors.black26)),
                  ]
                ),
              ),
              // Deuxième Row de contenu dans la première row principale
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "ipsa quae a, qui dolorem iperat voluptatem. Ut enim osam,"
                      "nisi ut apse quam nihil molestiae consequatur, vel illum "
                      "qui dolorem eum fugiat, dolorem iperat voluptatem !",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TopNavigationWidget extends StatelessWidget {
  const TopNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF58B0F0),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Nouveau",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Accueil",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Rechercher",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }
}
