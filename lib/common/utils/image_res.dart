class ImageRes {
  // this expression here makes the class private and it further doest allows to define this class's constructor again
  ImageRes._();

  // creating the base common url for all the icon files..
  static const String _imageBase = "assets/images";
  static const String _iconBase = "assets/icons";

  ///image sources
  static const String wireSenseLogo = "$_imageBase/wiresense_logo.jpg";
  static const String letterW = "$_imageBase/letter_w.png";
  //todo - to be removed
  static const String chartDemo = "$_imageBase/chart_demo.png";

  static const String wireSenseElectro = "$_imageBase/wiresense_electro.png";



  ///icon sources
  static const String expressicon = "$_iconBase/expressdeliveryicon.png";
}
