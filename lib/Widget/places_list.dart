import 'package:favourite_places_app/Screens/place_detail.dart';
import 'package:favourite_places_app/model/placelist.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places; 
  
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
      child: Text(
        "No Places Added Yet",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary
            ),
      ),
    );
    }

    return ListView.builder(
          itemCount: places.length,
          itemBuilder: (ctx, index) => ListTile(
                title: Text(
                  places[index].name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => PlaceDetails(place: places[index])));
                },
              )
            );
  }
}