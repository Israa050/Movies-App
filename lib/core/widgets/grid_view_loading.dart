import 'package:flutter/widgets.dart';
import 'package:movies_neon_design/core/widgets/shimmer_item.dart';

class GridViewLoading extends StatelessWidget {
  const GridViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
     final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: screenHeight -0.5,
        width: screenWidth,
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return const ShimmerItem();
            }),
      ),
    );
  }
}
