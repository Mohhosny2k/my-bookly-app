import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/book_model/book_model.dart';
import 'book_rating.dart';
import 'similar_books_list_view.dart';
import 'similar_books_section.dart';
import 'package:flutter/material.dart';
import 'books_action.dart';
import 'books_details_section.dart';
import 'custom_book_details_appbar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookmodel ,});
  final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children:  [
               const CustomBookDetailsAppBar(),
                BookDetailsSection(bookmodel: bookmodel,),
              const  Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
              const  SimilarBooksSection(),
            const    SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
