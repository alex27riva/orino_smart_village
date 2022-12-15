/*
 * church.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

import 'package:flutter/material.dart';
import 'package:orino_smart_village/widgets/360_button.dart';

class ChurchPage extends StatelessWidget {
  const ChurchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chiesa"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text("Descrizione elemento"),
              trailing:
                  PanoramicButton(panoramicImageName: '', buttonSize: 80.0),
            );
          },
        ),
      ),
    );
  }
}
