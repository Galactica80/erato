import 'dart:math';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Map<String, String> user = Map();
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController usernamecontroller = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController displaynamecontroller = TextEditingController();

  final TextEditingController phonenumberController = TextEditingController();

  var picked_country;

  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    'Full Name',
                    style: TextStyle(color: Color(0xff808080)),
                  ),
                  hintText: 'Enter your Full Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: fullNameController,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your Full Name' : null,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Color(0XFF808080))),
                      padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal:
                              MediaQuery.of(context).size.width * 0.37)),
                  onPressed: () {
                    showCountryPicker(
                        context: context,
                        onSelect: (Country country) {
                          print('Selected country: ${country.displayName}');
                          setState(() {
                            picked_country = country.displayName;
                          });
                        });
                  },
                  child: Text(
                    'Country',
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 103, 102, 102),
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  )),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Username',
                    style: TextStyle(color: Color(0XFF808080)),
                  ),
                  hintText: 'Enter your Username',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: usernamecontroller,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your Username' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Display Name',
                    style: TextStyle(color: Color(0XFF808080)),
                  ),
                  hintText: 'Enter  your Display Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: displaynamecontroller,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  label: Text(
                    'Phone Number',
                    style: TextStyle(color: Color(0XFF808080)),
                  ),
                  hintText: 'Enter  your phone number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF808080)),
                  ),
                ),
                controller: phonenumberController,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your Phone Number' : null,
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
                    user = {
                      'Full Name': fullNameController.text,
                      'Username': usernamecontroller.text,
                      'Display Name': displaynamecontroller.text,
                      'Phone Number': phonenumberController.text,
                      'Country': picked_country,
                    };
                    Navigator.pushNamed(context, '/signup-second',
                        arguments: user);
                  }
      
                  /* users.add({
                    'Full Name': fullNameController.text,
                    'Username': usernamecontroller.text,
                    'Display Name': displaynamecontroller.text,
                    'Phone Number': phonenumberController.text,
                    'Country': picked_country,
                  }).then((DocumentReference doc) => Navigator.pushNamed(
                      context, '/signup-second',
                      arguments: doc));*/
                },
                child: Text(
                  'Next',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
