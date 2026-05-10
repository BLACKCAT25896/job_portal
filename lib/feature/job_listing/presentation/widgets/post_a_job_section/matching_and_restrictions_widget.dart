import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/common/widget/custom_contaner.dart';
import 'package:job/common/widget/custom_divider.dart';
import 'package:job/helper/app_color_helper.dart';
import 'package:job/util/dimensions.dart';
import 'package:job/util/styles.dart';

class MatchingAndRestrictionsWidget extends StatefulWidget {
  const MatchingAndRestrictionsWidget({super.key});

  @override
  State<MatchingAndRestrictionsWidget> createState() => _MatchingAndRestrictionsWidgetState();
}

class _MatchingAndRestrictionsWidgetState extends State<MatchingAndRestrictionsWidget> {
  bool restrictAge = false;
  bool restrictGender = false;
  bool restrictExperience = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        CustomContainer(verticalPadding: 20,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('applicant_matching'.tr,
                  style: textBold.copyWith( fontSize: Dimensions.fontSizeLarge)),

              CustomDivider(),
              Row(spacing: Dimensions.paddingSizeDefault,
                crossAxisAlignment: CrossAxisAlignment.start, children: [

                Expanded(flex: 2,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row( children: [
                      Text('matching_strength'.tr, style: textRegular),
                      SizedBox(width: 8),
                      CustomContainer(
                        child: Row(children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Text('Good', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                        ])),
                    ]),


                    SizedBox(height: 8),
                    Text('Adding more criteria gives a higher\nMatching Strength',
                        style: textRegular.copyWith()),
                    SizedBox(height: 16),

                    Center(child: SizedBox(width: 120, height: 120,
                      child: Stack(alignment: Alignment.center, children: [
                        SizedBox(width: 120, height: 120,
                          child: CircularProgressIndicator(
                            strokeCap: StrokeCap.round,
                            value: 4 / 6,
                            strokeWidth: 18,
                            backgroundColor: Theme.of(context).hintColor,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              systemPrimaryColor()))),

                        Text('4/6', style: textBold.copyWith(fontSize: 28)),
                      ]),
                    ))])),


                Container(width: 1, height: 220, color: Theme.of(context).hintColor),

                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('All Criteria', style: textSemiBold.copyWith()),
                        SizedBox(height: 4),
                        Text('You have submitted the following criteria. You can see how much of your Job Profile you have completed.', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                        SizedBox(height: 12),
                        Wrap(
                          runSpacing: 10,
                          spacing: 40,
                          children: [
                            _criteriaItem(true, 'Total Year of Experience', '2 to 6 years'),
                            _criteriaItem(false, 'Education', 'Not Added', add: true),
                            _criteriaItem(true, 'Location', 'Anywhere in Bangladesh'),
                            _criteriaItem(true, 'Skills & Expertise', 'Creative'),
                            _criteriaItem(false, 'Industry Experience', 'Not Added', add: true),
                            _criteriaItem(true, 'Salary', '7777 - 8888'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Applicant Restriction Card
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Applicant Restriction', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 16),
                Row(
                  children: [
                    // Age
                    Expanded(
                      child: _restrictionItem(
                        label: 'Age',
                        value: '19-24 Years',
                        restrict: restrictAge,
                        onChanged: (v) => setState(() => restrictAge = v),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Gender
                    Expanded(
                      child: _restrictionItem(
                        label: 'Gender',
                        value: 'Any',
                        restrict: restrictGender,
                        onChanged: (v) => setState(() => restrictGender = v),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Years of experience
                    Expanded(
                      child: _restrictionItem(
                        label: 'Years of experience',
                        value: '2-6 Years',
                        restrict: restrictExperience,
                        onChanged: (v) => setState(() => restrictExperience = v),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _criteriaItem(bool checked, String title, String value, {bool add = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          checked ? Icons.check_circle : Icons.radio_button_unchecked,
          color: checked ? Colors.blue : Colors.grey.shade400,
          size: 20,
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                if (add) ...[
                  SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {},
                    child: Text('+ Add', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                ]
              ],
            ),
            Text(value, style: TextStyle(color: checked ? Colors.black : Colors.grey.shade600, fontSize: 13)),
          ],
        ),
      ],
    );
  }

  Widget _restrictionItem({required String label, required String value, required bool restrict, required ValueChanged<bool> onChanged}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(width: 6),
              Icon(Icons.edit, size: 16, color: Colors.grey.shade400),
            ],
          ),
          SizedBox(height: 8),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          SizedBox(height: 12),
          Row(
            children: [
              Switch(
                value: restrict,
                onChanged: onChanged,
                activeThumbColor: Colors.blue,
              ),
              Text('Restrict', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade700)),
            ],
          ),
        ],
      ),
    );
  }
}
