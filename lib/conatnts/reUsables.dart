import 'package:cryptoapp/ViewModels/HomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../Model/CryptoListModel.dart';
import '../views/CCdetailview.dart';

class reUrow extends StatelessWidget {
  String firsttitle;
  String firstValue;
  String secondtitle;
  String secondValue;

  reUrow(
      {super.key,
      required this.firsttitle,
      required this.firstValue,
      required this.secondtitle,
      required this.secondValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firsttitle,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(firstValue,
                  style: TextStyle(
                    fontSize: 12,
                  ))
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                secondtitle,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(secondValue,
                  style: TextStyle(
                    fontSize: 12,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class ReusableListTile extends StatelessWidget {
  final CrptoList currntcrpto;
  const ReusableListTile({super.key, required this.currntcrpto});

  @override
  Widget build(BuildContext context) {
    HomeModel homeModel = Provider.of<HomeModel>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CCDetailsView(id: currntcrpto.id!)));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundImage:
                        NetworkImage(currntcrpto.image.toString())),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currntcrpto.name.toString(),
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      currntcrpto.symbol.toString().toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹ ${currntcrpto.currentPrice}",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 10, 108, 188)),
                    ),
                    Builder(builder: (context) {
                      num pricechange = currntcrpto.priceChange24h!;
                      String pchng =
                          currntcrpto.priceChange24h!.toStringAsFixed(3);
                      num pricechangeper =
                          currntcrpto.priceChangePercentage24h!;
                      if (pricechange < 0) {
                        return Text(
                          pchng,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 13),
                        );
                      } else {
                        return Text(
                          pchng,
                          style: const TextStyle(color: Colors.green),
                        );
                      }
                    })
                  ],
                ),
                (currntcrpto.isfav == false)
                    ? IconButton(
                        onPressed: () {
                          homeModel.addFav(currntcrpto);
                        },
                        icon: Icon(Icons.favorite_border_outlined))
                    : IconButton(
                        onPressed: () {
                          homeModel.removeFav(currntcrpto);
                        },
                        icon: Icon(Icons.favorite)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerMarket extends StatelessWidget {
  const ShimmerMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        height: 7,
                        width: 80,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Colors.white,
                        height: 7,
                        width: 40,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.white,
                        height: 7,
                        width: 80,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Colors.white,
                        height: 7,
                        width: 40,
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                ],
              )
            ],
          ),
        ),
        baseColor: Color.fromARGB(255, 94, 94, 94),
        highlightColor: Color.fromARGB(255, 185, 184, 184));
  }
}
