

String getRunTimeString(int runtime){
  int a = (runtime ~/ 60);
  int b = (runtime % 60);

  return '${a}h ${b}min';
}