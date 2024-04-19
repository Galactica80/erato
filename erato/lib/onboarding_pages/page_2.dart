import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erato/onboarding_pages/Onboaring%20pages%20components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GenderPage extends StatelessWidget {

  DocumentReference ? doc;
   GenderPage({super.key,this.doc});
   

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'What are you ? (choose one)',
            style: GoogleFonts.lato(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
           GenderButton(buttontext: 'Male',doc: doc,),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
           GenderButton(buttontext: "Female",doc: doc,),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
           GenderButton(buttontext: "Non-Binary",doc: doc,),
        ],
      ),
    );
  }
}
