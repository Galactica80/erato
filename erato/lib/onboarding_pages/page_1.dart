import 'package:erato/onboarding_pages/Onboaring%20pages%20components/SocialButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialsPage extends StatelessWidget {
  const SocialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Let people find You share on social!',
          style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        const SocialButton(
          icon_title: Icons.facebook,
          button_name: 'Facebook',
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        const SocialButton(
          icon_title: FontAwesomeIcons.twitter,
          button_name: 'Twitter',
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        const SocialButton(
          icon_title: FontAwesomeIcons.instagram,
          button_name: 'Instagram',
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        const SocialButton(
          icon_title: FontAwesomeIcons.linkedin,
          button_name: 'LinkedIn',
        ),
      ]),
    );
  }
}
