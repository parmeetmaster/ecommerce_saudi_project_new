import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/model/product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItem extends StatelessWidget {
  Results item;
  Results item2;

  ProductItem(Results item, Results item2) {
    this.item = item;
    this.item2 = item2;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.49,
          height: MediaQuery.of(context).size.width * 0.85,
          margin: new EdgeInsets.all(1.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.width * 0.45,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                            "${item.image}",
                            fit: BoxFit.scaleDown,
                          ))),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Text(
                    "${item.title}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17, color: Colors.black87,fontWeight: FontWeight.w500),
                  ),
                  //Text("${item2.prices.previousPrice}",style:   TextStyle(decoration: TextDecoration.lineThrough),),
                  SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${item.prices.currency} ${item.prices.currentPrice}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17, color: Colors.black87,fontWeight: FontWeight.w800),
                      ))
                ],
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.49,
          height: MediaQuery.of(context).size.width * 0.85,
          margin: new EdgeInsets.all(1.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.width * 0.45,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                            "${item2.image}",
                            fit: BoxFit.scaleDown,
                          ))),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Text(
                    "${item2.title}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17, color: Colors.black87,fontWeight: FontWeight.w500),
                  ),
                  //Text("${item2.prices.previousPrice}",style:   TextStyle(decoration: TextDecoration.lineThrough),),
                  SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${item2.prices.currency} ${item2.prices.currentPrice}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17, color: Colors.black87,fontWeight: FontWeight.w800),
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
