import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:women_saftey/widgets/home_widgets/safeWebView.dart';

import '../../utils/quotes.dart';

class CustomCarouel extends StatelessWidget {
  const CustomCarouel({Key? key}) : super(key: key);

  Future<String> openMap(String index) async {
    switch (index) {
      case "0":
        return "https://www.business-standard.com/content/press-releases-ani/top-10-inspiring-indian-women-achievers-you-should-follow-in-2023-123100300787_1.html";
      case "1":
        return "https://plan-international.org/ending-violence/16-ways-end-violence-girls";
      case "2":
        return "https://www.healthline.com/health/womens-health/self-defense-tips-escape";
      default:
        return "https://www.youtube.com/results?search_query=women+self+defense+techniques";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: List.generate(
          imageSliders.length,
              (index) => Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () async {
                // Open the URL when a card is tapped
                String url = await openMap(index.toString());
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  Fluttertoast.showToast(msg: "Could not launch URL");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageSliders[index]),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 8),
                      child: Text(
                        articleTitle[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize:
                          MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
