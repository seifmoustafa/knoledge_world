part of 'popular_books_cubit.dart';

abstract class PopularBooksState extends Equatable {
  const PopularBooksState();

  @override
  List<Object> get props => [];
}

class PopularBooksInitial extends PopularBooksState {}

class PopularBooksLoading extends PopularBooksState {}

class PopularBooksSuccess extends PopularBooksState {
  final List<BookModel> books;

  const PopularBooksSuccess({required this.books});
}

class PopularBooksFailure extends PopularBooksState {
  final String errMessage;

  const PopularBooksFailure({required this.errMessage});
}
