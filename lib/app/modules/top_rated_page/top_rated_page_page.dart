import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yshare/app/app_controller.dart';
import 'package:yshare/components/compact_card_film.dart';
import 'top_rated_page_controller.dart';

class TopRatedPagePage extends StatefulWidget {
  final AppController controller;
  final String title;
  const TopRatedPagePage(
      {Key key, this.title = 'TopRatedPage', this.controller})
      : super(key: key);

  @override
  _TopRatedPagePageState createState() => _TopRatedPagePageState();
}

class _TopRatedPagePageState
    extends ModularState<TopRatedPagePage, TopRatedPageController> {
  //use 'controller' variable to access controller

  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      controller.setActualPage(controller.actualPage + 1);
      controller.fetchTopRated();
    }
  }

  @override
  void initState() {
    controller.fetchTopRated();
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
                title: Text('Top Rated',
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
