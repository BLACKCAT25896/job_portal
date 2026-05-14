
import 'package:job/common/layout/candidate_base_layout.dart';
import 'package:job/feature/job_application/presentation/widgets/job_application_list_widget.dart';
import 'package:flutter/material.dart';
class JobApplicationScreen extends StatefulWidget {
  const JobApplicationScreen({super.key});

  @override
  State<JobApplicationScreen> createState() => _JobApplicationScreenState();
}

class _JobApplicationScreenState extends State<JobApplicationScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CandidateBaseLayout(scrollController: scrollController,
        child: JobApplicationListWidget(scrollController: scrollController)),
    );
  }
}



