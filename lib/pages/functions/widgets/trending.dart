import 'package:flutter/material.dart';
import 'package:myapp/pages/functions/widgets/desceription.dart';
import 'package:myapp/utiles/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiesText(
            text: 'Trending Movies',
            color: Color.fromARGB(255, 226, 226, 226),
            size: 26,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 320,
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
                                  name:
                                      trending[index]['title'] ?? 'Not Loaded',
                                  bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  posterurl: 'http://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  description: trending[index]['overview'] ??
                                      'Not Found',
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  launchon: trending[index]['release_date'] ??
                                      "Not Found",
                                )));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
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
                                          trending[index]['poster_path']))),
                        ),
                        Container(
                          child: ModifiesText(
                              text: trending[index]['title'] ?? 'Loading',
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 18),
                        )
                      ],
                    ),
                  ),
                );
              }),
              itemCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}
