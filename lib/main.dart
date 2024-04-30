import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'Contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Checkpoint2',
      home: ContatoFavoritoLista(),
    );
  }
}

class ContatoFavoritoLista extends StatefulWidget {
  const ContatoFavoritoLista({Key? key}) : super(key: key);

  @override
  State<ContatoFavoritoLista> createState() => _ContatoFavoritoListaState();
}


class _ContatoFavoritoListaState extends State<ContatoFavoritoLista> {
  List<Contato> contatos = [
    Contato('Abner Aragon', 'abner.aragon@checkpoint.com.br'),
    Contato('Cleomar da silva JR', 'Cleomar.silva@checkpoint.com.br'),
    Contato('Vinicius JR', 'Vinicius.JR@checkpoint.com.br'),


  ];

  int contatosFavoritos () {
    return contatos.where((contatos) => contatos.favorito).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 185, 40),
        title: Text('Lista de Contatos ${contatosFavoritos()}'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index + 1}'),
              ),
              title: Text(contatos[index].nome),
              subtitle: Text(contatos[index].email),
              trailing: IconButton(
                icon: Icon(
                  contatos[index].favorito ? Icons.favorite : Icons.favorite_border,
                  color: contatos[index].favorito ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    contatos[index].favorito = !contatos[index].favorito;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
