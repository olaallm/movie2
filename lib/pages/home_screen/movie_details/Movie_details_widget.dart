import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_appp/app_colors.dart';
import 'package:movie_appp/pages/home_screen/api/api_constant.dart';
import 'package:movie_appp/pages/home_screen/model/movieDetails.dart';
import 'package:movie_appp/pages/home_screen/more_like_this/more_like_this_details_view.dart';
import 'package:movie_appp/pages/home_screen/movie_details/movie_Info.dart';
import 'package:movie_appp/pages/home_screen/widgets/video_slider_widget.dart';
import 'package:movie_appp/pages/watch_list/watch_list_view.dart';

import '../widgets/cast_widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetails movie;

  MovieDetailsWidget({required this.movie});

  @override
  Widget build(BuildContext context) {
    final fullImageUrl = ApiConstant.imageUrl + (movie.posterPath ?? "");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title ?? 'Movie Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

                child:VideoSliderWidget(movieId: movie.id.toString())
            ),
            MovieInfo(movie: movie,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.cast,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Container(
              height: 150,
                child: CastWidget(credits: movie.credits!)),
            Container(color: AppColors.backgroundColor,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.more,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Container(
                      height: 310,
                      child: MoreLikeThisDetailsView(id: movie.id.toString())),
                ],
              ),
            ),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
