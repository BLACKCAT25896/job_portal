import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/dimensions.dart';

class PublicCompanyListShimmer extends StatelessWidget {
  const PublicCompanyListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// title shimmer
        Container(
          width: 180,
          height: 24,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),

        const SizedBox(height: Dimensions.paddingSizeDefault),

        Shimmer.fromColors(
          baseColor: Theme.of(context).cardColor,
          highlightColor:
          Theme.of(context).shadowColor.withValues(alpha: .08),

          child: MasonryGridView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            mainAxisSpacing: Dimensions.paddingSizeSmall,
            crossAxisSpacing: Dimensions.paddingSizeSmall,
            gridDelegate:
            const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
            ),

            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: CustomContainer(
                  borderRadius: 14,

                  child: Padding(
                    padding: const EdgeInsets.all(
                      Dimensions.paddingSizeDefault,
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        /// logo
                        Container(
                          height: 84,
                          width: 84,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// company name
                        Container(
                          height: 16,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// location
                        Container(
                          height: 12,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// badge
                        Container(
                          height: 32,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}