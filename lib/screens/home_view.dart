import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_test/animations/route_animation.dart';
import 'package:ui_test/utils/bills_tile.dart';
import 'package:ui_test/utils/cards_tile.dart';
import 'package:ui_test/utils/features_tile.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(RouteAnimation().createDrawerRoute());
            },
            icon: const Icon(
              Icons.drag_handle,
            )),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'branchX',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Banking for Bharat',
              style: TextStyle(
                fontSize: 8,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.circle_notifications_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.power_settings_new_outlined),
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
              child: PageView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                onPageChanged: (value) {
                  setState(() {
                    slideIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return const CardsTile();
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: 130,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
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
                itemCount: gridItems.length - 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return FeaturesTile(
                    icon: gridItems[index].icon,
                    text: gridItems[index].text,
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
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 18,),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: gridItems.length - 5,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, mainAxisSpacing: 15),
                      itemBuilder: (context, index) {
                        return BillsTile(
                          icon: gridItems[index].icon,
                          text: gridItems[index].text,
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
          FloatingActionButton(
            onPressed: () {
              // Add your action for the floating action button here
            },
            shape: const CircleBorder(),
            backgroundColor: Colors.pinkAccent,
            child: const FaIcon(FontAwesomeIcons.android),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
              icon: const Icon(Icons.credit_card_sharp),
              title: Text(
                'My Cards'.toUpperCase(),
                style: const TextStyle(fontSize: 10),
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.person),
              title: Text(
                'My Profile'.toUpperCase(),
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
