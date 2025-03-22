import 'dart:convert';
import 'dart:io';

import 'package:meu_app_imc/meu_app_imc.dart' as meu_app_imc;
import 'package:meu_app_imc/classes/pessoa.dart';

void main(List<String> arguments) {
  try {
    meu_app_imc.execute();

    var p1 = Pessoa();
    p1.setNome(lerConsole("Digite o nome: "));

    p1.setPeso(lerDouble("Digite o peso: "));
    p1.setAltura(lerDouble("Digite a altura: "));

    if (p1.getPeso() <= 0 || p1.getAltura() <= 0) {
      throw Exception("Peso e altura devem ser valores positivos.");
    }

    print(p1.getNome());

    double imc = p1.getPeso() / (p1.getAltura() * p1.getAltura());

    switch (imc) {
      case < 16:
        print("Magreza Grave");
      case >= 16 && < 17:
        print("Magreza moderada");
      case >= 17 && < 18.5:
        print("Magreza leve");
      case >= 18.5 && < 25:
        print("Saudável");
      case >= 25 && < 30:
        print("Sobrepeso");
      case >= 30 && < 35:
        print("Obesidade Grau I");
      case >= 35 && < 40:
        print("Obesidade Grau II (Severa)");
      case >= 40:
        print("Obesidade Grau III (Mórbida)");
        break;
      default:
        print("Valor não encontrado");
    }

    print("Seu IMC é = $imc");
  } catch (e) {
    print("Ocorreu um erro: ${e.toString()}");
  }
}

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
}

double lerDouble(String texto) {
  while (true) {
    try {
      var numero = double.tryParse(lerConsole(texto));
      if (numero == null || numero <= 0) {
        throw FormatException(
          "Entrada inválida. Digite um número válido e maior que zero.",
        );
      }
      return numero;
    } catch (e) {
      print(e.toString());
    }
  }
}
