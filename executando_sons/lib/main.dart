import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  bool primeiraExecucao = true;
  double volume = 0.5;

  _executarSomUrl() async{
    String url= "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3";
    int resultado = await audioPlayer.play(url);
    if(resultado == 1){
      //Sucesso
    }
  }
  _executar() async{
    audioPlayer.setVolume(volume);
    if(primeiraExecucao){
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    }else{
      audioPlayer.resume();
    }
  }

  _pausar() async{
    int resultado = await audioPlayer.pause();
    if(resultado == 1){
      //Sucesso
    }
  }
  _parar() async{
    int resultado = await audioPlayer.stop();
    if(resultado == 1){
      //Sucesso
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Executando sons"),),
      body: Column(
        children: [
          Slider(
              value: volume,
              min: 0.0,
              max: 1.0,
              onChanged: (novoVolume){
                setState(() {
                  volume = novoVolume;
                });
                audioPlayer.setVolume(novoVolume);
              }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: _executar,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: _pausar,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: _parar,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

