import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../theme/allovertheme.dart';
import '../utils/timeUtils.dart';

class HomeCard extends StatelessWidget {
  HomeCard(
      {Key? key,
       required this.clickListener ,
      required this.title,
      this.author,
      required this.description,
      required this.url,
      this.urlToImage,
      required this.publishedAt,
      required this.content})
      : super(key: key);

  String title;
  String? author;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;
  void Function(String) clickListener ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> clickListener(title),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          left: 3.0,
          top: 15.0,
          right: 3.0,
        ),
        height: 390.0,
        decoration: BoxDecoration(
            color: cardBackGround(context),
            border: Border.all(color: cardBorder(context)),
            borderRadius:
                const BorderRadius.all(Radius.circular(CARD_BORDER_RADIUS))),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: CARD_MARGIN, right: CARD_MARGIN, top: CARD_MARGIN),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                    ),
                  ),
                )),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: CARD_MARGIN, right: CARD_MARGIN, top: CARD_MARGIN),
                child: Center(
                  child: CachedNetworkImage(
                      imageUrl: urlToImage!,
                      width: double.infinity,
                      height: 270.0,
                      fit: BoxFit.cover,
                      placeholder: (BuildContext context, String url) =>
                          Container(color: Colors.purple)),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: CARD_MARGIN, right: CARD_MARGIN, ),
                  child: Container(
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.pink)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(author ?? 'Unknown',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 1,
                            child: Text(convertedDateTime(publishedAt),
                                textAlign:TextAlign.end ,
                                style: const TextStyle(

                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                )),


            /// Description
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: CARD_MARGIN,
                    right: CARD_MARGIN,
                  ),
                  child: Container(
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.amber)),
                    child: Center(
                      child: Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        // style: TextStyle(  ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
