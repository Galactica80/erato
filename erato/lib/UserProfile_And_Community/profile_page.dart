import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var user_role;
  var user_name;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late var user = auth.currentUser!.uid;
  @override
  //very important function here I am retrieving all doc info where user id matches UID attribute and setting username and role varianble with required data

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Users")
        .where("UID", isEqualTo: auth.currentUser?.uid)
        .get()
        .then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          setState(() {
            var userdata = docSnapshot.data();
            user_name = userdata['Username'];
            user_role = userdata['role'];
          });
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text('$user_name',
                  style: GoogleFonts.lato(
                      fontSize: 30, fontWeight: FontWeight.bold))),
          Center(
              child: Text(
            '$user_role',
            style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Text(
            'Bio : ',
            style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Posts : ',
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Followers : ',
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Following : ',
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  backgroundColor: const Color(0XFF666666),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Text(
                "Follow",
                style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Text(
            'Feed/Recent story posts',
            style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
