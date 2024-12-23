






















import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/fetch_featured_books/fetch_featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/fetch_newest_books/fetch_newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  setUpServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FetchFeaturedBooksCubit(
              FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()))..fetchFeaturedBooks();
        }),
        BlocProvider(create: (context) {
          return FetchNewestBooksCubit(
              FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()))..fetchNewestBooks();
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}

