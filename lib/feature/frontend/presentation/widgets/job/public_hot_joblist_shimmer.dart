import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/util/dimensions.dart';

class PublicJobListingShimmer extends StatelessWidget {
  final bool fromFilter;

  const PublicJobListingShimmer({
    super.key,
    this.fromFilter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if (!fromFilter) ...[
          Container(
            width: 140,
            height: 24,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),

          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
        ],

        Shimmer.fromColors(
          baseColor: Theme.of(context).cardColor,
          highlightColor:
          Theme.of(context).shadowColor.withValues(alpha: .08),

          child: MasonryGridView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            mainAxisSpacing: Dimensions.paddingSizeDefault,
            crossAxisSpacing: Dimensions.paddingSizeDefault,

            gridDelegate:
            SliverSimpleGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: fromFilter ? 500 : 300,
            ),

            itemBuilder: (_, index) {
              return CustomContainer(
                borderRadius: 5,
                color: Theme.of(context).cardColor,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if (!fromFilter) ...[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(123),
                        ),
                      ),

                      const SizedBox(
                        width:
                        Dimensions.paddingSizeExtraSmall,
                      ),
                    ],

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [

                          /// category
                          Container(
                            height: 14,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(4),
                            ),
                          ),

                          const SizedBox(height: 8),

                          /// company name
                          Container(
                            height: 16,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(4),
                            ),
                          ),

                          const SizedBox(height: 8),

                          /// job title
                          Container(
                            height: 14,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}