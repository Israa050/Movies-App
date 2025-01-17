import 'package:flutter/material.dart';

class TitleOverviewSection extends StatefulWidget {
  final String title;
  final String overview;
  const TitleOverviewSection(
      {super.key, required this.title, required this.overview});

  @override
  State<TitleOverviewSection> createState() => _TitleOverviewSectionState();
}

class _TitleOverviewSectionState extends State<TitleOverviewSection> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          AnimatedCrossFade(
            firstChild: Wrap(
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  widget.overview,
                  // 'To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  maxLines: 3,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: const Text(
                    'See more',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            secondChild: Wrap(children: [
              Text(
                overflow: TextOverflow.ellipsis,
                widget.overview,
                //   'To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine.To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine.To save Paris from a bloodbath, a grieving scientist is forced to face her tragic past when a giant shark appears in the Seine',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 10,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    flag = !flag;
                  });
                },
                child: const Text(
                  'Show less',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 18,
                  ),
                ),
              ),
            ]),
            crossFadeState:
                flag ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 600),
          ),
        ],
      ),
    );
  }
}
