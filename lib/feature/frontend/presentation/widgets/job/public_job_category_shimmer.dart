import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/util/dimensions.dart';

class PublicJobCategoryShimmer extends StatelessWidget {
  const PublicJobCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: Theme.of(context).shadowColor.withValues(alpha: .1),
      child: MasonryGridView.builder(
        itemCount: 12,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        mainAxisSpacing: Dimensions.paddingSizeSmall,
        crossAxisSpacing: Dimensions.paddingSizeSmall,
        gridDelegate:
        const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          return CustomContainer(
            borderRadius: 5,
            showShadow: false,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}