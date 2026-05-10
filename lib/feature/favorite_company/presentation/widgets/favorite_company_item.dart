import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_text_item_widget.dart';
import 'package:job/common/widget/numbering_widget.dart';
import 'package:job/feature/favorite_company/domain/models/favorite_company_model.dart';
import 'package:job/helper/responsive_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';
import 'package:flutter/material.dart';

class FavoriteCompanyItemWidget extends StatelessWidget {
  final FavoriteCompanyItem? favoriteCompanyItem;
  final int index;
  const FavoriteCompanyItemWidget({super.key,  required this.index, this.favoriteCompanyItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)?
    Row(spacing: Dimensions.paddingSizeDefault, children: [
      NumberingWidget(index: index),

      Expanded(child: CustomTextItemWidget(text: favoriteCompanyItem?.companyName??'')),


    ]):

    Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: CustomContainer(borderRadius: 5, showShadow: false,
          child: Row(children: [


            SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Text("${favoriteCompanyItem?.companyName}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),)),

            ],
          )),
    );
    }
  }