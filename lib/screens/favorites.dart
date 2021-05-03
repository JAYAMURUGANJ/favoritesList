import 'package:flutter/material.dart';
import 'package:helloworld/models/favorites.dart';
import 'package:helloworld/models/food.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<Favorites>(builder: (context, food, child) {
        return ListView.builder(
          itemCount: food.items.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => FavoriteItemTile(Food(
              category: food.items[index].category,
              cid: food.items[index].cid)),
        );
      }),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final Food food;

  const FavoriteItemTile(this.food);

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          // backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
          backgroundColor: Colors.blue,
          // child: Text(
          //   itemName,
          //   key: Key('favorites_text_$itemName'),
          // ),
        ),
        title: Text(
          food.category,
          key: Key('favorites_text_$food.cid'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$food.cid'),
          icon: Icon(Icons.close),
          onPressed: () {
            favoritesList.remove(food);
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('Removed from favorites.'),
            //     duration: Duration(seconds: 1),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
