class Converter{

  static int convertToNumber(String number){
    var parts = number.split(':');
    var  minutes = int.parse(parts[0]);
    var secondsParts = parts[1].split('.');
    var  seconds = int.parse(secondsParts[0]);
    int milliseconds= 0;
    if(secondsParts.length < 2){
      milliseconds = int.parse(parts[2].split('.')[1]);
    }
    else{
      milliseconds = int.parse(secondsParts[1]);
    }
    return (minutes * 60 + seconds) * 1000 + milliseconds;
  }

  static String convertToString(int number){
    
    final Duration duration = Duration(milliseconds: number);
    final int minutes = duration.inMinutes;
    final int seconds = duration.inSeconds.remainder(60);
    final int millisecondsPart = duration.inMilliseconds.remainder(1000);
    final String minutesString = (0 > millisecondsPart && millisecondsPart > -1000 || 0 > seconds && seconds > -60) && minutes == 0 
                                  ? "-${minutes.toString().padLeft(1, '0')}" 
                                  : minutes.toString().padLeft(1, '0');
    
    final String secondsString = seconds.abs().toString().padLeft(2, '0');
    final String millisecondsString = millisecondsPart.abs().toString().padLeft(3, '0');

    return '$minutesString:$secondsString.$millisecondsString';
  }
}