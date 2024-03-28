import 'package:favourite_places_app/Screens/addplace.dart';
import 'package:favourite_places_app/Widget/places_list.dart';
import 'package:favourite_places_app/providers/entered_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Places extends ConsumerWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);  //* Must make changes in Generic type of provider to give an idea to dart of what type of data will be returned

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Places",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const AddPlace()));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(
          places: userPlaces
          ),
      ),
    );
  }
}
