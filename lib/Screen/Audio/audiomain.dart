import 'package:alquran_app/Model/surat.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Audio extends StatefulWidget {
  const Audio({Key key}) : super(key: key);

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  List<SuratDetail> _list = [];
  var loading = false;
  Future<Null> _fetchData() async {
    setState(() {
      loading = true;
    });
    final String url =
        "https://al-quran-8d642.firebaseio.com/data.json?print=pretty";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(SuratDetail.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  String currentNama = "";
  String currentArti = "";
  IconData btnIcon = Icons.play_arrow;

  // AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";

  Duration duration = new Duration();
  Duration position = new Duration();

  // ignore: non_constant_identifier_names
  // void PlayMusic(String url) async {
  //   if (isPlaying && currentSong != url) {
  //     audioPlayer.pause();
  //     int result = await audioPlayer.play(url);
  //     if (result == 1) {
  //       setState(() {
  //         currentSong = url;
  //       });
  //     } else if (!isPlaying) {
  //       int result = await audioPlayer.play(url);
  //       if (result == 1) {
  //         setState(() {
  //           isPlaying = true;
  //           btnIcon = Icons.play_arrow;
  //         });
  //       }
  //     }
  //     audioPlayer.onDurationChanged.listen((event) {
  //       setState(() {
  //         duration = event;
  //       });
  //     });
  //     audioPlayer.onAudioPositionChanged.listen((event) {
  //       setState(() {
  //         position = event;
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Audio Surah",
          style: TextStyle(
            color: Colors.teal[800],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              print(_list[index].audio);
                              // PlayMusic(_list[index].audio);
                              setState(() {
                                currentNama = _list[index].nama;
                                currentArti = _list[index].arti;
                              });
                            },
                            child: Container(
                              color: (index % 2 == 1)
                                  ? Colors.white
                                  : Colors.grey[100],
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 80.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/comunity.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              _list[index].nama,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              _list[index].arti,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      _list[index].asma,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color(0x552212121),
                blurRadius: 8.0,
              )
            ]),
            child: Column(
              children: [
                Slider.adaptive(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {}),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 12.0, left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/comunity.png',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  currentNama,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(currentArti),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // if (isPlaying) {
                          //   audioPlayer.pause();
                          //   setState(() {
                          //     btnIcon = Icons.pause;
                          //     isPlaying = false;
                          //   });
                          // } else {
                          //   audioPlayer.resume();
                          //   setState(() {
                          //     btnIcon = Icons.play_arrow;
                          //     isPlaying = true;
                          //   });
                          // }
                        },
                        iconSize: 42.0,
                        icon: Icon(btnIcon),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
