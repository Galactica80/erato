import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erato/onboarding_pages/Onboaring%20pages%20components/Buttons.dart';
import 'package:erato/onboarding_pages/Onboaring%20pages%20components/UserButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatelessWidget {
  final DocumentReference? doc;
  const UserPage({super.key, this.doc});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Choose your path',
            style: GoogleFonts.lato(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          UserButton(
            buttontext: 'Writer',
            doc: doc,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          UserButton(
            buttontext: "Reader",
            doc: doc,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          UserButton(
            buttontext: "Role-Player",
            doc: doc,
          ),
        ],
      ),
    );
  }
}
