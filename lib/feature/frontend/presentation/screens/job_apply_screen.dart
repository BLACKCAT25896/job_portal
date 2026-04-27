import 'package:flutter/material.dart';
import 'package:mighty_job/common/layout/base_layout.dart';

class JobApplyScreen extends StatefulWidget {
  const JobApplyScreen({super.key});

  @override
  State<JobApplyScreen> createState() => _JobApplyScreenState();
}

class _JobApplyScreenState extends State<JobApplyScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BaseLayout(scrollController: scrollController,
      child: Column(children: []));
  }
}
