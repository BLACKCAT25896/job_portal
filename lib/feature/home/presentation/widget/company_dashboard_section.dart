import 'package:flutter/material.dart';
import 'package:job/common/layout/base_layout.dart';

class CompanyDashboardSection extends StatefulWidget {
  const CompanyDashboardSection({super.key});

  @override
  State<CompanyDashboardSection> createState() => _CompanyDashboardSectionState();
}

class _CompanyDashboardSectionState extends State<CompanyDashboardSection> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController, child: Column(children: []));
  }
}
