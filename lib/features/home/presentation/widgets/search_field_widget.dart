import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_neon_design/core/utils/app_colors.dart';
import 'package:movies_neon_design/features/home/logic/cubit/movies_cubit.dart';

class SearchFieldWidget extends StatefulWidget {

  SearchFieldWidget({super.key, required this.padding});

  final EdgeInsetsGeometry padding;

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
         height: 36,
        decoration: BoxDecoration(
          color: AppColors.myGrey.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.6),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if(value.isNotEmpty){
                    print('Text is added $value');
                    BlocProvider.of<MoviesCubit>(context).findMediaByKeyword(value);
                  }
                },
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 17,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              Icons.mic,
              color: Colors.white.withOpacity(
                0.6,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
