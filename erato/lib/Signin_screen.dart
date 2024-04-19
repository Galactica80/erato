import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  SnackBar snackbar = const SnackBar(content: Text('Login Successfull!'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 
      Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text('Welcome To Erato!',
                    style: GoogleFonts.lato(
                        
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Email',
                    style: TextStyle(color: Color(0xff808080)),
                  ),
                  hintText: 'Enter your email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: emailController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Password',
                    style: TextStyle(color: Color(0XFF808080)),
                  ),
                  hintText: 'Enter  your password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: passwordController,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff414BB2),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.37,
                      vertical: 15),
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    auth
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                       Navigator.pushNamed(context, '/home');
                    }).catchError((e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString()))); 
                    });
                  }
                 
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password ?',
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign up with Email',
                      style: GoogleFonts.lato(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        child: const Image(
                            image: AssetImage('assets/google.jpg'),
                            width: 50,
                            height: 50)),
                    GestureDetector(
                        child: const Image(
                      image: AssetImage('assets/microsoft.jpg'),
                      width: 50,
                      height: 50,
                    )),
                    GestureDetector(
                        child: const Image(
                      image: AssetImage('assets/LinkedIn.jpg'),
                      width: 50,
                      height: 50,
                    )),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                 // Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Terms',
                  style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
