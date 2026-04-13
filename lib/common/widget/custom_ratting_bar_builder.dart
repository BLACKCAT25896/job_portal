import 'package:flutter/material.dart';

class CustomRatingBar extends StatelessWidget {
  final int rating;
  final int maxRating;
  final double size;
  final Color color;
  final void Function(int) onRatingChanged;

  const CustomRatingBar({
    super.key, required this.rating, required this.onRatingChanged, this.maxRating = 5,
    this.size = 32, this.color = Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        final starIndex = index + 1;
        return IconButton(padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(starIndex <= rating ? Icons.star_rate_rounded : Icons.star_border_rounded,
            color: color, size: size,),
          onPressed: () {
            onRatingChanged(starIndex);
          },
        );
      }),
    );
  }
}
