import 'package:flutter/material.dart';
import 'package:diet_app/theme/t_theme.dart';
import 'package:diet_app/view/v_food_card.dart';
import 'package:diet_app/model/m_food.dart';
import 'package:diet_app/model/m_api_food.dart  ';
import 'package:diet_app/main.dart';

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

  Future<List<Recipe>> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
    return _recipes;
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
            Navigator.pushNamed(context, "/==>home");
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
          : ListView.builder(
              itemCount: _recipes.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return RecipeCard(
                    title: "My Recipe",
                    cookTime: "10 min",
                    rating: "4.5",
                    thumbnailUrl:
                        "https://images.everydayhealth.com/images/keto-diet-list-of-what-to-eat-and-7-day-sample-menu-alt-1440x810.jpg?sfvrsn=7a9869d4_4",
                  );
                } else {
                  return RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].images,
                  );
                }
              },
            ),
    );
  }
}
