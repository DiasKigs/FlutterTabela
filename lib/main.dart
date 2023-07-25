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

class ListaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaScreen(),
    );
  }
}

class ListaScreen extends StatefulWidget {
  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  List<ItemLista> itens = [];
  TextEditingController nomeController = TextEditingController();
  TextEditingController comentarioController = TextEditingController();
  TextEditingController cepController = TextEditingController();

  void adicionarItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Adicionar novo item"),
          content: Column(
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
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  itens.add(
                    ItemLista(
                      nomeController.text,
                      comentarioController.text,
                      cepController.text,
                    ),
                  );
                });
                nomeController.clear();
                comentarioController.clear();
                cepController.clear();
                Navigator.of(context).pop();
              },
              child: Text("Adicionar"),
            ),
            TextButton(
              onPressed: () {
                nomeController.clear();
                comentarioController.clear();
                cepController.clear();
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implemente aqui a lógica para editar o item (se necessário)
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      itens.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: adicionarItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
