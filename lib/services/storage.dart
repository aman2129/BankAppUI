import 'package:flutter/material.dart';

import '../models/grid_model.dart';

final List<Map<String, dynamic>> storyData = [
  {
    'imageUrl':
        'https://thumbs.dreamstime.com/b/swilcan-bridge-swilken-famous-small-stone-spanning-burn-st-andrews-links-golf-course-scotland-united-kingdom-216727869.jpg?w=768',
    'label': '#story1',
  },
  {
    'imageUrl':
        'https://thumbs.dreamstime.com/b/golf-club-ashore-lake-riga-22563310.jpg?w=768',
    'label': '#story2',
  },
  {
    'imageUrl':
        'https://thumbs.dreamstime.com/b/empty-black-swings-vertical-20385023.jpg?w=768',
    'label': '#story3',
  },
  {
    'imageUrl':
        'https://thumbs.dreamstime.com/b/golf-balls-bucket-green-8798126.jpg?w=768',
    'label': '#story4',
  },
  {
    'imageUrl': 'https://thumbs.dreamstime.com/b/sand-green-1142257.jpg?w=768',
    'label': '#story5',
  },
  {
    'imageUrl':
        'https://thumbs.dreamstime.com/b/amid-tulip-trail-11198847.jpg?w=768',
    'label': '#story6',
  },
];


final List<GridItem> gridItems = [
  GridItem(icon: Icons.home, text: 'Home'),
  GridItem(icon: Icons.person, text: 'Profile'),
  GridItem(icon: Icons.settings, text: 'Settings'),
  GridItem(icon: Icons.camera, text: 'Camera'),
  GridItem(icon: Icons.mail, text: 'Mail'),
  GridItem(icon: Icons.music_note, text: 'Music'),
  GridItem(icon: Icons.shopping_cart, text: 'Cart'),
  GridItem(icon: Icons.star, text: 'Favorites'),
  GridItem(icon: Icons.movie, text: 'Movies'),
  GridItem(icon: Icons.restaurant, text: 'Restaurant'),
  GridItem(icon: Icons.map, text: 'Map'),
  GridItem(icon: Icons.phone, text: 'Phone'),
  GridItem(icon: Icons.watch, text: 'Watch'),
  // Add more items to the list as needed
];
