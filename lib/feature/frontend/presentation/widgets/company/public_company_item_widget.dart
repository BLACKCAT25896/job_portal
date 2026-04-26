import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/widget/custom_contaner.dart';
import 'package:mighty_job/common/widget/custom_image.dart';
import 'package:mighty_job/feature/company/domain/models/company_model.dart';
import 'package:mighty_job/helper/route_helper.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';

class PublicCompanyItemWidget extends StatefulWidget {
  final CompanyItem? item;
  final int index;

  const PublicCompanyItemWidget({super.key, required this.index, this.item});

  @override
  State<PublicCompanyItemWidget> createState() => _PublicCompanyItemWidgetState();
}

class _PublicCompanyItemWidgetState extends State<PublicCompanyItemWidget> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),

      child: AnimatedSlide(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        offset: _isHover ? const Offset(0, -0.03) : Offset.zero,

        child: AnimatedScale(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          scale: _isHover ? 1.03 : 1.0,

          child: AnimatedContainer(duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: _isHover ? 0.16 : 0.08),
                  blurRadius: _isHover ? 22 : 12,
                  offset: const Offset(0, 6)),
              ],
            ),

            child: CustomContainer(onTap: () {
                Get.toNamed(RouteHelper.getCategoryWiseJobRoute(slug: '', type: 'company'));
              },
              borderRadius: 14,

              child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),

                child: Column(mainAxisSize: MainAxisSize.min, children: [
                    AnimatedContainer(duration: const Duration(milliseconds: 220), height: 84, width: 84,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: _isHover
                            ? primary.withValues(alpha: 0.5)
                            : Colors.grey.withValues(alpha: 0.2))),
                        child: CustomImage(radius: 14, width: 84, height: 84)),

                    const SizedBox(height: 12),

                    Text(widget.item?.name ?? 'Unknown Company',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textBold.copyWith(
                        fontSize: Dimensions.fontSizeLarge)),

                    const SizedBox(height: 4),


                    Text(widget.item?.location ?? 'Location not set', maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textRegular.copyWith(color: Colors.grey)),

                    const SizedBox(height: 10),

                    AnimatedContainer(duration: const Duration(milliseconds: 220),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: _isHover ? Colors.green.withValues(alpha: 0.15)
                            : Colors.green.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green.withValues(alpha: 0.2))),
                      child:  Text('2 open jobs',
                        style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                          color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}