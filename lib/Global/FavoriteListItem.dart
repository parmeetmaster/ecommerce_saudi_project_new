import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Screens/DetailScreen/DetailScreen.dart';
import 'package:flutter_app_demo_saudi/model/product_model.dart';

class FavouriteListItem extends StatefulWidget {
  Results result;
int index;
Function(int) removefunction;
  FavouriteListItem({this.result,this.index,this.removefunction});

  @override
  _FavouriteListItemState createState() => _FavouriteListItemState();

  void removecart() {
    removefunction(index); //calling parent remove function
  }
}

class _FavouriteListItemState extends State<FavouriteListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.network(widget.result.image))),
                Expanded(
                    flex: 6,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, DetailScreen.screename,arguments: widget.result);
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${widget.result.title}",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Price: \$ ${widget.result.prices.currentPrice}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                            Text(
                              "Rating: ${widget.result.reviews.stars}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: widget.removecart,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove_shopping_cart_rounded,
                            color: Colors.red,
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
