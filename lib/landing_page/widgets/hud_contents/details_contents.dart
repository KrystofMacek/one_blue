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
                  PROJECT_SUBTITLE[_contentId],
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
  'Renew',
  'Takvim',
  'Mesiji',
  'MarketWiz',
];
const PROJECT_SUBTITLE = [
  'Personal time management tool',
  'App for following Swiss Mosques.',
  'Social Network, with location sharing.',
  'Stockmarket trading simulator with real world data.',
];
const PROJECT_INFOS = [
  'Developed as personal project, using flutter front end, with Rive Animations. Goal was to create personal management tool allowing user to schedule breaks during his work with tasks for his break time.',
  'Developed for client from Switzerland. Both mobile app ios & android and Web app were created (Simplified version for web integrations takvim.ch). Built using Flutter & Firebase stack, leveraging both Real-Time Database and Firestore and features like Push Notifications or Crashlytics.',
  'Developed using Flutter & Firebase stack, witch is in my opinion currently one of the best solutions to cross-platform development. Using services as Firestore for realtime data synchronizaiton and User authentication system, Firebase also allows seamless integraion of services like Push Notifications, Google Analytics, AdMob and more.',
  'Developed using reactive architecture to provide real time data updates from markets. Using the data from API\'s: Barchart.com, finnhub.io.\n\nFor communication with API\'s was used HTTP package Chopper. Data are then stored locally using SQLite package MoorDatabase.',
];

const PROJECT_DETAILS = [
  // RENEW
  [
    [
      'assets/images/renew_home.png',
      'assets/images/renew_time.png',
      'assets/images/renew_tasks.png',
      'assets/images/renew_focus.png',
      'assets/images/renew_workout_time.png',
      'assets/images/renew_workout.png',
    ],
    [
      'Home Page\n\nApp includes two modes, focus | renew to schedule breaks during worktime. And Workout to help user keep track of time during exercise.',
      'Focus | Renew\n\nAfter selecting focus / renew user is met with configuration page where he selects the time durations of his work and break.',
      'Task planning\n\nThis page allows user to create list of tasks he wants to perform during break time.',
      'Timer\n\nTimer page displays the duration of current timer - and allows user to start, pause, edit the time. Notification is sent when either break time or focus time is over.',
      'Workout\n\nSelecting workout in main menu leads to different timer configuration selecting time for workout, break as well as the number of sets.',
      'Workout Timer\n\nTimer displays remaining time during workout with sound effects to notify about ending of each round.',
    ],
  ],
  // TAKVIM
  [
    [
      'assets/images/takvim_home.png',
      'assets/images/takvim_lang.png',
      'assets/images/takvim_mosques.png',
      'assets/images/takvim_subs.png',
    ],
    [
      'Home Page\n\nProvides user with prayer times of his selected mosque, indication of times that he selected for reminder using local notifications and daily notes that are provided by the mosque.',
      'Language Selection\n\nApp has multiple translations stored in Firbase realtime database, that can user choose from, those are maintained by owner of app.',
      'Mosques Selection\n\nProvides list of all mosques in Switzerland, that provided their information to the app owner (currently about 100), that can user chose from to follow.',
      'News Subscriptions\n\nApp allows user to subscribe to newsfeed of different mosques, user then recieves push notifications whenever one of the topics and mosques he is following publishes new article.',
    ],
  ],
  // MESIJI
  [
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
  // MARKETWIZ
  [
    [
      'assets/images/market_wiz_preview.png',
      'assets/images/market_wiz_detail.png',
      'assets/images/market_wiz_tradedialog.png',
      'assets/images/market_wiz_portfolio.png',
      'assets/images/market_wiz_watchlist.png',
    ],
    [
      'Market Overview\n\nDisplaying list of major Markets and their current price change. Selecting index provides more details with chart below.',
      'Stock Details\n\nProviding user with overview of selected stock, as well as the price chart.',
      'Trade dialog\n\nUpon selecting to trade a certain stock, user is met with dialog allowing them to create new long or short position.',
      'Portfolio\n\nOverview of all users current positions displaying todays change and price as well as the current PnL and total PnL.',
      'Watchlist\n\nList of stocks the user selected to keep in their watchlist displaying todays change and price.',
    ],
  ],
];
