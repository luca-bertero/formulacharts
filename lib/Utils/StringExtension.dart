extension StringExtension on String{
  String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }

  String capitalizeFormat(){
    return replaceAll(RegExp("_"), ' ').split(' ').map((word) => word.capitalize()).join(' ');
  }  

  String capitalizeFormatDriver(){
    return split('_').last.capitalize();
  }  
}