

// import 'package:flutter/material.dart';
// import 'package:movies_neon_design/core/model/cast.dart';
// import 'package:movies_neon_design/core/model/media.dart';
// import 'package:movies_neon_design/features/home/presentation/widgets/cast_list.dart';
// import 'package:movies_neon_design/features/home/presentation/widgets/hero_image.dart';

// class DetailsScreenBody extends StatefulWidget {
//     final Media movie;

//   const DetailsScreenBody({super.key,required this.movie});

//   @override
//   State<DetailsScreenBody> createState() => _DetailsScreenBodyState();
// }

// class _DetailsScreenBodyState extends State<DetailsScreenBody> {

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return SafeArea(
//         child: SizedBox(
//           // height: screenHeight,
//           width: screenWidth,
//           child: ListView(
//             children: [
//              HeroImage(movie: widget.movie),
//              // DescriptionSection(movie: widget.movie),
//               //Title setion
//              // TitleOverviewSection(movie: widget.movie),

//               //cast section
//               const Padding(
//                 padding: EdgeInsets.only(left: 15, right: 15),
//                 child: Text(
//                   'Casts',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ),

//                CastList(cast: widget,)),
//             ],
//           ),
//         ),
//       );
//   }
// }