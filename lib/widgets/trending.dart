import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:natflix_small/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Trending Movies',
            size: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'http://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ModifiedText(
                              text: trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'Loading'),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}
