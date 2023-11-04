import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/style.dart';
import 'best_seller_listview.dart';
import 'best_seller_listview_item.dart';
import 'custom_app_bar.dart';
import '../../../../../core/utils/assets.dart';
import 'featured_books_listview.dart';
import 'custom_book_image.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
child:  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomAppBar(),
    ),
    FeaturedBooksListView(),
    SizedBox(
      height: 50,
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Newset Books',
        style: Styles.textStyle18,
      ),
    ),
    SizedBox(
      height: 20,
    ),
    //  BestSellerListViewItem(),
  //  BestSellerListView(),
  ],
),
        ),
   const     SliverFillRemaining(
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ) ,
        ),
      ],
    );
    
  }
}


