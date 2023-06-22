import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:myapp/pages/functions/widgets/populartvshows.dart';
import 'package:myapp/pages/functions/widgets/toprated.dart';
import 'package:myapp/pages/functions/widgets/trending.dart';

import 'package:myapp/pages/functions/widgets/upcomingmovies.dart';
import 'package:myapp/utiles/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  List trendingmovies = [];
  List toprated = [];
  List populartvshows = [];
  List upcoming = [];

  final String apikey = 'c0741a1565834a7a8511cb7f24bae9d5';
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMDc0MWExNTY1ODM0YTdhODUxMWNiN2YyNGJhZTlkNSIsInN1YiI6IjY0N2RjMjA4MGZiMzk4MDBmYjBjOTJiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.v79jzdZKaVAMSKkfMgZIjYs9EgyijkIcd5dTDi1Z8ZQ';

// function to call from api
  Future loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, token),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingMoviesresult =
        await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map populartvshowsResults = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcomingmovies = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    setState(() {
      trendingmovies = trendingMoviesresult['results'];
      toprated = topratedResults['results'];
      populartvshows = populartvshowsResults['results'];
      upcoming = upcomingmovies['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 0, 0),
      // drawer: Drawer(
      //   child: Container(
      //     color: Colors.transparent.withOpacity(0.7),
      //     child: MyListView(),
      //   ),
      // ),

      // app bar
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.logout))
        ],
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

      //body
      body: ListView(
        children: [
          UpcomingMovies(Upcoming: upcoming),
          const Divider(
            thickness: 1,
          ),
          TrendingMovies(trending: trendingmovies),
          const Divider(
            thickness: 1,
          ),
          TopRated(toprated: toprated),
          const Divider(
            thickness: 1,
          ),
          PopularTvShows(
            populartvshows: populartvshows,
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
