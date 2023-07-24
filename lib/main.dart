import 'package:flutter/material.dart';

void main() {
  runApp(ListaApp());
}

class ItemLista {
  String nome;
  String comentario;
  String cep;

  ItemLista(this.nome, this.comentario, this.cep);
}

class ListaApp extends StatefulWidget {
  @override
  _ListaAppState createState() => _ListaAppState();
}

class _ListaAppState extends State<ListaApp> {
  List<ItemLista> itens = [];
  TextEditingController nomeController = TextEditingController();
  TextEditingController comentarioController = TextEditingController();
  TextEditingController cepController = TextEditingController();

  void adicionarItem() {
    setState(() {
      itens.add(
        ItemLista(
          nomeController.text,
          comentarioController.text,
          cepController.text,
        ),
      );
      nomeController.clear();
      comentarioController.clear();
      cepController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lista de Itens"),
        ),
        body: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(itens[index].nome),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Comentário: " + itens[index].comentario),
                  Text("CEP: " + itens[index].cep),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: adicionarItem,
          child: Icon(Icons.add),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: "Nome"),
              ),
              TextField(
                controller: comentarioController,
                decoration: InputDecoration(labelText: "Comentário"),
              ),
              TextField(
                controller: cepController,
                decoration: InputDecoration(labelText: "CEP"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: adicionarItem,
                child: Text("Adicionar Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
