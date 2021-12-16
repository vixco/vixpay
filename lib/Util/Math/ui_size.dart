

class gridSizeCalc {

  static double childAspectRatio(
    double containerHeight,   //Grid 컨테이너의 크기
    double containerWidth,
    int rowItemsCount,        //표시될 줄 수
    int colItemCount,         //표시될 행 수
    double overFlowSizeRate,  //남은 목록이 보여질 비율
  ) {
    try {
      double value =  (containerHeight / rowItemsCount) /
            ((containerWidth / colItemCount) -
                (containerWidth /
                    colItemCount /
                    colItemCount *
                    overFlowSizeRate));
      if(value.isNaN || value<1.0){
        return 1.0;
      }else{
        return value;
      }
    } catch (e) {
      return 1.0;
    }
  }
}
