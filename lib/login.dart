import 'dart:async';

import 'package:cicd_test/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Timer? timer;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer= Timer (const Duration(seconds: 5),
            ()=>Navigator.pushReplacementNamed(context, ''));
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  bool isChanged = true;
  String password = '';
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isObscureText = true;
  bool isObscureConfirmText = true;
  bool isConfirmed = true;
  RegExp regExp = RegExp(
    r'^[a-zA-Z0-9-._]+@[a-z]+\.[a-z]{2,3}$',
  );
  RegExp regExp1 = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,32}$');

  String _validEmail(){
    final txt = myController.text;
    if(txt.isEmpty){
      return'Can\'t be a null';
    }else if((RegExp(r'(?=.*?[\s])').hasMatch(txt))){
      return '!! Spaces is not allowed';
    }
    else{
      return "Please enter valid email";
    }
  }

  String _passwordError(){
    final txt = myController1.text;
    if(regExp1.hasMatch(txt)){
      return _checkPassword();
    }else if(myController2.text.isNotEmpty && (myController2.text !=myController1.text)){
      return 'Password is not same';
    }else{
      return '';
    }
  }

  String _checkPassword(){
    final txt = myController1.text;
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

    else{
      return "please enter min 8 characters";
    }
  }

  Future<void> initPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/img.png',
                  fit: BoxFit.fitHeight,
                )),
          ),
          Center(
            child: Container(
              height: 600,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(top: 200, left: 70, right: 70),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/netflix.png',
                      color: const Color(0xffe50812),
                    ),
                    Container(
                      height: 40,
                      margin: const EdgeInsets.only(top: 75),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              key: Key('email'),
                              controller: myController,
                              onChanged: (String value) {
                                setState(() {
                                  if (regExp.hasMatch(value)) {
                                    print('valid');
                                    isEmailValid = true;
                                  }else if(myController2.text.isNotEmpty && (myController2.text !=myController1.text)){
                                    isEmailValid = false;
                                  }
                                  else {
                                    print('invalid');
                                    isEmailValid = false;
                                  }
                                });
                              },
                              autofocus: false,
                              style: const TextStyle(color: Colors.black),
                              onTap: () {
                                setState(() {
                                  if (myController.text.isEmpty) {
                                    isEmailValid = false;
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Email or Phone number',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                //errorText: isEmailValid?null:'Enter valid email',
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.only(left: 18, bottom: 5),
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            indent: 5,
                            endIndent: 5,
                            color: Color(0xfff2f2f2),
                            thickness: 2,
                          ),
                          Container(
                              padding: const EdgeInsets.all(5),
                              height: 35,
                              width: 35,
                              child: Image.asset('assets/images/india.png'))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 85),
                      child: SizedBox(
                        height: 20,
                        child: isEmailValid
                            ? null
                            :  Text(_validEmail(),
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      //margin: const EdgeInsets.only(top: 20),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: TextField(
                        key: Key('password'),
                        controller: myController1,
                        onChanged: (String value) {
                          setState(() {
                            if (regExp1.hasMatch(value)) {
                              print('valid password');
                              isPasswordValid = true;
                              password = value;
                            } else {
                              print('invalid password');
                              isPasswordValid = false;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            if (myController1.text.isEmpty) {
                              isPasswordValid = false;
                            }
                          });
                        },
                        autofocus: false,
                        obscureText: isObscureText,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          //errorText: isPasswordValid?null:'Enter 8 digit password',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding:
                          const EdgeInsets.only(left: 18, top: 7, bottom: 10),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (isObscureText) {
                                  isObscureText = false;
                                } else {
                                  isObscureText = true;
                                }
                              });
                            },
                            icon: Icon(isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: SizedBox(
                        height: 20,
                        child: isPasswordValid
                            ? null
                            :  Text(
                          _passwordError(),
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      //margin: const EdgeInsets.only(top: 20),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: myController2,
                        onChanged: (String value) {
                          setState(() {
                            if (value == password) {
                              print('password is confirmed');
                              isConfirmed = true;
                            } else {
                              print('password is not same');
                              isConfirmed = false;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            if (myController2.text.isEmpty) {
                              isConfirmed = false;
                            }

                          });
                        },
                        autofocus: false,
                        obscureText: isObscureConfirmText,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          //errorText: isConfirmed?null:'Enter the same password above',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),

                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding:
                          const EdgeInsets.only(left: 18, top: 7, bottom: 5),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (isObscureConfirmText) {
                                  isObscureConfirmText= false;
                                } else {
                                  isObscureConfirmText= true;
                                }
                              });
                            },
                            icon: Icon(isObscureConfirmText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: isConfirmed
                          ? null
                          : const Text(
                        '!! Enter the same password above',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        key: Key('login_btn'),
                          onPressed: () {
                            if (myController.text.isNotEmpty &&
                                myController1.text.isNotEmpty &&
                                myController2.text.isNotEmpty &&
                                (password==myController2.text) &&
                                isEmailValid &&
                                isPasswordValid &&
                                isConfirmed) {
                              initPreferences();
                              Get.to(()=>HomeScreen());
                            }
                            else if(password!=myController2.text){

                              print('Password is not same');

                            }
                            else  {
                              print('Please enter valid email and password');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffe50812),
                            onPrimary: Colors.white,
                            fixedSize: const Size(290, 40),
                            elevation: 20,
                            shadowColor: const Color(0xffe50812),
                          ),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40, top: 30),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChanged,
                            onChanged: (bool? value) {
                              setState(() {
                                isChanged = value!;
                              });
                            },
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.all(
                                const Color(0xffe50812)),
                          ),
                          const Text(
                            'Remember my login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 58, top: 30),
                      child: Row(
                        children: const [
                          Text(
                            'Already on LoginScreen?',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sign in',
                            style: TextStyle(
                              color: Color(0xffe50812),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 720, left: 330),
            height: 30,
            width: 25,
            padding: const EdgeInsets.only(left: 1, right: 1),
            child: Image.asset(
              'assets/images/amplifier.png',
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
