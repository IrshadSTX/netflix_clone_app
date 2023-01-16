import 'package:flutter/material.dart';
import 'package:natflix_small/utils/text.dart';
import 'package:natflix_small/widgets/trending.dart';

import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '75b502494e3519396aa5809f2dc600df';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NWI1MDI0OTRlMzUxOTM5NmFhNTgwOWYyZGM2MDBkZiIsInN1YiI6IjYzYzQyMjI3MDIzMWYyMDBiNjM3YjhkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.uhnzx6J12DF2FMQ15ZZHQbzKYsz05Dk_cvXKx5pQ0Ak';

  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(text: 'Free Movies'),
      ),
      body: ListView(
        children: [
          TrendingMovies(
            trending: trendingmovies,
          ),
        ],
      ),
    );
  }
}
