import 'package:flutter/material.dart';
import 'package:movies_neon_design/core/model/cast.dart';
import 'package:movies_neon_design/features/home/presentation/widgets/cast_item.dart';

class CastList extends StatelessWidget {
  final Cast cast;
  const CastList({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cast.cast!.length,
                itemBuilder: (context, index) {
                  return  MyCast(
                    cast: cast.cast![index],
                  );
                },
              ),
            ),
          );
      }
}
