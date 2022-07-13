import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currencycalc/widgets/buttons_grid.dart';
import 'package:currencycalc/widgets/currency_pickers.dart';
import 'package:currencycalc/widgets/value_counter.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }


  RxString selectedFrom = 'USD'.obs;
  RxString selectedTo = 'NIS'.obs;
  RxString ammount = '1'.obs;
  RxDouble selectedPrice =3.55.obs;

  void changeSelected(bool isFrom, String currency) {
    if(selectedFrom.value=='USD'&&selectedTo.value=='NIS'){
      selectedPrice.value=3.55;
    }
    else     if(selectedFrom.value=='USD'&&selectedTo.value=='USD'){
      selectedPrice.value=1.00;
    }   else     if(selectedFrom.value=='USD'&&selectedTo.value=='JD'){
      selectedPrice.value=0.70;
    }   else     if(selectedFrom.value=='USD'&&selectedTo.value=='EUR'){
      selectedPrice.value=0.98;
    }

    else  if(selectedFrom.value=='NIS'&&selectedTo.value=='NIS'){
      selectedPrice.value=3.55;
    }
    else     if(selectedFrom.value=='NIS'&&selectedTo.value=='USD'){
      selectedPrice.value=1.00;
    }   else     if(selectedFrom.value=='NIS'&&selectedTo.value=='JD'){
      selectedPrice.value=0.70;
    }   else     if(selectedFrom.value=='NIS'&&selectedTo.value=='EUR'){
      selectedPrice.value=0.98;
    }



    else   if(selectedFrom.value=='JD'&&selectedTo.value=='NIS'){
      selectedPrice.value=4.90;
    }
    else     if(selectedFrom.value=='JD'&&selectedTo.value=='USD'){
      selectedPrice.value=1.41;
    }   else     if(selectedFrom.value=='JD'&&selectedTo.value=='JD'){
      selectedPrice.value=1.0;
    }   else     if(selectedFrom.value=='JD'&&selectedTo.value=='EUR'){
      selectedPrice.value=1.39;
    }


    else    if(selectedFrom.value=='EUR'&&selectedTo.value=='NIS'){
      selectedPrice.value=3.53;
    }
    else     if(selectedFrom.value=='EUR'&&selectedTo.value=='USD'){
      selectedPrice.value=1.01;
    }   else     if(selectedFrom.value=='EUR'&&selectedTo.value=='JD'){
      selectedPrice.value=0.72;
    }   else     if(selectedFrom.value=='EUR'&&selectedTo.value=='EUR'){
      selectedPrice.value=1.0;
    }



    if (isFrom && selectedFrom.value != currency) {

      selectedFrom.value = currency;


    } else if (!isFrom) {
      selectedTo.value = currency;

    }
  }

  void switchCurrencies() {
    String selectedFromTemp = selectedFrom.value;
    selectedFrom.value = selectedTo.value;
    selectedTo.value = selectedFromTemp;
  }

  void backspace() {
    if (ammount.value.isNotEmpty) {
      ammount.value = ammount.value.substring(0, ammount.value.length - 1);
    }
  }

  void changeAmmount(String value) {
    int index = ammount.value.indexOf(',');
    if (value == '0' && ammount.value == '0') {
    } else if (ammount.value == '0' && value != ',') {
      ammount.value = value;
    } else if (ammount.value.isEmpty && value == ',') {
      ammount.value = '0,';
    } else if (!ammount.value.contains(',') &&
        value == ',' &&
        ammount.value.isNotEmpty) {
      ammount.value = '${ammount.value}$value';
    } else if (value != '' &&
        ammount.value.contains(',') &&
        ammount.value.length - index < 3) {
      ammount.value = '${ammount.value}$value';
    } else if (value != ',' && !ammount.value.contains(',')) {
      ammount.value = '${ammount.value}$value';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar:AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xfff8f8f8),
        titleSpacing: 0,
        title:const Text.rich(TextSpan(
            text: 'Currency ',
            style: TextStyle(color:Colors.blue,fontSize: 26 ,fontWeight: FontWeight.bold),
            children: <InlineSpan>[
              TextSpan(
                text: 'Convertor',
                style: TextStyle(color:Color(0xFF006064),fontSize: 26 ,fontWeight: FontWeight.bold),
              )
            ]
        ),
        ),
        centerTitle: true,
      ),
      body: ListView(
          children: [
            currencyPickers(selectedFrom, selectedTo, switchCurrencies,changeSelected),
            valueCounter( ammount, selectedFrom, selectedTo, selectedPrice),
            buttonsGrid(changeAmmount, backspace),
          ],
        ),
    );
  }
}

