import 'dart:async';

import 'package:expiration_date/core/enums/enums.dart';
import 'package:expiration_date/core/thema/app_colors.dart';
import 'package:flutter/foundation.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/generated/locale_keys.g.dart';
import 'package:expiration_date/domain/entities/supplier.dart';
import 'package:expiration_date/pages/input_product_page/bloc/output_bloc.dart';
import 'package:expiration_date/pages/widgets/custom_scaffold_with_additions_widget.dart';
import 'package:flutter/material.dart';
import 'package:expiration_date/dependency_injection.dart' as di;
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bloc/output_event.dart';

class InputProductPage extends StatefulWidget {
  const InputProductPage({super.key, required this.supplier});

  final Supplier supplier;

  @override
  State<InputProductPage> createState() => _InputProductPage();
}

class _InputProductPage extends State<InputProductPage> {
  final OutputBloc _outputBloc = di.getIt.get();
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = _getWebViewByCurrantPlatform();

    _outputBloc.stream.listen((state) {
      if (state.blocStatus == BlocStatus.loading) {
        _showLoadingDialog();
      } else if (state.blocStatus == BlocStatus.loaded) {
        Navigator.of(context).pop(); // Close the loading dialog
        _showSuccessDialog();
      } else if (state.blocStatus == BlocStatus.error) {
        Navigator.of(context).pop(); // Close the loading dialog
        _showErrorDialog(state.errorText!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithAdditionsWidget(
      appBarAdditions: Container(
        width: 150,
        color: AppColors.mainBlack,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(AppColors.brightGreen),
          ),
          onPressed: () {
            _outputBloc.add(SendNewProductsEvent(supplier: widget.supplier));
          },
          child: Text(
            LocaleKeys.submit.tr(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
      title: widget.supplier.supplierName.toUpperCase(),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }

  WebViewController _getWebViewByCurrantPlatform() {
    return kIsWeb
        ? (WebViewController()
          ..loadRequest(Uri.parse(
              'https://docs.google.com/spreadsheets/d/1FIgzRGdDkkfiqF-C8M-FSZlQSrFfmd_harXA4bTSOsA/edit?usp=sharing')))
        : (WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                debugPrint("Loading: $progress%");
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(
              'https://docs.google.com/spreadsheets/d/1FIgzRGdDkkfiqF-C8M-FSZlQSrFfmd_harXA4bTSOsA/edit?usp=sharing')));
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              Text(LocaleKeys.sending.tr()),
            ],
          ),
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Timer(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });

        return AlertDialog(
          content: Lottie.asset(
            'animations/success_animation.json',
            repeat: false,
            width: 200,
            height: 200,
          ),
        );
      },
    );
  }

  void _showErrorDialog(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Timer(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        return AlertDialog(
          // title:
          content: SizedBox(
            height: 300,
            child: Column(
              children: [
                Text(LocaleKeys.error_plug.tr()),
                Lottie.asset(
                  'animations/error.json',
                  repeat: false,
                  width: 250,
                  height: 250,
                ),
                Center(child: Text(error)),
              ],
            ),
          ),
        );
      },
    );
  }
}
