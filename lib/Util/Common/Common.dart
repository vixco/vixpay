

class Common {
  static String getUrl(String? id) {
    Map tokenUrlList =
    {"VIX":"assets/img/vix.png",
      "BTC":"https://s3-ap-northeast-2.amazonaws.com/cobak/logo/1520345981272600_bitcoin.png",
      "ETH":"https://s3-ap-northeast-2.amazonaws.com/cobak/logo/1520345981450374_ethereum.png",
      "TES":"https://s3-ap-northeast-2.amazonaws.com/cobak/logo/1520345981450374_ethereum.png",
      "TKG1":"https://s3-ap-northeast-2.amazonaws.com/cobak/logo/1520345981272600_bitcoin.png",
      "GML2":"https://storage.cobak.co/uploads/1560238789141232_e410458683.png"};
    return tokenUrlList[id]??"assets/img/vix.png";
  }

  static String getAbbreviatedAddress16(String address) {
    if (address.length >16){
      String text1 = address.substring(0, 6);
      String text2 = address.substring(address.length-10, address.length);
      return text1+"..."+text2;
    }else{
      return address;
    }
  }
  static String getAbbreviatedAddress34(String address) {
    if (address.length >34){
      String text1 = address.substring(0, 14);
      String text2 = address.substring(address.length-20, address.length);
      return text1+"..."+text2;
    }else{
      return address;
    }
  }


  static int mainSwiperIndex = 0;
  static int walletSwiperIndex = 0;

}
