
import 'package:book_store/Page/class.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff240046),
        title: Text(
          "Purchase",
          style: TextStyle(fontSize: 29, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 27),
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          if (ms.cardProducts.isEmpty) {
            return Center(
              child: Text(
                "No products in cart",
                style: TextStyle(fontSize: 25),
              ),
            );
          }

          return ms.cardProducts.length == 1
              ? ListView.builder(
            itemCount: ms.cardProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                            "${ms.cardProducts[index].image}")),
                    Lottie.asset("assets/animation/Animation - 1723605439505.json"),
                    Text(
                      "Purchased Successfully",
                      style: TextStyle(fontSize: 25,color: Colors.purple),
                    ),
                  ],
                ),
              );
            },
          )
              : GridView.builder(
            padding: const EdgeInsets.all(30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: ms.cardProducts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 100,
                    height: 200,
                    child: Image.asset("${ms.cardProducts[index].image}",fit: BoxFit.cover,),
                  ),
                  Lottie.asset("assets/animation/"),
                  Text(
                    "Purchased",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}