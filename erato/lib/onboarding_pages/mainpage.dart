import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erato/onboarding_pages/page3.dart';
import 'package:erato/onboarding_pages/page_1.dart';
import 'package:erato/onboarding_pages/page_2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    DocumentReference doc= ModalRoute.of(context)!.settings.arguments as DocumentReference;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children:  [
                GenderPage(doc: doc,),
                const SocialsPage(),
                 UserPage(doc: doc)
                
              ],
              // Add your widget content here
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const WormEffect(
              activeDotColor: Colors.black,
              dotColor: Colors.grey,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),    
        ],
      ),
    );
  }
}
