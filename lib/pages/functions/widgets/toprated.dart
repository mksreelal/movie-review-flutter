import 'package:flutter/material.dart';
import 'package:myapp/pages/functions/widgets/desceription.dart';
import 'package:myapp/utiles/text.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});
  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiesText(
            text: 'Top Rated Movies',
            color: Color.fromARGB(255, 226, 226, 226),
            size: 26,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    // information send page to view details
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: toprated[index]['name'] ?? 'Not Loaded',
                                  bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                      toprated[index]['backdrop_path'],
                                  posterurl: 'http://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path'],
                                  description: toprated[index]['overview'] ??
                                      'Not Found',
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launchon: toprated[index]['release_date'] ??
                                      "Not Found",
                                )));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']))),
                        ),
                        ModifiesText(
                            text: toprated[index]['title'] ?? 'Loading',
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 18)
                      ],
                    ),
                  ),
                );
              }),
              itemCount: toprated.length,
            ),
          )
        ],
      ),
    );
  }
}
