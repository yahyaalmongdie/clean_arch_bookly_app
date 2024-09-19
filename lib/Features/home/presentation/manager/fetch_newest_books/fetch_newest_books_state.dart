part of 'fetch_newest_books_cubit.dart';

 class FetchNewestBooksState extends Equatable {
  const FetchNewestBooksState();

  @override
  List<Object> get props => [];
}

 class FetchNewestBooksInitial extends FetchNewestBooksState {}

class FetchNewestBooksLoading extends FetchNewestBooksState {}

class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errorMessage;

  const FetchNewestBooksFailure({required this.errorMessage});
}
class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity>data;

  const FetchNewestBooksSuccess({required this.data});
}
