import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_count_down/ad_state.dart';
import 'package:music_count_down/count_down.dart';
import 'package:music_count_down/database.dart';
import 'package:music_count_down/style.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  SystemChrome.setEnabledSystemUIOverlays([]);
  // MobileAds.instance.initialize();

  runApp(
      Provider.value(
        value: adState,
        builder: (context, child) => MyApp(),
      )
  );
}
var ProgressWidget = Container(
    decoration: new BoxDecoration(color: const Color(0xFFF9F9F9)),
    child: Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(const Color(0XFF204656)),
            backgroundColor: const Color(0XFFD8D8D8))));
class MyApp extends StatelessWidget {
  Color _themeColor = const Color(0xFF516E41);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '音樂倒計時',
      theme: ThemeData(
        backgroundColor: AppColors.backgroundColor,
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        indicatorColor: AppColors.indicatorColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: '音樂倒計時'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  BannerAd banner;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

  Future<List<Map>> initDb() async {
    final db = await DBProvider.initDB();
    var list = await db.rawQuery('SELECT * FROM Music');
    return list;
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
  void dispose(){
    banner.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:  Column(
          children:[
            Expanded(
                child:FutureBuilder<List<Map>>(
                  future:initDb() ,
                  initialData: [],
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      return  GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, //每行三列
                            childAspectRatio: 1.0 //显示区域宽高相等
                        ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            child: Card(
                              color: const Color(0xbbB5CAA0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(snapshot.data[index]["mins"], style: TextStyle(fontSize: 16),),
                                  Text(snapshot.data[index]["name"]),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountDownPage(
                                  snapshot.data[index]["id"],
                                  snapshot.data[index]["name"],
                                  snapshot.data[index]["secound"],
                                  snapshot.data[index]["pic"],
                                  "")));
                            },
                          );
                        },
                      );
                    }else{
                      return Container();
                    }
                  },
                )
            ),
            if(banner == null)
              SizedBox(height: 50,)
            else
              Container(
                height: 50,
                child: AdWidget(ad: banner,),
              )
          ]
        )
    );
  }


}
