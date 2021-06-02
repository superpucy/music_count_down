import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState{
  Future<InitializationStatus> initialization;
  AdState(this.initialization);
  String get bannerAdUnitId => 'ca-app-pub-5065042543576800/7833437920';
  AdListener get adListener => _adListener;
  AdListener _adListener = AdListener(
    onAdLoaded: (ad) => print('Ad loaded: ${ad.adUnitId}'),
    onAdClosed: (ad) => print('Ad closed: ${ad.adUnitId}'),
    onAdFailedToLoad: (ad, error) => print('Ad failed to load: ${ad.adUnitId}, $error.'),
    onAdOpened: (ad) => print('Ad opened: ${ad.adUnitId}'),
    onAppEvent: (ad, name, data) => print('App event : ${ad.adUnitId}, $name, $data.'),
    onApplicationExit: (ad) => print('App Exit: ${ad.adUnitId}.'),
    onNativeAdClicked: (nativeAd) => print('Native ad clicked: ${nativeAd.adUnitId}'),
    onNativeAdImpression: (nativeAd) => print('Native ad impression: ${nativeAd.adUnitId}.'),
    onRewardedAdUserEarnedReward: (ad, reward) => print('User rewarded: ${ad.adUnitId}, ${reward.amount} ${reward.type}')
  );
}