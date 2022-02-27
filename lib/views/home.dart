import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe.api.dart';
import 'package:recipeapp/views/widgets/recipe_card.dart';
import 'package:recipeapp/models/recipe.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Recipe> _recipes;
  bool _isloading = true;
  @override

  void initState(){
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async{
    _recipes= await RecipeApi.getRecipe();
    setState(() {
      _isloading=false;
    });
    //print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('food recipe')
          ],
        ),
      ),

      //body:// RecipeCard(title:"My recipe",cookTime: '30 min',rating:'4.3',thumbnailUrl:'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',)
      body: _isloading
    ? Center(child: CircularProgressIndicator())
        : ListView.builder(
    itemCount: _recipes.length,
    itemBuilder: (context, index) {
    return RecipeCard(
    title: _recipes[index].name,
    cookTime: _recipes[index].totalTime,
    rating: _recipes[index].rating.toString(),
    thumbnailUrl: _recipes[index].images);
    },
      )
    );
  }

  }

