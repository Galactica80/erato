import 'package:erato/SubscriptionPage/Subscription_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
        
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
        
         runSpacing: 20,
         runAlignment: WrapAlignment.center,
          
          children: [
            const Center(
              child: Text('This is testing Profile Settings Page'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.height * 0.35,
        
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                  
                      backgroundColor: const Color(0xffE6E6E6),
                     
                      shape: const RoundedRectangleBorder()),
                  onPressed: () {},
                  label: Text(
                    'Edit Profile',
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
                  ),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.height * 0.35,
              child: ElevatedButton.icon(
                
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE6E6E6),
                      
                      shape: const RoundedRectangleBorder()),
                  onPressed: () {
                    Get.to(SubscriptionPage() , transition: Transition.rightToLeft);
                  },
                  label: Text(
                    'Pro Membership',
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
                  ),
                  icon: const Icon(
                    Icons.stars_sharp,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.height * 0.35,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE6E6E6),
                    
                      shape: const RoundedRectangleBorder()),
                  onPressed: () {},
                  label: Text(
                    'Log Out',
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 20),
                  ),
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
