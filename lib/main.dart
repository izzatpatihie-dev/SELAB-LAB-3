import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Data model for one food item
class FoodItem {
  final String name;
  final String image;
  final String description;
  final String price;

  const FoodItem({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

// The 3 foods on the menu
const List<FoodItem> foods = [
  FoodItem(
    name: 'Burger',
    image: 'assets/Burger.png',
    description: 'Juicy grilled beef patty with fresh lettuce, tomato and cheese.',
    price: 'RM 12.90',
  ),
  FoodItem(
    name: 'Happy Meal',
    image: 'assets/HappyMeals.png',
    description: 'A fun kids meal with a small burger, fries and a drink.',
    price: 'RM 15.50',
  ),
  FoodItem(
    name: 'Muffin',
    image: 'assets/Muffin.png',
    description: 'Soft and fluffy chocolate chip muffin, freshly baked.',
    price: 'RM 6.90',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 28.0,
            fontFamily: 'FrederickatheGreat',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.teal.shade50,
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(food: food),
                ),
              );
            },
            child: Card(
              elevation: 6,
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Hero(
                      tag: food.name,
                      child: Image.asset(food.image, width: 100, height: 100),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            style: const TextStyle(
                              fontSize: 26.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'FrederickatheGreat',
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            food.price,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Extra task: detail screen shown when a card is tapped
class DetailPage extends StatelessWidget {
  final FoodItem food;

  const DetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          food.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontFamily: 'FrederickatheGreat',
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: food.name,
                child: Image.asset(food.image, width: 220, height: 220),
              ),
              const SizedBox(height: 24),
              Text(
                food.name,
                style: const TextStyle(
                  fontSize: 36.0,
                  color: Colors.brown,
                  fontFamily: 'FrederickatheGreat',
                ),
              ),
              const SizedBox(height: 12),
              Text(
                food.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16),
              Text(
                food.price,
                style: const TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}