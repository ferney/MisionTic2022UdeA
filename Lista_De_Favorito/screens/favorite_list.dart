import 'package:favo_list_and_page/models/favorite_list_models.dart';
import 'package:favo_list_and_page/models/favorite_page_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title:
                Text('Favorite', style: Theme.of(context).textTheme.headline1),
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
               
                onPressed: () => Navigator.pushNamed(context, '/favoritepage'),
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
             
              return _MyListItem(index);
            },
                   
    childCount: 15),
          ),
        ],
      ),
    );
  }
}


class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<FavoriteListModel, Item>(
      
      (favoritelist) => favoritelist.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 60,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(item.image),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: textTheme),
                  Text(item.subtitle,
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(width: 24),
            // to call AddButton widget //
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}


class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    var isInFavoritePage = context.select<FavoritePageModel, bool>(
      
      (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      icon: isInFavoritePage
          ? Icon(Icons.favorite, color: Colors.red)
          : Icon(Icons.favorite_border),
      onPressed: isInFavoritePage
          ? () {
              
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.remove(item);
            }
          : () {
              
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.add(item);
            },
    );
  }
}
