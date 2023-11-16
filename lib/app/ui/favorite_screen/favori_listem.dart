import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/model/restaurant_model.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/them/responsive.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'dart:io';

import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/network_image_widget.dart';

class FavoriForm extends StatefulWidget {
  @override
  Favorilistem createState() => Favorilistem();
}

class Favorilistem extends State<FavoriForm> {
  List<FavoriteItem> favoriteList = [];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Favori Servislerim'.tr,
            style: TextStyle(
                color: Colors.white,
                fontFamily: AppThemData.semiBold,
                fontSize: 16),
          ),
        ),
        backgroundColor: themeChange.getThem()
            ? AppThemData.assetColorGrey100
            : AppThemData.assetColorGrey600,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Geri ok ikonu
          onPressed: () {
            // Geri gitme işlemi
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteList[index].name),
            subtitle:
                Text('Puan: ${favoriteList[index].rating.toStringAsFixed(1)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  favoriteList.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFavoriteScreen()),
          );
          if (result != null) {
            setState(() {
              favoriteList.add(result);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: AppThemData.assetColorGrey600,
      ),
    );
  }
}

class FavoriteItem {
  final String name;
  final double rating;

  FavoriteItem(this.name, this.rating);
}

class AddFavoriteScreen extends StatefulWidget {
  @override
  _AddFavoriteScreenState createState() => _AddFavoriteScreenState();
}

class _AddFavoriteScreenState extends State<AddFavoriteScreen> {
  final TextEditingController nameController = TextEditingController();
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Favori Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Favori Öğe Adı'),
            ),
            Slider(
              value: rating,
              min: 0,
              max: 5,
              divisions: 50,
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
            Text('Puan: ${rating.toStringAsFixed(1)}'),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    FavoriteItem(nameController.text, rating),
                  );
                }
              },
              child: Text('Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
