import 'package:cryptoapp/ViewModels/HomeViewModel.dart';
import 'package:cryptoapp/conatnts/reUsables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/CryptoListModel.dart';

class CCDetailsView extends StatefulWidget {
  final String id;
  const CCDetailsView({super.key, required this.id});

  @override
  State<CCDetailsView> createState() => _CCDetailsViewState();
}

class _CCDetailsViewState extends State<CCDetailsView> {
  @override
  Widget build(BuildContext context) {
    theamchanger thmchng = Provider.of<theamchanger>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(child: Consumer<HomeModel>(
          builder: (context, value, child) {
            CrptoList ccd = value.getCCdetail(widget.id);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(ccd.image.toString()),
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ccd.name! + "(${ccd.symbol})",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(
                              ccd.currentPrice.toString(),
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: (thmchng.themeMode == ThemeMode.light)
                                ? Color.fromARGB(255, 233, 233, 233)
                                : Color.fromARGB(255, 32, 32, 32),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Price Change (24h)",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Builder(builder: (context) {
                                    num pricechange = ccd.priceChange24h!;
                                    String pchng =
                                        ccd.priceChange24h!.toStringAsFixed(3);
                                    num pricechangeper =
                                        ccd.priceChangePercentage24h!;
                                    if (pricechange < 0) {
                                      return Text(
                                        "$pricechangeper% ($pchng ₹)",
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 21),
                                      );
                                    } else {
                                      return Text(
                                        "+$pricechangeper% (+$pchng)",
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 21),
                                      );
                                    }
                                  })
                                ],
                              ),
                            ),
                            reUrow(
                                firsttitle: "Market Cap",
                                firstValue: ccd.marketCap.toString(),
                                secondtitle: "Market Cap Rank",
                                secondValue: "# ${ccd.marketCapRank}"),
                            reUrow(
                              firsttitle: "High 24",
                              firstValue: ccd.high24h.toString(),
                              secondtitle: "Low 24",
                              secondValue: ccd.low24h.toString(),
                            ),
                            reUrow(
                              firsttitle: "All Time High",
                              firstValue: ccd.ath.toString(),
                              secondtitle: "All Time Low",
                              secondValue: ccd.atl.toString(),
                            ),
                            reUrow(
                              firsttitle: "Total Supply",
                              firstValue: ccd.totalSupply.toString(),
                              secondtitle: "Max Supply",
                              secondValue: ccd.maxSupply.toString(),
                            ),
                            reUrow(
                              firsttitle: "Total Volume",
                              firstValue: ccd.totalVolume.toString(),
                              secondtitle: "Fully Diluted Valuation",
                              secondValue: ccd.fullyDilutedValuation.toString(),
                            ),
                            reUrow(
                                firsttitle: "Circulating Supply",
                                firstValue: ccd.circulatingSupply.toString(),
                                secondtitle: "",
                                secondValue: ""),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}
