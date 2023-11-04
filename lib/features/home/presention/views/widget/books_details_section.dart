import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUrl:
                bookmodel.volumeInfo.imageLinks?.thumbnail ??'',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookmodel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
            opacity: .7,
            child: Text(
               bookmodel.volumeInfo.authors?[0] ??'',
              style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            )),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating:  bookmodel.volumeInfo.averageRating??0, //bookModel.volumeInfo.averageRating!,
          count:  bookmodel.volumeInfo.ratingsCount ??0, // bookModel.volumeInfo.ratingsCount!,
        ),
        const SizedBox(
          height: 37,
        ),
     BooksAction(bookModel: bookmodel,),
      ],
    );
  }
}
