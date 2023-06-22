import 'package:flutter/material.dart';
import 'package:myapp/pages/functions/widgets/desceription.dart';
import 'package:myapp/utiles/text.dart';

// ignore: must_be_immutable
class PopularTvShows extends StatelessWidget {
  PopularTvShows({super.key, required this.populartvshows});

  List populartvshows;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiesText(
              text: 'Popular Tv Shows',
              color: Color.fromARGB(255, 226, 226, 226),
              size: 26),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.all(7),
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
                                  name: populartvshows[index]['name'] ??
                                      'Not Loaded',
                                  // ignore: prefer_interpolation_to_compose_strings
                                  bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                      populartvshows[index]['backdrop_path'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  posterurl: 'http://image.tmdb.org/t/p/w500' +
                                      populartvshows[index]['poster_path'],
                                  description: populartvshows[index]
                                          ['overview'] ??
                                      'Not Found',
                                  vote: populartvshows[index]['vote_average']
                                      .toString(),
                                  launchon: populartvshows[index]
                                          ['release_date'] ??
                                      "Not Found",
                                )));
                  },
                  child: SizedBox(
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
                                          populartvshows[index]
                                              ['poster_path']))),
                        ),
                        Container(
                          child: ModifiesText(
                              text: populartvshows[index]['name'] != null
                                  ? populartvshows[index]['name']
                                  : 'Loading',
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 18),
                        )
                      ],
                    ),
                  ),
                );
              }),
              itemCount: populartvshows.length,
            ),
          )
        ],
      ),
    );
  }
}
