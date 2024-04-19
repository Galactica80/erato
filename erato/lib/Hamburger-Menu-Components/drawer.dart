import 'package:erato/Hamburger-Menu-Components/contact.dart';
import 'package:erato/UserProfile_And_Community/profile_Settings.dart';
import 'package:erato/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  var about_content =
      "Welcome to Erato, the ultimate platform for writers, readers, and text-based adventure roleplay gamers. Designed for the Coherence multiverse, Erato offers an immersive experience where users can create and explore interconnected stories set across parallel worlds. With intuitive features and a user-friendly interface, Erato empowers creators to unleash their imagination while providing readers with captivating narratives. Join us on a journey through the wonders of storytelling and unlock the limitless possibilities of the Coherence multiverse with Erato.";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Text(
              'Erato',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_rounded),
            title: const Text('Dark Mode'),
            onTap: () {
              Get.snackbar("Dark Mode", "Dark Mode Enabled",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
                  backgroundColor: Colors.black);
              // Handle drawer item tap
              Get.changeTheme(ThemeData.dark());
            },
          ),
          ListTile(
            leading: const Icon(Icons.light_mode_rounded),
            title: const Text('Light Mode'),
            onTap: () {
              Get.snackbar("Light Mode", "Light Mode Enabled",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
                  backgroundColor: Colors.black);
              // Handle drawer item tap
              Get.changeTheme(ThemeData.light());
            },
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('User Guide'),
            onTap: () {
              // Handle drawer item tap
            },
          ),

          ListTile(
            leading: const Icon(FontAwesomeIcons.book),
            title: const Text('Main Story'),
            onTap: () {
              // Handle drawer item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Universe Bible '),
            onTap: () {
              // Handle drawer item tap
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.circleInfo),
            title: const Text('About'),
            onTap: () {
              Get.defaultDialog(
                  content: Text(about_content),
                  title: 'What is Erato?',
                  titlePadding: const EdgeInsets.all(20),
                  contentPadding: const EdgeInsets.all(20));

              // Handle drawer item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () {
              // Handle drawer item tap
              Get.to(ContactForm());
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Terms and Privacy'),
            onTap: () {
              // Handle drawer item tap
            },
          ),
          // Add more ListTile widgets for additional drawer items
        ],
      ),
    );
  }
}
