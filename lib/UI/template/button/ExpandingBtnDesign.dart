

/*
class CartInfoBarOrange extends StatelessWidget {
  double height;
  final GestureTapCallback onTap;
  Color bgColor;
  Color enableTextColor;
  Color disableTextColor;
  Color titleColor;

  CartInfoBarOrange(
    {
      this.height = 52.0,
      int amount = 0,
      this.onTap,
      this.titleColor = ThemeColors.txtMainWhite,
      this.bgColor = ThemeColors.white,
      this.enableTextColor = ThemeColors.tangerine,
      this.disableTextColor = ThemeColors.txtDisableBlack,
      String symbol = "\$"});

  Color _txtColor(numProducts) {
    if (numProducts == 0) {
      return disableTextColor;
    } else {
      return enableTextColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return   StoreConnector<AppState, CartState>(
      converter: (store) => store.state.cartState,
      builder: (_, CartState state) =>
        Container(
          height: height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
//              Container(
//                child: MainSubject(
//                  text: "tender",
//                  marginLeft:0,
//                  textColor: titleColor,
//                  marginUnder: 0.0,
//                ),
//              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(bottom: 12, top: 8),child:Text(AppLocalizations.of(context).getString("tender"),
                    textAlign: TextAlign.center,
                    style: ThemeTextStyles.bottomTitleOrange,
                  ),
                  ),
                  _buildIcon(state),
                ],
              ),
            ],
          ))
    );
  }

  Widget _buildIcon(CartState state) {
    int numProducts = state.calcItemsQty();
    return InkWell(
      onTap: numProducts > 0
        ? onTap
        : () {
        print("0");
      },
      child: Container(
        color: bgColor,
        child: Row(
          children: <Widget>[
            themeSpacingBox.divMinLine,
            Text("(+" + numProducts.toString() + ") ",
              style: ThemeTextStyles.orderCartCountOrange.apply(
                color: _txtColor(numProducts))),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                CurrencyFormatter.simpleCurrencyDecimal
                  .format(state.calcCartPrice()),
                style : ThemeTextStyles.TablePageBottomPrice.apply(color: _txtColor(numProducts)),),
            ),
            //Expanded(child : Padding(padding: EdgeInsets.only(top:4))),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,// You can use like this way or like the below line
                //borderRadius: new BorderRadius.circular(30.0),
                color: _txtColor(numProducts),
              ),
              child:Icon(Icons.shopping_cart, color: Colors.white, size: 15)
            )
            ,
          ],
        ),
      ),
    );
  }
}*/
