class Pessoa{
  String _nome = "";
  double _peso = 0;
  double _altura = 0;

  void setNome(String nome){
    _nome = nome;
  }

  String getNome(){
    return _nome.toUpperCase();
  }

  void setPeso(double peso){
    _peso = peso;
}

double getPeso(){
  return _peso;
}

  void setAltura(double altura){
  _altura = altura;
}

double getAltura(){
  return _altura;
}

}
