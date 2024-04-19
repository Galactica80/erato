import 'package:erato/SubscriptionPage/subscription_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionPage extends StatelessWidget {
  List<String> texts = [
    'Unlimited messages',
    'Unlimited Story Publishing',
    'Pro profile badge',
    'Monetization (Coming Soon)'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Erato Pro ',
                  style: GoogleFonts.lato(
                      color: const Color(0xff808080), fontSize: 30),
                ),
                const SizedBox(
                  height: 100,
                  width: 100,
                    child:
                        Image(image: AssetImage('assets/eratopro.png')))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            const SubscriptionButton(text: 'Weekly £ 2.99'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            const SubscriptionButton(
              text: 'Monthly £ 5.99',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            const SubscriptionButton(
              text: 'Annual £ 39.99',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              'Benefits',
              style: GoogleFonts.lato(
                  color: const Color(0xff808080), fontSize: 20),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            for (var i in texts)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.black,
                    ),
                    Text(
                      i,
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff808080)),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
