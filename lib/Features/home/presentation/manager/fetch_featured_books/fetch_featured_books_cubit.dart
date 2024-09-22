import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.featuredBooksUseCase)
      : super(FetchFeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if(pageNumber == 0) {
          emit(FetchFeaturedBooksLoading());
    }
    emit(FetchFeaturedBooksPaginationLoading());
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(FetchFeaturedBooksFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(FetchFeaturedBooksSuccess(data: success));
    });
  }
}
