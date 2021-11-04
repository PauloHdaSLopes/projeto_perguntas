import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  Resposta(this.texto, this.quandoSelecionado);

  String texto;
  void Function() quandoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
        ),
        child: Text(texto),
        onPressed: quandoSelecionado
      ),
    );
  }
}
