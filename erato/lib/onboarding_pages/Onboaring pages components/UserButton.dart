import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserButton extends StatelessWidget {
  final DocumentReference? doc;
  final String buttontext;
  UserButton({super.key, required this.buttontext, this.doc});
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color(0XFF808080)),
          ),
        ),
        onPressed: () {
          users
              .doc(doc!.id)
              .set({'role': buttontext}, SetOptions(merge: true)).then(
                  (value) => Navigator.pushNamed(context, '/signin'));
        },
        child: Text(
          buttontext,
          style: GoogleFonts.lato(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
