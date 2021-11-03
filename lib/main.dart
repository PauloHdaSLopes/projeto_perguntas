import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print('Pergunta respondida');
  }
  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual a sua idade?',
      'Qual o seu signo?',
      'Qual a sua cor favorita?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Text(perguntas.elementAt(perguntaSelecionada)),
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: responder
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: responder
            )
          ],
        )
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}