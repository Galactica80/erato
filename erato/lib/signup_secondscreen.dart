import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUppagetwo extends StatefulWidget {
  late DocumentReference? doc;
  SignUppagetwo({super.key, this.doc});

  @override
  State<SignUppagetwo> createState() => _SignUppagetwoState();
}

class _SignUppagetwoState extends State<SignUppagetwo> {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  SnackBar snackbar = const SnackBar(content: Text('Registered Successfully!'));

  final TextEditingController dateofbirthController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  bool ischecked = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //this was added to get the document reference from the previous screen

    Map? user_data = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Date of Birth',
                    style: TextStyle(color: Color(0XFF808080)),
                  ),
                  hintText: 'Enter your date of birth',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: dateofbirthController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your date of birth';
                  }
                },
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(3000),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                            colorScheme: const ColorScheme.dark(
                                primary: Color(0XFF808080))),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null && picked != selectedDate) {
                    selectedDate = picked;
                  }
                  dateofbirthController.text =
                      selectedDate.toLocal().toString().split(' ')[0];
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Email Address',
                    style: TextStyle(color: Color(0XFF808080)),
                  ),
                  hintText: 'Enter your email address',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your email address';
                  }
                },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Confirm Password',
                    style: TextStyle(color: Color(0XFF808080)),
                  ),
                  hintText: 'Enter  your password again',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: confirmpasswordController,
                validator: (value) => value!.isEmpty
                    ? 'Enter your password again'
                    : value != passwordController.text
                        ? 'Passwords do not match'
                        : null,
              ),
              Row(
                children: [
                  Checkbox(
                      value: ischecked,
                      onChanged: (bool? value) {
                        setState(() {
                          ischecked = value!;
                        });
                      }),
                  Text(
                    "I agree to the T & C ",
                    style: GoogleFonts.lato(
                        color: const Color(0XFF808080),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1,
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff414BB2),
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate() && ischecked) {
                        users.add(user_data).then((doc) =>
                            users.doc(doc.id).set({
                              'dateofbirth': dateofbirthController.text,
                              'email': emailController.text,
                              'password': passwordController.text,
                              'confirmpassword': confirmpasswordController.text,
                              'ischecked': ischecked,
                            }, SetOptions(merge: true)).then((value) => {
                                  auth
                                      .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) => {
                                            users.doc(doc.id).set(
                                                {'UID': auth.currentUser!.uid},SetOptions(merge: true)),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar),
                                            Navigator.pushNamed(
                                                context, '/onboarding',
                                                arguments: doc)
                                          }),
                                }));
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
