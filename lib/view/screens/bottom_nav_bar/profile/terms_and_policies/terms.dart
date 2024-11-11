import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';


class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Terms of Service',
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
            size: 12,
            text:
                'As stated above, a Terms of Service agreement is a legal agreement where you disclose your rules and guidelines that your users or visitors must agree to in order to use your website or app.'
                '\n\nSome common rules and guidelines include the following:'
                '\n\nNot stealing your content and violating copyright laws'
                '\nNot spamming other users'
                '\nNot using your site for illegal activities'
                '\nThese agreements are commonly abbreviated as ToS and are also referred to as a Terms and Conditions, Terms of Use, Conditions of Use, or User Agreement.'
                '\n\nRegardless of what you call your Terms of Service, the aim of the agreement is the same:'
                '\n\nDisclose the rules and restrictions that your users must adhere to'
                '\nMaintain your right to terminate abusive accounts'
                '\nMake your copyright, trademark and intellectual property rights known'
                '\nLimit your liability'
                '\nDisclaim warranties'
                '\nDepending on the nature of your business, your ToS may also need clauses that cover:'
                '\n\nPayment terms'
                '\nSubscription information'
                '\nLicensing rights'
                '\nCustomer support'
                '\nUser-generated content',
          ),
        ],
      ),
    );
  }
}
