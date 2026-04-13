import 'dart:async';

import 'package:ecommerce/feature/inventory/product/logic/search_product_controller.dart';
import 'package:ecommerce/feature/pos/presentation/barcode/scanner_button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class BarcodeScannerWithController extends StatefulWidget {
  const BarcodeScannerWithController({super.key});

  @override
  State<BarcodeScannerWithController> createState() => _BarcodeScannerWithControllerState();
}

class _BarcodeScannerWithControllerState extends State<BarcodeScannerWithController> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
    torchEnabled: true,
  );

  Barcode? _barcode;
  StreamSubscription<BarcodeCapture>? _subscription;


  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return const Text(
        'Scan something!',
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription = controller.barcodes.listen(_handleBarcode);
    unawaited(controller.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _subscription = controller.barcodes.listen(_handleBarcode);
        unawaited(controller.start());
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        _subscription?.cancel();
        unawaited(controller.stop());
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });

      if (_barcode != null) {
        Get.find<SearchProductController>().getSearchProductList(_barcode?.displayValue??'',
            '', fromScan: true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('product Id: ${_barcode!.displayValue}')),
        );
        unawaited(controller.stop());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner')),
      backgroundColor: Colors.black,
      body: GetBuilder<SearchProductController>(
        builder: (posController) {
          return Stack(children: [
              MobileScanner(
                controller: controller,
                fit: BoxFit.contain,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 100,
                  color: Colors.black.withValues(alpha:0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ToggleFlashlightButton(controller: controller),
                      StartStopMobileScannerButton(controller: controller),
                      Expanded(child: Center(child: _buildBarcode(posController.barcode))),
                      SwitchCameraButton(controller: controller),
                      AnalyzeImageFromGalleryButton(controller: controller),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    await _subscription?.cancel();
    await controller.dispose();
    super.dispose();
  }
}
