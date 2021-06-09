import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_blue/landing_page/providers/content_pager.dart';
import 'package:one_blue/landing_page/providers/details_pager.dart';
import 'package:one_blue/landing_page/providers/page_view_pager.dart';
import 'package:one_blue/landing_page/widgets/content_pages/landing_page.dart';
import 'package:one_blue/landing_page/widgets/content_pages/market_wiz.dart';
import 'package:one_blue/landing_page/widgets/content_pages/mesiji.dart';
import 'package:one_blue/landing_page/widgets/content_pages/renew_page.dart';
import 'package:one_blue/landing_page/widgets/content_pages/takvim_page.dart';

class PageViewContent extends StatefulWidget {
  const PageViewContent({Key key, Size size})
      : _size = size,
        super(key: key);

  final Size _size;

  @override
  _PageViewContentState createState() => _PageViewContentState();
}

class _PageViewContentState extends State<PageViewContent> {
  PageController _pageController;
  double currentPageValue;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    currentPageValue = 0;

    context.read(pageViewController.notifier).state = _pageController;

    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
        context.read(currentPage.notifier).update(_pageController.page);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return Transform(
          transform: Matrix4.identity()
            ..translate(0, widget._size.height * .05),
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (page) {
              if (page == 0) {
                context.read(showDetailsButton.notifier).update(false);
              } else {
                context
                    .read(detailsPagerProvider.notifier)
                    .updateContentId(page);
                context.read(showDetailsButton.notifier).update(true);
              }
            },
            children: [
              LandingPage(
                size: widget._size,
                position: 0,
                currentPosition: currentPageValue,
              ),
              RenewPage(
                size: widget._size,
                position: 1,
                currentPosition: currentPageValue,
              ),
              TakvimPage(
                size: widget._size,
                position: 2,
                currentPosition: currentPageValue,
              ),
              MesijiPage(
                size: widget._size,
                position: 3,
                currentPosition: currentPageValue,
              ),
              MarketWizPage(
                size: widget._size,
                position: 4,
                currentPosition: currentPageValue,
              ),
            ],
          ),
        );
      },
    );
  }
}
