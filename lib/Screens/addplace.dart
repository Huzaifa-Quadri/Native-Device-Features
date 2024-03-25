import 'package:favourite_places_app/providers/entered_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();

  void _savePlace(){
    final enteredText = _titleController.text;

    if (enteredText.isEmpty) {
      return ;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredText);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Place"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              maxLength: 50,
              decoration: InputDecoration(
                label: Text("Title", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                hintText: "Agra",
              ),
              controller: _titleController,
              style:TextStyle(color: Theme.of(context).colorScheme.onPrimary) 
            ),
            const SizedBox(height: 15,),
            ElevatedButton.icon(
              onPressed: _savePlace, 
              icon: const Icon(Icons.add), 
              label: const Text("Add Place"), 
            )
          ],
        ),
      ),
    );
  }
}