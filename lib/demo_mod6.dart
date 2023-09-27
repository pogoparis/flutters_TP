// ******************* COMPTEUR ***************************
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
        home: const CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0; // variable du compteur dans l'état qui fait la reconstruction
  double slideValue =0;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body : Center(child:
      Column(
        children: [
          Text(_counter.toString()),
          Text(slideValue.toString()),
          Slider(value: slideValue , max: 10,
            divisions: 10,
            onChanged: (valueSlide){
              setState(() {
                slideValue = valueSlide;
              });
            },
          )
        ],
      ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _counter++;
          });
        },
        child : Icon(Icons.add),
      ),
    );
  }
}
