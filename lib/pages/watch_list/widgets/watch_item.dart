


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_appp/app_colors.dart';
import 'package:movie_appp/pages/home_screen/api/api_constant.dart';
import 'package:movie_appp/pages/home_screen/model/movie_response.dart';
import 'package:movie_appp/pages/home_screen/movie_details/movie_details_view.dart';
import 'package:movie_appp/pages/watch_list/cubit/movies_state.dart';
import 'package:movie_appp/pages/watch_list/cubit/watch_list_view_model.dart';
import 'package:movie_appp/pages/watch_list/widgets/book_mark_widget.dart';

class WatchItem extends StatefulWidget {
  final Movie movie;

  WatchItem({Key? key, required this.movie}) : super(key: key);

  @override
  State<WatchItem> createState() => _WatchItemState();
}

class _WatchItemState extends State<WatchItem> {
  late WatchListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = WatchListViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<WatchListViewModel, MoviesState>(
        listener: (context, state) {
          if (state is FinishState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.finishMessage)),
            );
          }
        },
        builder: (context, state) {
          return Container(
            height: 120,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Slidable(
              closeOnScroll: true,
              startActionPane: ActionPane(
                extentRatio: 0.20,
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    onPressed: (context) {
                      viewModel.removeMovieFromFireStore(widget.movie);
                    },
                    backgroundColor: AppColors.yellowColor,
                    foregroundColor: AppColors.blackColor,
                    icon: Icons.delete,
                    label: 'Delete', // Replace AppLocalizations with actual text or localization handling
                    padding: const EdgeInsets.all(10),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailsView(movieId: widget.movie.id.toString()),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.8),
                        blurRadius: 10,
                        spreadRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: ApiConstant.baseImageUrl +
                                  (widget.movie.posterPath ?? ''),
                              placeholder: (context, url) =>
                                  Center(
                                    child: LoadingAnimationWidget.staggeredDotsWave(
                                      color: AppColors.whiteColor,
                                      size: 50,
                                    ),
                                  ),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                            Positioned(
                              top: -6,
                              left: -7,
                              child: BookMarkWidget(movie: widget.movie),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.movie.title ?? '',
                              style: TextStyle(color: AppColors.whiteColor),
                              maxLines: 3,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.movie.overview ?? 'No Overview Available',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 10,
                                color: AppColors.whiteColor,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: AppColors.yellowColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  widget.movie.voteAverage?.toStringAsFixed(1) ?? 'N/A',
                                  style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
                                ),
                                const SizedBox(width: 5),
                                Icon(
                                  Icons.date_range,
                                  size: 17,
                                  color: AppColors.yellowColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  widget.movie.releaseDate ?? "",
                                  style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
