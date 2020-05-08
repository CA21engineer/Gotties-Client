import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';

class ShareStore {
  ShareStore() {
    _initDynamicLinks();
  }
  Future<void> share(String title, String description, String imageUrl) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://gottiesclient.page.link',
      link: Uri.parse('https://gottiesclient.web.app'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.ryitto.gottiesclient',
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.example.ryitto.gottiesclient',
        minimumVersion: '1.0.0',
        appStoreId: '1511557574',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: title,
        description: description,
        imageUrl: Uri.parse(imageUrl),
      ),
    );

    final Uri dynamicUri = (await parameters.buildShortLink()).shortUrl;

    await Share.share('$dynamicUri');
  }

  Future<void> _initDynamicLinks() async {
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      debugPrint(deepLink.toString());
    }

    FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        debugPrint(deepLink.toString());
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }
}
