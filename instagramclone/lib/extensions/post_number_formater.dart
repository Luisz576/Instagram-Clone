extension PostNumberFormatter on int{
  String postNumberFormat(){
    if(this > 99999){
      return "${(this / 1000000).floor()} M";
    }
    if(this > 999){
      return "${(this / 1000).floor()},${this % 1000}";
    }
    return toString();
  }
}