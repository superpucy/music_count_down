import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';

import 'ad_state.dart';
import 'database.dart';
import 'main.dart';
class CountDownPage extends StatefulWidget {
  CountDownPage(this.id, this.name, this.second, this.pic, this.desc, {Key key}) : super(key: key);
   final String id;
   final String name;
   final int second;
   final String pic;
   final String desc;

  @override
  _CountDownPageState createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  int time = 0;
  bool isStart = false;
  static const period = const Duration(seconds: 1);

  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer audioPlayer ;
  AudioCache audioCache ;
  bool isActive = false;
  bool isMute = false;
  bool isStop = false;
  Map map ;
  BannerAd banner;
  // BannerAd _bannerAd;
  // final Completer<BannerAd> bannerCompleter = Completer<BannerAd>();

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    time = widget.second;
    initDb();
    initPlayer();
  }

  Future<void> initDb() async {
    final db = await DBProvider.initDB();
    var list = await db.rawQuery('SELECT * FROM MusicAlbum where parent = ?', [widget.id]);
    Random random = new Random();
    int randomNumber = random.nextInt(list.length);
    setState(() {
      this.map = list[randomNumber];
    });
  }


  void initPlayer(){
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    audioPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  void handleTick() {
    Timer.periodic(period, (timer) {
      if (!mounted) {
        return; // Just do nothing if the widget is disposed.
      }
      if(isStop){
        timer.cancel();
        timer = null;
        audioPlayer.stop();
      }else if (isActive) {
        if(time >0) {
          if(!isStart) {
            audioCache.play(this.map["audio"]);
          }else{
            audioPlayer.resume();
          }
          setState(() {
            time--;
            isStart = true;
          });
        }else{
          audioPlayer.pause();
          timer.cancel();
          timer = null;
          isActive = !isActive;
        }
      }else{
        timer.cancel();
        audioPlayer.pause();
      }
    });
  }


  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  String constructTime(int seconds) {
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return formatTime(minute) + ":" + formatTime(second);
  }

  Widget _getTimes(){
    String times =constructTime(time);
    return Text(times,style: TextStyle(fontSize: 80,),);
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 8,
            child: Center(
                child: _getTimes()
            ),
        ),
        Expanded(
            flex: 1,
            child: Text(this.map["desc"]??"",
            softWrap: true,
            style: TextStyle(color: Colors.black26), ),
        ),
        Expanded(
            flex: 1,
            child: buildBanner()
        ),
      ],
    );
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((state) {
      setState(() {
        banner = BannerAd(
            adUnitId: adState.bannerAdUnitId,
            size: AdSize.banner,
            request: AdRequest(),
            listener: adState.adListener
        )..load();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        backgroundColor: const Color(0xFFB5CAA0),
        body: this.map!=null?_buildBody():ProgressWidget,
        persistentFooterButtons: [
          FloatingActionButton(
            heroTag: "stop",
            child: Icon(Icons.stop),
            onPressed: (){
              setState(() {
                isActive = false;
                isStop = true;
                time = widget.second;
              });

              handleTick();
            },
          ),

          FloatingActionButton(
            heroTag: "start",
            child: Icon(isActive ? Icons.pause : Icons.play_arrow),
            onPressed: (){
              setState(() {
                isActive = !isActive;
                isStop = false;
              });
              handleTick();
            },
          ),

          FloatingActionButton(
            heroTag: "mute",
            child: Icon(isMute?Icons.volume_up:Icons.volume_off),
            onPressed: (){
              setState(() {
                isMute = !isMute;
                isStop = false;
              });
              if(isMute) {
                audioPlayer.setVolume(0);
              }else{
                audioPlayer.setVolume(0.5);
              }
            },
          ),
        ],
    );
  }

  @override
  void dispose() {

    banner.dispose();
    super.dispose();
    Wakelock.disable();
    audioPlayer.stop();
  }

  Widget buildBanner() {
    if(banner == null)
      return SizedBox(height: 50,);
    else
      return Container(
        height: 50,
        child: AdWidget(ad: banner,),
      );
  }
}
