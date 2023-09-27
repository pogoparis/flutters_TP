import 'package:flutter/material.dart';

void main() {
  runApp(TP6App());
}

class ProductField extends StatefulWidget {
  _TP6AppState tp6State;
  int productNum = 1;
  int unitPrice = 1;

  ProductField(this.tp6State, this.productNum, this.unitPrice, {required Key key}) : super(key: key);

  @override
  State<ProductField> createState() => _ProductFieldState();
}

class _ProductFieldState extends State<ProductField> {

  // Repésente le nombre d'unité dynamique du champ
  int unit = 0;

  // Récupérer le total du champ
  int getTotal(){
    return unit * widget.unitPrice;
  }

  /* TODO : Finir la fonction
   * Incrementer le nombre d'unité
   * Il faut rafraichir le champ et appeler shouldRefreshTotal pour recalculer le total
   */
  void onClickAdd(bool increment){
	// TODO
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Text("Produit ${widget.productNum}"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
          child: Text("PU ${widget.unitPrice} €"),
        ),
        ElevatedButton(onPressed: () => { onClickAdd(true) }, child:  Icon(
          Icons.add,
          size: 18.0,
        ),),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("${unit}"),
        ),
        ElevatedButton(onPressed: () => { onClickAdd(false) }, child:  Icon(
          Icons.remove,
          size: 18.0,
        ),)
      ],
      ),
    );
  }
}

class TP6App extends StatefulWidget {
  @override
  State<TP6App> createState() => _TP6AppState();
}

class _TP6AppState extends State<TP6App> {
  // Référence de tout les champs
  final _fields = [
    GlobalKey<_ProductFieldState>(),
    GlobalKey<_ProductFieldState>(),
    GlobalKey<_ProductFieldState>(),
    GlobalKey<_ProductFieldState>()
  ];
  // Le total actuel
  int total = 0;

  /*
   * TODO : Calculer le total de tout les champs et Rafraichir l'ecran
   */
  void shouldRefreshTotal(){
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TP 06'),
        ),
        body: Column(children: [
          ProductField(key : _fields[0], this, 1, 1),
          ProductField(key : _fields[1], this, 2, 1),
          ProductField(key : _fields[2], this, 3, 1),
          ProductField(key : _fields[3], this, 4, 1),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                width: double.infinity,
                child: Text("Total : ${total} euros")),
          )
        ],),
      ),
    );
  }
}
