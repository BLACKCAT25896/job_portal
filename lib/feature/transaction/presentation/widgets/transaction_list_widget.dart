import 'package:mighty_job/common/layout/list_layout_widget.dart';
import 'package:mighty_job/common/widget/custom_search.dart';
import 'package:mighty_job/common/widget/custom_snackbar.dart';
import 'package:mighty_job/feature/transaction/controller/transaction_controller.dart';
import 'package:mighty_job/feature/transaction/domain/models/transaction_model.dart';
import 'package:mighty_job/feature/transaction/presentation/widgets/transaction_item.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final bool fromFilter;

  const TransactionListWidget({super.key, required this.scrollController, this.fromFilter = false});

  @override
  State<TransactionListWidget> createState() => _TransactionListWidgetState();
}

class _TransactionListWidgetState extends State<TransactionListWidget> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(initState: (_) {
        Get.find<TransactionController>().getTransactionList(1);
      },
      builder: (controller) {
        final transactionModel = controller.transactionModel;
        final data = transactionModel?.data;

        return GenericListSection<TransactionItem>(
          topWidget: widget.fromFilter? SizedBox() : Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,
                Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
            child: CustomSearch(hintText: 'search'.tr, searchController: searchController,
              onSearch: () async {
                String search = searchController.text.trim();
                if(search.isEmpty){
                  showCustomSnackBar("empty_search".tr);
                }else{
                  await Get.find<TransactionController>().getTransactionList(1, search: search);
                }

              },),
          ),
          showRouteSection: !widget.fromFilter,
          sectionTitle: "transaction".tr,
          pathItems: ["transaction".tr],


          headings: const ["name"],
          scrollController: widget.scrollController,
          isLoading: transactionModel == null,
          totalSize:  data?.total ?? 0,
          offset:  data?.currentPage ?? 1,
          onPaginate: (int? offset) async {
            await controller.getTransactionList(offset ?? 1);
          },
          items: data?.data ?? [],
          itemBuilder: (item, index) {
            return TransactionItemWidget(index: index, transactionItem: item);
          },
        );
      },
    );
  }
}
