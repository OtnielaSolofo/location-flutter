class Weather {


  String getWeatherIcon(int condition){

    if(condition < 100){
      return "A";
    }else if(condition < 400){
      return "B";
    }
    else if(condition < 500){
      return "C";
    }
    else if(condition < 600){
      return "D";
    }
    else if(condition < 700){
      return "E";
    }
    else if(condition < 800){
      return "F";
    }else {
      return 'G';
    }

  }
  String getWeatherMessage(double temp){
    if(temp < 100){
      return "Its A";
    }else if(temp < 400){
      return "Its B";
    }
    else if(temp < 500){
      return "Its C";
    }
    else if(temp < 600){
      return "Its D";
    }
    else if(temp < 700){
      return "Its E";
    }
    else if(temp < 800){
      return "Its F";
    }else {
      return 'Its G';
    }
  }
}
