import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual a sua idade?',
      'respostas': ['15', '20', '25', '27']
    },
    {
      'texto': 'Qual o seu signo?',
      'respostas': ['Peixes', 'Capricornio', 'Sagitario', 'Touro']
    },
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': ['Azul', 'Vermelho', 'Verde', 'Amarelo']
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Forma imperativa
    // List<Widget> widgets = [];
    // for(String texto in respostas) {
    //   widgets.add(Resposta(texto,_responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : const Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
