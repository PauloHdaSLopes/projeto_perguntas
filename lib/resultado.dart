import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 5) {
      return "Hororoso";
    } else if (pontuacao < 10) {
      return "Bom";
    } else if (pontuacao < 15) {
      return "Muito Bom";
    } else {
      return "Exelente";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Text(
        "Seu resultado foi",
        style: TextStyle(fontSize: 20),
      )),
      Center(
          child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 28),
      )),
      ElevatedButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text(
            "Reiniciar?",
            style: TextStyle(fontSize: 18),
          ), 
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)
        ))
    ]);
  }
}
