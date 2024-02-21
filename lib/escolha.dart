import 'package:flutter/material.dart';

class escolha extends StatefulWidget {
  const escolha({super.key});

  @override
  State<escolha> createState() => _escolhaState();
}

class _escolhaState extends State<escolha> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";


  //Função calcular
  void _calcular(){

    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);


    if (precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Número invalido digite números maiores que 0 e utilizando '.'";
      });
    }else{

      /*
      Se o preço do álcool dividido pelo preço da gasolina
      for >= a 0.7 é melhor abastecer com gasolina
      senão é melhor utilizar álcool
       */

      if(precoAlcool/precoGasolina >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina.";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com álcool.";
        });
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text("Álcool ou Gasolina"),
          backgroundColor: const Color(0xFF2a3895),
        ),
      body: Container(

         /* decoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.amber),
        ), */

        child: SingleChildScrollView(     // Possibilitar rolagem de tela pelo app todo
          padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          //IMAGEM LOGO

          children: [
            Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 40),
            child: Image.asset("images/logo.png"),
        ),


             // TEXTO

             const Padding(
                 padding: EdgeInsets.only(bottom: 70),
             child: Text(
                "Saiba qual é a melhor opção para abastecimento do seu carro.",
                    textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
             ),


             // ALCOOL TEXTFIELD

             TextField(
              keyboardType:  TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Insira preço álcool           ex: 1.99",
              ),
              maxLength: 5,   // Não é necessário mais que 5 digítos.
              controller: _controllerAlcool,
            ),


              //GASOLINA TEXTFIELD

              TextField(
               keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Insira preço gasolina           ex: 1.99",
              ),
              maxLength: 5,
                controller: _controllerGasolina,
            ),


            //BOTAO CALCULAR
            Padding(
              padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
                onPressed: _calcular,
                style:  ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xB32a3895),
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                    "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
            ),
    ),


            //EXIBIÇÃO RESULTADO

              Padding(
                padding: const EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
