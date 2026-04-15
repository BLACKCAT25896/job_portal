import 'package:mighty_job/api_handle/global_api_response_model.dart';
import 'package:mighty_job/common/layout/section_header_with_path_widget.dart';
import 'package:mighty_job/common/widget/responsive_grid_widget.dart';
import 'package:mighty_job/feature/payment_method/domain/model/payment_method_model.dart';
import 'package:mighty_job/feature/payment_method/logic/payment_method_controller.dart';
import 'package:mighty_job/feature/payment_method/presentation/widgets/payment_gateway/bkash.dart';
import 'package:mighty_job/feature/payment_method/presentation/widgets/payment_gateway/cod_delivery_widget.dart';
import 'package:mighty_job/feature/payment_method/presentation/widgets/payment_gateway/paypal.dart';
import 'package:mighty_job/feature/payment_method/presentation/widgets/payment_gateway/paytm.dart';
import 'package:mighty_job/feature/payment_method/presentation/widgets/payment_gateway/razor_pay.dart';
import 'package:mighty_job/feature/payment_method/presentation/widgets/payment_gateway/ssl_commerz.dart';
import 'package:mighty_job/feature/payment_method/presentation/widgets/payment_gateway/stripe.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PaymentGatewayWidget extends StatefulWidget {
  const PaymentGatewayWidget({super.key});

  @override
  State<PaymentGatewayWidget> createState() => _PaymentGatewayWidgetState();
}

class _PaymentGatewayWidgetState extends State<PaymentGatewayWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(initState: (_) {
        Get.find<PaymentMethodController>().getPaymentMethod(1);
      }, builder: (controller) {
        ApiResponse<PaymentMethodItem>? model = controller.paymentMethod;
        return Column(children: [
          SectionHeaderWithPath(sectionTitle: "payment_method".tr),

          (model != null && model.data != null)?
           Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
             child: const ResponsiveMasonryGrid(width: 400, children: [
               CodDeliveryWidget(),
               StripePaymentGatewayCardItem(),
               SslCommerzPaymentGatewayCardItem(),
               PaypalPaymentGatewayCardItem(),
               PaytmPaymentGatewayCardItem(),
               BkashPaymentGatewayCardItem(),
               RazorPayPaymentGatewayCardItem(),
             ],
             ),
           ):  Center(child: Padding(padding: ThemeShadow.getPadding(),
              child: const CircularProgressIndicator())),
        ]);
      }
    );
  }
}

