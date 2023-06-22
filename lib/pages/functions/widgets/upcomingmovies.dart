import 'package:flutter/material.dart';
import 'package:myapp/pages/functions/widgets/desceription.dart';
import 'package:myapp/utiles/text.dart';

// upcoming movies

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({super.key, required this.Upcoming});
  final List Upcoming;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiesText(
              text: 'Upcoming Movies',
              color: Color.fromARGB(255, 226, 226, 226),
              size: 26),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 280,
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
                                      Upcoming[index]['title'] ?? 'Not Loaded',
                                  bannerurl: 'http://image.tmdb.org/t/p/w500' +
                                      Upcoming[index]['backdrop_path'],
                                  posterurl: 'http://image.tmdb.org/t/p/w500' +
                                      Upcoming[index]['poster_path'],
                                  description: Upcoming[index]['overview'] ??
                                      'Not Found',
                                  vote: Upcoming[index]['vote_average']
                                      .toString(),
                                  launchon: Upcoming[index]['release_date'] ??
                                      "Not Found",
                                )));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          Upcoming[index]['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: ModifiesText(
                              text: Upcoming[index]['title'] != null
                                  ? Upcoming[index]['title']
                                  : 'Loading',
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 18),
                        )
                      ],
                    ),
                  ),
                );
              }),
              itemCount: Upcoming.length,
            ),
          )
        ],
      ),
    );
  }
}
