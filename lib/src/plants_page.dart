import 'package:flutter/material.dart';

import 'constants.dart';
import 'plant_tile.dart';
import 'plants.dart';

class PlantsPage extends StatefulWidget {
  const PlantsPage({super.key});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: commonPaddingHV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plants For Room',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 28.0),
            Expanded(
              child: ListView.builder(
                itemCount: Plants.data.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    PlantTileHome(plant: Plants.data[i]),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
