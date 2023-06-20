

import 'package:flutter_test/flutter_test.dart';



void main() {


  test('Empty email test ',(){
    var test = validEmail('');
    expect(test, 'Can\'t be a null');
  });

  test('Empty password test',(){
    var test = checkPassword('');
    expect(test, 'Can\'t be a null');
  });


  test('Valid email test ',(){
    var test = validEmail('anurag@gmail.com');
    expect(test, null);
  });

  test('Valid password test',(){
    var test = checkPassword('Anurag@123');
    expect(test, null);
  });
}


String? checkPassword(String text){
  final txt = text;
  if(txt.isEmpty){
    return'Can\'t be a null';
  }else if(!(RegExp(r'(?=.*?[A-Z])').hasMatch(txt))){
    return '!! Please enter a Uppercase letter';
  }
  else if(!(RegExp(r'(?=.*?[a-z])').hasMatch(txt))){
    return '!! Please enter at  Lowercase letter';
  }
  else if(!(RegExp(r'(?=.*?[0-9])').hasMatch(txt))){
    return '!! Please enter a numeric letter';
  }
  else if(!(RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(txt))){
    return '!! Please enter a special character ';
  }
  else if((RegExp(r'(?=.*?[\s])').hasMatch(txt))){
    return '!! Spaces is not allowed';
  }

  else if(txt.length<8){
    return "please enter min 8 characters";
  }else{
    return null;
  }
}

String? validEmail(String text){
  final txt = text;
  if(txt.isEmpty){
    return'Can\'t be a null';
  }else if((RegExp(r'(?=.*?[\s])').hasMatch(txt))){
    return '!! Spaces is not allowed';
  }
  else if(!RegExp(r'^[a-zA-Z0-9-._]+@[a-z]+\.[a-z]{2,3}$',).hasMatch(txt)){
    return "Please enter valid email";
  }else{
    return null;
  }
}
