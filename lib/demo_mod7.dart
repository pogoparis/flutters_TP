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
        home: const DemoFormWidget());
  }
}

class DemoFormWidget extends StatefulWidget {
  const DemoFormWidget({super.key});

  @override
  State<DemoFormWidget> createState() => _DemoFormWidgetState();
}

class _DemoFormWidgetState extends State<DemoFormWidget> {
  final textControlerEmail = TextEditingController();
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(children: [
                   TextFormField(
                    controller: textControlerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "E Mail",
                        hintText: "john@kennedy.gov.com"),
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     validator : (valueEmail){
                      if(valueEmail == null || valueEmail.isEmpty == true) {
                        return "Merci de compléter ce champs";
                      }
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$").hasMatch(valueEmail) ){
                        return "Vérifier le format de l'EMail";
                      }
                      return null;
                     }

                   ),
                   Switch(
                    value: rememberMe,
                    onChanged: (isEnabled) {
                    setState(() {
                      rememberMe = !rememberMe;
                    });
                  }),
                   ElevatedButton(
                       onPressed: () {
                        print(textControlerEmail.text);
                        print(rememberMe);
                        if(_formKey.currentState?.validate() == true) {
                  print("Formulaire Correcte");
                         }       else {
                          print("Formulaire Incorrecte");
                        }
                        },
                       child: Text("Valider")
                   )
            ])),
      ),
    ));
  }
}
