import 'package:flutter/material.dart';
import 'package:myapp/utiles/text.dart';

//description page

class Description extends StatelessWidget {
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchon});
  final String name, description, bannerurl, posterurl, vote, launchon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 0, 0),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 9,
        title: const Center(
            child: ModifiesText(
          text: 'T M D B  A P P',
          size: 30,
        )),
        backgroundColor: const Color.fromARGB(221, 157, 18, 18),
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(20, 26.0))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: ModifiesText(
                        text: 'Average Rating -  ⭐ ' + vote,
                        size: 16,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ModifiesText(
                text: name,
                color: Colors.white,
                size: 24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: ModifiesText(
                text: 'Releasing On  ' + launchon,
                size: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 220,
                  width: 120,
                  child: Image.network(posterurl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: ModifiesText(
                    text: description,
                    size: 14,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
