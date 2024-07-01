import 'package:flutter/material.dart';

import 'cart_controller.dart';
import 'colors.dart';
import 'plant.dart';

class PlantTileHome extends StatelessWidget {
  const PlantTileHome({super.key, required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return _PlantTile(
      plant: plant,
      trailing: ListenableBuilder(
        listenable: provider!.controller,
        builder: (_, asf) {
          final inCart = provider.controller.inCart(plant);
          return IconButton(
            icon: Icon(
              inCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
              color: kPrimaryColor2,
              size: 30,
            ),
            onPressed: () {
              provider.controller.add(plant);
            },
          );
        },
      ),
    );
  }
}

class PlantTileCart extends StatelessWidget {
  const PlantTileCart({super.key, required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return _PlantTile(
      plant: plant,
      trailing: ListenableBuilder(
        listenable: provider!.controller,
        builder: (_, asf) {
          return IconButton(
            icon: const Icon( Icons.delete, color:kPrimaryColor, size: 30),
            onPressed: () {
              provider.controller.remove(plant.id);
            },
          );
        },
      ),
    );
  }
}

class _PlantTile extends StatelessWidget {
  const _PlantTile({required this.plant, this.trailing});
  final Plant plant;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 110.0,
          width: 130.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: AssetImage(plant.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  plant.genus,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 12.0),
                const Icon(Icons.star, size: 15.0, color: kStarColor),
                Text(
                  plant.rating,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Text(
              plant.inch,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 10.0),
            Text(
              '\$${plant.price}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
