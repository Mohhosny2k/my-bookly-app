import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presention/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presention/views/book_details_view.dart';
import '../../features/home/presention/views/home_view.dart';
import '../../features/search/presention/views/search_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presention/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) =>  BlocProvider(
        create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
