import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/escolha.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);      /* Orientação de tela, nesse caso não
                                                 é possivel girar a tela */

  runApp(const MaterialApp(
    home: escolha(),
    debugShowCheckedModeBanner: false,
  ));
}
