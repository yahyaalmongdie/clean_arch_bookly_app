part of 'fetch_featured_books_cubit.dart';

class FetchFeaturedBooksState extends Equatable {
  const FetchFeaturedBooksState();

  @override
  List<Object> get props => [];
}
class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}

class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}

class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errorMessage;

  const FetchFeaturedBooksFailure({required this.errorMessage});
}
class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<BookEntity>data;

  const FetchFeaturedBooksSuccess({required this.data});
}
