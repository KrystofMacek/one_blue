import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsContents extends StatefulWidget {
  const DetailsContents({Key key, @required int contentId})
      : _contentId = contentId,
        super(key: key);

  final int _contentId;

  @override
  _DetailsContentsState createState() => _DetailsContentsState();
}

class _DetailsContentsState extends State<DetailsContents> {
  PageController _pageController;
  int _contentId;
  double _currentPage;
  @override
  void initState() {
    super.initState();
    _contentId = widget._contentId - 1;
    _currentPage = 0;

    _pageController = PageController();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                PROJECTS[_contentId],
                style: TextStyle(
                  fontFamily: 'Neuropol',
                  fontSize: 40,
                  color: Colors.white60,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 2,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: AutoSizeText(
                  'Stockmarket trading simulator with real world data',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  maxFontSize: 25,
                  minFontSize: 18,
                  style: TextStyle(
                    fontFamily: 'Neuropol',
                    fontSize: 25,
                    color: Colors.white60,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 2,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            PROJECT_INFOS[_contentId],
            style: TextStyle(
              height: 1.6,
              fontFamily: 'Orbitron',
              fontSize: 24,
              color: Colors.white60,
              letterSpacing: 2.5,
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 400),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: PROJECT_DETAILS[_contentId][0].length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(PROJECT_DETAILS[_contentId][0][index]),
                        SizedBox(
                          width: 20,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * .2),
                          child: Text(
                            PROJECT_DETAILS[_contentId][1][index],
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.6,
                              fontFamily: 'Orbitron',
                              fontSize: 18,
                              color: Colors.white60,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(
                                  color: Colors.white,
                                  blurRadius: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                (_currentPage == 0)
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _pageController.previousPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOut);
                            }),
                      ),
                (_currentPage == PROJECT_DETAILS[_contentId][0].length - 1)
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOut);
                            }),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const PROJECTS = [
  'MarketWiz',
  'Mesiji',
];
const PROJECT_SUBTITLE = [
  'Stockmarket trading simulator with real world data.',
  'Social Network, with location sharing.',
];
const PROJECT_INFOS = [
  'Application was developed using reactive architecture to provide real time data updates from markets. Using the data from API\'s: Barchart.com, finnhub.io.\n\nFor communication with API\'s was used HTTP package Chopper. Data are then stored locally using SQLite package MoorDatabase.',
  'Application was built using Flutter & Firebase stack, witch is in my opinion currently one of the best solutions to cross-platform development. Using services as Firestore for realtime data synchronizaiton and User authentication system, Firebase also allows seamless integraion of services like Push Notifications, Google Analytics, AdMob and more.',
];

const PROJECT_DETAILS = [
  // Project 0 MARKETWIZ
  [
    // Images PROJECT_DETAILS[0][0][0...]
    [
      'assets/images/market_wiz_preview.png',
      'assets/images/market_wiz_detail.png',
      'assets/images/market_wiz_tradedialog.png',
      'assets/images/market_wiz_portfolio.png',
      'assets/images/market_wiz_watchlist.png',
    ],
    // Descriptions PROJECT_DETAILS[0][1][0...]
    [
      'Market Overview\n\nDisplaying list of major Markets and their current price change. Selecting index provides more details with chart below.',
      'Stock Details\n\nProviding user with overview of selected stock, as well as the price chart.',
      'Trade dialog\n\nUpon selecting to trade a certain stock, user is met with dialog allowing them to create new long or short position.',
      'Portfolio\n\nOverview of all users current positions displaying todays change and price as well as the current PnL and total PnL.',
      'Watchlist\n\nList of stocks the user selected to keep in their watchlist displaying todays change and price.',
    ],
  ],
  // Project 1 MESIJI
  [
    // Images PROJECT_DETAILS[1][0][0...]
    [
      'assets/images/mesiji_auth.png',
      'assets/images/mesiji_profile.png',
      'assets/images/mesiji_chat.png',
      'assets/images/mesiji_map.png',
    ],
    // Descriptions PROJECT_DETAILS[1][1][0...]
    [
      'Authentication and Registration\n\nUser Managment is fundemantal feature of most of modern apps. Firebase Authentication provides complete solution for this problem, with features like: Form Validation, Email Confirmation, Security rules and more.',
      'User Profile\n\nUser is prompted with simple name configuration and then redirected to homepage where he can see past interaction with his friends.',
      'Search & Chat\n\nSearch screen allows for searching of an particular user by their username. And initiating chat, witch is developed using Firestore for real time sync of messages. On top of the chat screen there is an name of the user and buttons to add as friend and share your location. Sharing location first opens the map ->',
      'Location & Navigation\n\nNavigating from chat screen opens the map, where you can find your current location and then share in chat. If your firend clicks on the link then map with directions to your location is displayed.',
    ],
  ],
];
