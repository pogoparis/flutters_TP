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
        title: const Text(
          "Twitter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          // Barre de navigation supérieur
          const TopNavigationTwitter(),
          // Formulaire de Connexion
          ConnexionUserWidget(),
          // Le reste de la page avec la liste des tweet
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const TweetWithButtons())),
        ],
      ),
      // Barre de navigation basse
      bottomNavigationBar: const BottomNavigationTwitter(),
    );
  }
}

class ConnexionUserWidget extends StatefulWidget {
  const ConnexionUserWidget({
    super.key,
  });

  @override
  State<ConnexionUserWidget> createState() => _ConnexionUserWidgetState();
}

class _ConnexionUserWidgetState extends State<ConnexionUserWidget> {
  final textControlerEmail = TextEditingController();
  final textControlerPassword = TextEditingController();
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final emailValue = "pogoparis@gmail.com";
  final pwd = "1234abcd";
  String message = ""; // Message de validation
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const Text(
            'Connexion à Twitter',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          TextFormField(
              controller: textControlerEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Identifiant', hintText: "tonmail@gmail.om.com"),
              validator: (valueEmail) {
                if (valueEmail == null || valueEmail.isEmpty == true) {
                  return "Merci de compléter ce champs";
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$")
                    .hasMatch(valueEmail)) {
                  return "Vérifier le format de l'EMail";
                }
                return null;
              }),
          TextFormField(
            controller: textControlerPassword,
            decoration:  InputDecoration(
              labelText: 'Mot de passe',
              // *************** Oeil afficher mot de passe *************
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            obscureText: !isPasswordVisible, // Pour masquer le mot de passe
              validator: (valuePassword) {
                if (valuePassword == null || valuePassword.isEmpty == true) {
                  return "Merci de compléter ce champs";
                }
                if (!RegExp(
                    r"^.{4,}$")
                    .hasMatch(valuePassword)) {
                  return "Minimum 4 caractères";
                }
                return null;
              }),

          //************************************************************
          Row(
            children: [
              Switch(
                  value: rememberMe,
                  onChanged: (isEnabled) {
                    setState(() {
                      rememberMe = !rememberMe;
                    });
                  }),
              const Text('Mémoriser mes informations'),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                final enteredEmail = textControlerEmail.text;
                final enteredPassword = textControlerPassword.text;
                if (_formKey.currentState?.validate() == true &&
                    enteredEmail == emailValue &&
                    enteredPassword == pwd) {
                  setState(() {
                    message = "OK, c'est bon";
                  });
                } else {
                  setState(() {
                    message = "Email ou mot de passe incorrects";
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12.0), // Ajustez le rayon selon vos préférences
                ),
                backgroundColor: Colors.blue,
              ),
              child: const Text('Se connecter', style: TextStyle(color: Colors.white)),
            ),
          ),
          if (message.isNotEmpty || message != "")
            Text(
        message,
        style: TextStyle(
          color: message == "OK, c'est bon"
              ? Colors.green
              : Colors.red,
            ),
            ),
        ]),
      ),
    );
  }
}

class TweetWithButtons extends StatelessWidget {
  const TweetWithButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Tweet(DateTime(2023, 12, 3, 12, 50, 12)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ButtonTweetBar(),
          )
        ],
      ),
    );
  }
}

class Tweet extends StatelessWidget {
  final DateTime dateTime;

  Tweet(
    this.dateTime, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.network(
        "https://picsum.photos/150",
        width: 125,
        height: 125,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("LaCrevette@Chocolate",
                      style: Theme.of(context).textTheme.titleSmall),
                  Text(
                    "${dateTime.minute}m",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  "latine euismod nulla mauris corrumpit scripserit unum causae justo"
                  " pellentesque scripta justo ius elitr orci")
            ],
          ),
        ),
      )
    ]);
  }
}

class ButtonTweetBar extends StatefulWidget {
  const ButtonTweetBar({
    super.key,
  });

  @override
  State<ButtonTweetBar> createState() => _ButtonTweetBarState();
}

class _ButtonTweetBarState extends State<ButtonTweetBar> {
  var isLiked = false;
  var isRetweet = false;
  var isReply = false;

  void _changeTweet() {
    setState(() {
      isRetweet = !isRetweet;
    });
  }

  void _changeReply() {
    setState(() {
      isReply = !isReply;
    });
  }

  void _changeLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: isReply ? const Icon(Icons.reply) : const Icon(Icons.reply_rounded),
          onPressed: _changeReply,
          color: isReply ? Colors.blue : Colors.black,
        ),
        IconButton(
          icon: isRetweet ? const Icon(Icons.repeat_one) : const Icon(Icons.repeat),
          onPressed: _changeTweet,
          color: isRetweet ? Colors.blue : Colors.black,
        ),
        IconButton(
          icon: isLiked
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite_outline, color: Colors.black),
          onPressed: _changeLike,
        ),
      ],
    );
  }
}

class TopNavigationTwitter extends StatelessWidget {
  const TopNavigationTwitter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0xFF, 0x58, 0xB0, 0xF0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {},
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Accueil",
                  style: TextStyle(color: Colors.white),
                )),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationTwitter extends StatelessWidget {
  const BottomNavigationTwitter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: const Text(
              "Fil",
              style: TextStyle(color: Colors.blue),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Notification",
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Messages",
              style: TextStyle(color: Colors.grey),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Moi",
              style: TextStyle(color: Colors.grey),
            )),
      ],
    );
  }
}
