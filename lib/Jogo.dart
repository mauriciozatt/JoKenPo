import 'package:flutter/material.dart';
import 'dart:math';

//Criado classe StateFul pois a mesma permite a alteração de estados...
class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("img/padrao.png");
  var _textoRetorno = "Escolha uma opção abaixo";

//void e quando retorna valor (function, assim e procedure) _  igual a private
  void _escolhaSelecionada(String escolhaUsuario) {
    var vOpcoes = ["pedra", "papel", "tesoura"];
    String escolhaApp;

    escolhaApp = vOpcoes[Random().nextInt(3)];

    //Altera as imagens para o usuário.
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("img/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this._imagemApp = AssetImage("img/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("img/tesoura.png");
        });
        break;
    }
    ;

// validações de ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _textoRetorno = "Parabéns você ganhou!!!!";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _textoRetorno = "você Perdeu -_-!!!!";
      });
    } else {
      setState(() {
        _textoRetorno = "Empate meu nobre!";
      });
    }

  } //Fim método

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo JoKenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 0),
              child: Text("Escolha do App:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center)),
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._textoRetorno,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.red,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Gesture detector define eventos para widgets...
              GestureDetector(
                onTap: () => _escolhaSelecionada("pedra"),
                child: Image.asset(
                  "img/pedra.png",
                  height: 100,
                ),
              ),

              GestureDetector(
                onTap: () => _escolhaSelecionada("papel"),
                child: Image.asset(
                  "img/papel.png",
                  height: 100,
                ),
              ),

              GestureDetector(
                onTap: () => _escolhaSelecionada("tesoura"),
                child: Image.asset(
                  "img/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
