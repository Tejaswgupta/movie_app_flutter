import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/components/compact_card_film.dart';
import 'trending_page_controller.dart';

class TrendingPagePage extends StatefulWidget {
  final String title;
  const TrendingPagePage({
    Key key,
    this.title = 'TrendingPage',
  }) : super(key: key);

  @override
  _TrendingPagePageState createState() => _TrendingPagePageState();
}

class _TrendingPagePageState
    extends ModularState<TrendingPagePage, TrendingPageController> {
  //use 'controller' variable to access controller

  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      controller.setActualPage(controller.actualPage + 1);
      controller.fetchTredingFilms();
    }
  }

  @override
  void initState() {
    controller.fetchTredingFilms();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black87,
              elevation: 10,
              expandedHeight: 150,
              titleSpacing: 10,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Trending',
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50))),
              actions: [
                Observer(
                  builder: (_) {
                    return IconButton(
                        icon: controller.appController.isDark
                            ? Icon(
                                EvaIcons.sun,
                                color: Colors.white,
                              )
                            : Icon(EvaIcons.moon, color: Colors.white),
                        onPressed: () {
                          controller.appController.changeTheme();
                        });
                  },
                )
              ],
            ),
            SliverToBoxAdapter(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.6,
                ),
                itemCount: controller.films.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    CompactCardFilm(film: controller.films[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}
