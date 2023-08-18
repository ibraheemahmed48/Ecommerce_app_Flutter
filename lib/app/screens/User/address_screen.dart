import 'package:ecommerce_app/app/services/product_services.dart';
import 'package:ecommerce_app/components/declarations.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../../../components/utils.dart';
import '../../widgets/custem_textF.dart';
import '../../widgets/custom_button.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key,  required this.totalAmount});
  static const String routeName = "/address-Screen";
  final String totalAmount;


  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final ProductServices productServices = ProductServices();
  final TextEditingController addressText = TextEditingController();
  final TextEditingController homeNumberText = TextEditingController();
  final TextEditingController streetText = TextEditingController();
  final TextEditingController specialMarkText = TextEditingController();
  final _addressFormcreen = GlobalKey<FormState>();
  List <PaymentItem> _paymentItems=[];
  void onApplePayResult(paymentResult) {
    // Send the resulting Apple Pay token to your server / PSP
  }

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }
  void onCashResult(){

  }
  void payPressed(String address,String paymentMethod){
    bool formOK =
        addressText.text.isNotEmpty||
        homeNumberText.text.isNotEmpty||
        streetText.text.isNotEmpty||
        specialMarkText.text.isNotEmpty;
    if(formOK){
      if(_addressFormcreen.currentState!.validate()){
        address = " ${addressText.text} ,${homeNumberText.text} ,${streetText.text} ,${specialMarkText.text} ,";

      }else{
        showAlertDialog2(context,"Stop", "Fill all address info");
      }

    }else{
      if(address.isEmpty){
        showAlertDialog2(context,"Stop", "Fill all address info");
      }
    }
    productServices.saveUserAddress(context: context, address: address);
    productServices.setAnOrder(context: context, address: address,
        totalPrice: double.parse(widget.totalAmount),
        paymentMethod: paymentMethod);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _paymentItems.add(PaymentItem(
        amount: widget.totalAmount,
        label: "Total",
         status:PaymentItemStatus.final_price
    ));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addressText.dispose();
    homeNumberText.dispose();
    streetText.dispose();
    specialMarkText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final address = context.watch<UserProvider>().user.address;
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: Declarations.appBarGradient
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add Your Address",
              style:TextStyle(
                fontWeight: FontWeight.bold
              ) ,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if(address.isNotEmpty)
                Column(
                  children: [
                  Container(
                    width: double.maxFinite,
                    decoration:  BoxDecoration(
                      border: Border.all(color:Colors.black12)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        textAlign: TextAlign.left,
                        overflow:TextOverflow.ellipsis,

                        "Your Address : ${address}",
                      style: const TextStyle(
                        fontSize:18
                      ),
                      ),
                    ),
                  ),
                    const SizedBox(height: 20,),
                    const SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          textAlign: TextAlign.left,
                          overflow:TextOverflow.ellipsis,
                          "Or you have new address",
                          style: TextStyle(
                              fontSize:18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),


                  ],
                ),
              Form(
                key: _addressFormcreen,
                child: Column(
                  children: [
                    CustemText(
                      controller: addressText,
                      hintText: 'Address, Home',
                      icon: Icons.home,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustemText(
                      controller: homeNumberText,
                      hintText: 'Home, Number',
                      icon: Icons.streetview_outlined,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    CustemText(
                      controller: streetText,
                      hintText: 'Area, Street',
                      icon: Icons.add_business,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustemText(
                      controller: specialMarkText,
                      hintText: 'Special Mark',
                      icon: Icons.mark_as_unread,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GooglePayButton(
                      width: double.maxFinite,
                      paymentConfigurationAsset: 'gpay.json',
                      //paymentConfiguration: PaymentConfiguration.fromJsonString('{"provider": "google_pay","data": {"environment": "TEST","apiVersion": 2,"apiVersionMinor": 0,"allowedPaymentMethods": [{"type": "CARD","tokenizationSpecification": {"type": "PAYMENT_GATEWAY","parameters": {"gateway": "example","gatewayMerchantId": "gatewayMerchantId"}},"parameters": {"allowedCardNetworks": ["VISA", "MASTERCARD"],"allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],"billingAddressRequired": true,"billingAddressParameters": {"format": "FULL","phoneNumberRequired": true}}}],"merchantInfo": {"merchantId": "01234567890123456789","merchantName": "alMohamady"},"transactionInfo": {"countryCode": "IQ","currencyCode": "IQD"}}}'),
                      paymentItems: _paymentItems,
                      type: GooglePayButtonType.order,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: (paymentResult){
                        payPressed(address, "Google Pay");
                      },
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      icon: Icons.attach_money,
                      text: 'Cash on delivery',
                      onTap: (){
                        payPressed(address,"Cash");

                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
