import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_engineer_ui_translation_test/app/constants/strings.dart';
import 'package:flutter_engineer_ui_translation_test/bloc/dog_bloc.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/badge_widget.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/category_buttion.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/custom_text_field.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/header_widget.dart';
import 'package:flutter_engineer_ui_translation_test/widgets/product_card.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryButtonModel> categoryButtonData = [
    CategoryButtonModel(const SizedBox(child: Icon(Iconsax.category, size: 18,)), "Category"),
    CategoryButtonModel( const SizedBox(child: Icon(Icons.flight, size: 18)), "Flight"),
    CategoryButtonModel(const SizedBox(child: Icon(Iconsax.bill,size: 18)), "Bill"),
    CategoryButtonModel(const SizedBox(child: Icon(Icons.subscriptions_outlined,size: 18)), "Data Plan"),
    CategoryButtonModel(const SizedBox(child: Icon(Iconsax.save_2,size: 18)), "Top Up"),
  ];
  SliverPersistentHeader makeHeader(String headerText, String actionText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 50.0, maxHeight: 50.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(headerText, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black, fontSize: 20),),
            Text(actionText,  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.teal, fontSize: 15)),
          ],
        )),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogBloc>(context);
    return Scaffold(
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            actions:  [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        child: CustomTextField(
                          onTap: (){},
                          filledColor: Colors.transparent,
                          minLines: null, maxLines: 1, expands: false,
                          hintText: "Search...",
                          prefixIcon: const Padding(padding: EdgeInsets.all(8.0), child: Icon(Iconsax.search_normal, size: 20,),),
                        ),
                      ),
                    ),
                    const Stack(
                      children: [
                        Icon( Iconsax.shop, size: 25,),
                        Positioned(right: 0,
                            child: BagdeWidget(value: "0",))
                      ],
                    ),
                    const SizedBox(width: 10,),
                     const Stack(
                      children: [
                        Icon( Iconsax.message, size: 25,),
                        Positioned(right: 0,
                            child: BagdeWidget(value: "0",))
                      ],
                    ),
                    const SizedBox(width: 20,),
                  ],
                ),
              )
            ],
            expandedHeight: MediaQuery.of(context).size.height / 3.6, floating: true,
            automaticallyImplyLeading: false, backgroundColor: Colors.white, pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background:  CarouselSlider(
                  options: CarouselOptions(
                      height: 254,autoPlayAnimationDuration: const Duration(seconds: 20),
                      autoPlayInterval: const Duration(seconds: 4),
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {});
                      }
                  ), items: List.generate(adverts.length, (index){
                return  Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  height: 220, width: double.maxFinite,
                  child: Image.network(adverts[index], fit: BoxFit.cover,),
                );
              })
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(categoryButtonData.length, (index){
                  return CategoryButton(icon: categoryButtonData[index].icon, title: categoryButtonData[index].buttonTitle ?? "");
                })
              ],
            ),
          ),
          makeHeader('Best Dogs on Sale', "See all"),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,  childAspectRatio: 0.75, mainAxisSpacing: 11, crossAxisSpacing: 11,),
            delegate: SliverChildBuilderDelegate((BuildContext context,int index) {
                return ProductCard(imagePath: imagePlaceHolder[index],);
              }, childCount: imagePlaceHolder.length
            )),
          ),
        ],
      ),
    );
  }
}

