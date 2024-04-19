import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

//

class SocialButton extends StatelessWidget {
  final icon_title;
  final button_name;
  const SocialButton({super.key, this.icon_title, this.button_name});
  FontAwesomeIcons get icon => icon_title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: FaIcon(icon_title, color: Colors.white),
        label: Text(
          '$button_name',
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
      ),
    );
  }
}
