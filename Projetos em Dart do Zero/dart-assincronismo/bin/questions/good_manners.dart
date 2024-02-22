class GoodManners{
  String question;
  bool isGoodManners = false;
  String kakoBot = 'KakoBot: \n';
  GoodManners(this.question);

  bool isThisManners(){
    if(question.contains('oi') ||
      question.contains('ola') ||
      question.contains('Obrigado') ||
      question.contains('bom dia') ||
      question.contains('boa tarde')){
        isGoodManners = true;
      }
      return isGoodManners;
  }

  goodManners(){
    if(question.contains('Bom dia') || question.contains('bom dia')){
      print(kakoBot +'Bom dia!');
    }else if(question.contains('Boa Tarde') || question.contains('boa tarde')){
      print(kakoBot +'Boa Tarde!');
    }
  }
}