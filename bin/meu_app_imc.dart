import 'dart:convert';
import 'dart:io';

import 'package:meu_app_imc/meu_app_imc.dart' as meu_app_imc;
import 'package:meu_app_imc/classes/pessoa.dart';

void main(List<String> arguments) {
  meu_app_imc.execute();
  
  var p1 = new Pessoa();
  p1.setNome(lerConsole("Digite o nome: "));
  
  p1.setPeso(lerDouble("Digite o peso: "));
  p1.setAltura(lerDouble("Digite a altura: "));

  print(p1.getNome());
  //print(p1.getAltura());
  //print(p1.getPeso());

  double imc = p1.getPeso() / (p1.getAltura()*p1.getAltura());

  switch(imc){
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
      print("Obesidae Grau I");   
    case >= 35 && < 40:
      print("Obesidae Grau II (Severa)");  
    case >=40:
      print("Obesidae Grau III (Morbida)");  
      break;
      default:
      print("Valor não encontrado");
      exit(0);

  }

  print("Seu IMC  é = $imc"); 
}


String lerConsole(String texto){
  print(texto);
  try{
    var line = stdin.readLineSync(encoding: utf8);
    return line ?? "";
  }catch(e){
    print("Erro ao ler o console: $e");
    return "";
}
}

double lerDouble(String texto){
  try{
  var numero = double.tryParse(lerConsole(texto));
  return numero ?? 0.0;
}catch(e){
  print("Erro ao ler o console: $e");
  return 0.0;
}
}
