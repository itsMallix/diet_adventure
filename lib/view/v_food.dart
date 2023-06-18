import 'package:flutter/material.dart';
import 'package:diet_app/theme/t_theme.dart';
import 'package:diet_app/view/v_food_card.dart';
import 'package:diet_app/model/m_food.dart';
import 'package:diet_app/model/m_api_food.dart';
import 'package:diet_app/main.dart';
import 'package:diet_app/view/v_food_detail.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context); // Menggunakan Navigator.pop untuk kembali ke halaman sebelumnya
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: DietApp.nearlyBlack,
          ),
        ),
        title: Text(
          "Food Recipe",
          style: DietApp.headline,
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: _recipes.length +
                  1, // Jumlah item + 1 untuk item khusus "My Recipe"
              separatorBuilder: (context, index) =>
                  Divider(), // Pembatas antar item
              itemBuilder: (context, index) {
                if (index == 0) {
                  Recipe recipe = Recipe(
                    name: "My Recipe",
                    images:
                        "https://images.everydayhealth.com/images/keto-diet-list-of-what-to-eat-and-7-day-sample-menu-alt-1440x810.jpg?sfvrsn=7a9869d4_4",
                    rating: 4.5,
                    totalTime: "10 min",
                  );
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage(recipe: recipe),
                        ),
                      );
                    },
                    child: RecipeCard(
                      title: recipe.name,
                      cookTime: recipe.totalTime,
                      rating: recipe.rating.toString(),
                      thumbnailUrl: recipe.images,
                    ),
                  );
                } else {
                  // Kurangi 1 dari indeks untuk mengakses data di dalam _recipes
                  Recipe recipe = _recipes[index - 1];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage(recipe: recipe),
                        ),
                      );
                    },
                    child: RecipeCard(
                      title: recipe.name,
                      cookTime: recipe.totalTime,
                      rating: recipe.rating.toString(),
                      thumbnailUrl: recipe.images,
                    ),
                  );
                }
              },
            ),
    );
  }
}
