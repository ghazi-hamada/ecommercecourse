import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.child})
      : super(key: key);
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(AppImageAsset.loading, width: 255, height: 255),
      );
    } else if (statusRequest == StatusRequest.failure) {
      return Center(
        child: Lottie.asset(AppImageAsset.nodata,
            width: 255, height: 255, repeat: true),
      );
    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.server, width: 255, height: 255),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.offline, width: 255, height: 255),
      );
    } else {
      return child;
    }
  }
}

class HandlingDataViewRequesst extends StatelessWidget {
  const HandlingDataViewRequesst(
      {Key? key, required this.statusRequest, required this.child})
      : super(key: key);
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(AppImageAsset.loading, width: 255, height: 255),
      );
    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.server, width: 255, height: 255),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
        child: Lottie.asset(AppImageAsset.offline, width: 255, height: 255),
      );
    } else {
      return child;
    }
  }
}

class HandlingItems extends StatelessWidget {
  const HandlingItems(
      {Key? key, required this.statusRequest, required this.child})
      : super(key: key);
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Column(
            children: const [
              SizedBox(height: 200),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          )
        : statusRequest == StatusRequest.serverfailure
            ? Center(
                child:
                    Lottie.asset(AppImageAsset.server, width: 255, height: 255),
              )
            : statusRequest == StatusRequest.offlinefailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.offline,
                        width: 255, height: 255),
                  )
                : child;
  }
}
