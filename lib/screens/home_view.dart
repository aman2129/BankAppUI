import 'package:flutter/material.dart';
import 'package:ui_test/animations/route_animation.dart';
import 'package:ui_test/utils/bills_tile.dart';
import 'package:ui_test/utils/cards_tile.dart';
import 'package:ui_test/utils/features_tile.dart';
import 'package:ui_test/utils/gold_card_tile.dart';
import 'package:ui_test/utils/offer_cards.dart';
import 'package:ui_test/utils/story_circle.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import '../services/storage.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int slideIndex = 0;
  int offerSlideIndex = 0;
  int _currentIndex = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(RouteAnimation().createDrawerRoute());
              },
              child: Image.asset(
                  'assets/images/home/ion_notifications-circle-outline.png'),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/drawer/branchX.png',
                  height: 30,
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                    'assets/images/home/ion_notifications-circle-outline (1).png'),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/images/home/Power button.png'),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                Container(
                  height: 100,
                  margin: const EdgeInsets.only(left: 10, top: 12),
                  child: ListView.builder(
                      itemCount: storyData.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      itemBuilder: (context, index) {
                        final data = storyData[index];
                        return StoryCircle(
                          imageUrl: data['imageUrl'],
                          label: data['label'],
                        );
                      }),
                ),
                Container(
                  height: 270,
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    onPageChanged: (value) {
                      setState(() {
                        slideIndex = value;
                      });
                    },
                    children: const [
                      BlueCardTile(),
                      GoldCardTile(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 80,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == slideIndex
                                  ? Colors.pinkAccent
                                  : Colors.white,
                              border: Border.all(color: Colors.pinkAccent)),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 400,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: gridHomeItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return FeaturesTile(
                        icon: gridHomeItems[index].icon,
                        text: gridHomeItems[index].text,
                      );
                    },
                  ),
                ),
                Container(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: PageView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    onPageChanged: (value) {
                      setState(() {
                        offerSlideIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return const OfferCards();
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == offerSlideIndex
                                  ? Colors.pinkAccent
                                  : Colors.white,
                              border: Border.all(color: Colors.pinkAccent)),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pay Your Bills',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        height: 250,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: gridBillsItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, mainAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            return BillsTile(
                              icon: gridBillsItems[index].icon,
                              text: gridBillsItems[index].text,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/images/home/Lamp.png'),
              ),
              const SizedBox(height: 8),
              Text(
                'Xenie'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: SizedBox(
            height: 70,
            child: CustomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(
                    Icons.credit_card_sharp,
                    color: Colors.pinkAccent,
                    size: 25,
                  ),
                  title: Text(
                    'My Cards'.toUpperCase(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.pinkAccent,
                    size: 25,
                  ),
                  title: Text(
                    'My Profile'.toUpperCase(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          right: 20,
          child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/home/call.png',
              )),
        )
      ],
    );
  }
}
