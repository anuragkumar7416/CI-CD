
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 30,right: 30,top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              child: const Text('Login',style: TextStyle(color: Colors.black,fontSize: 45,
                  fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(

              decoration: InputDecoration(

                labelText: "Enter Username",
                border: OutlineInputBorder(),


              ),

            ),
            SizedBox(
              height: 30,
            ),
            TextField(

              decoration: InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(),

              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10,right:150,bottom: 40),
              child: Text('Forgot your password?',style:TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              )),
            ),

            ElevatedButton(
              onPressed: (){}, child: Text('LOGIN'),

              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                  fixedSize: Size(360,50),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )

              ),),
            SizedBox(
              height: 40,
            ),
            Text('or login with',style:TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            )),
            Container(
              margin: const EdgeInsets.only(top: 30,bottom: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/facebook-3.png'),
                  const SizedBox(width: 20,),
                  Image.asset('assets/images/google.png'),
                  const SizedBox(width: 20,),
                  Image.asset('assets/images/linkedin-3.png'),
                ],
              ),
            ),




            Container(
                margin: const EdgeInsets.only(top: 35),
                child: const Text("Don't have an account? Sign up",style: TextStyle(
                  color:Colors.grey,
                  fontWeight: FontWeight.bold,
                ),)),
          ],
        ),
      ),
    );
  }
}