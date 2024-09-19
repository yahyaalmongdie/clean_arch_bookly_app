import 'package:bookly/Features/home/presentation/manager/fetch_newest_books/fetch_newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {

           return BestSellerListView(books:state.data);
        } else if (state is FetchNewestBooksFailure) {
          return CustomErrorWidget(state.errorMessage);
        } else {
          return CustomCircularProgressIndicator();
        }
       
      },
    );
  }
}
