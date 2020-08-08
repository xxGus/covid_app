import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/shared_widgets/app_widgets.dart';
import 'package:covid_app/shared_widgets/covidapp_container.dart';
import 'package:covid_app/ui/tips/tips_item.dart';
import 'package:flutter/material.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: <Widget>[
          AppWidget(
            image: "assets/images/semfundo-quiz.png",
            tagline: 'Dicas',
            imageTop: 45,
          ),
          Container(
            padding: EdgeInsets.only(top: 250),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                TipsItem(
                  text: 'Lavar as mãos',
                  urlImg: 'assets/images/wash-your-hands.gif',
                  onTap: (){
                  },
                ),
                TipsItem(
                  text: 'Usar máscara',
                  urlImg: 'assets/images/wear-mask.gif',
                  onTap: (){
                  },
                ),
                TipsItem(
                  text: 'Distanciamento',
                  urlImg: 'assets/images/social-distancing.gif',
                  onTap: (){
                  },
                ),
                TipsItem(
                  text: 'Álcool em gel',
                  urlImg: 'assets/images/hand-sanitizer.gif',
                  onTap: (){
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//  CovidAppContainer(
//             child: Center(
//               child: ListView(
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 children: <Widget>[
//                   TipsItem(
//                     text: 'Lavar as mãos',
//                     onTap: () {
//                       Navigator.of(context).pushNamed(
//                         Routes.wash,
//                       );
//                     },
//                   ),
//                   TipsItem(
//                     text: 'Usar máscara',
//                     onTap: () {
//                       Navigator.of(context).pushNamed(
//                         Routes.mask,
//                       );
//                     },
//                   ),
//                   TipsItem(
//                     text: 'Distanciamento',
//                     onTap: () {},
//                   ),
//                   TipsItem(
//                     text: 'Álcool em gel',
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//           )
