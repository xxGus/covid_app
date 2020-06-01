import 'package:covid_app/utils/typography.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppWidget extends StatelessWidget {
  final String image;
  final String tagline;
  final double imageTop;

  const AppWidget({Key key, this.image, this.imageTop, this.tagline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(375),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            height: 375,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: spacing(7.5),
                  left: spacing(2.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'ITA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'COV',
                              style: TextStyle(color: accentColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing(3)),
                      headingTextMedium(
                          text: tagline,
                          color: white,
                          fontWeight: FontWeight.w700)
                    ],
                  ),
                ),
                Positioned(
                  top: spacing(7.5),
                  right: spacing(2.5),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Positioned(
                  top: imageTop,
                  right: spacing(3),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
