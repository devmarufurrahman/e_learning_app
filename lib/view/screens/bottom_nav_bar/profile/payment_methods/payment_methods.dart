import 'package:e_learning_app/constants/app_colors.dart';
import 'package:e_learning_app/constants/app_fonts.dart';
import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/screens/bottom_nav_bar/profile/payment_methods/add_new_card.dart';
import 'package:e_learning_app/view/widget/credit_card_tiles_widget.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Map<String, dynamic>> dummyCards = [
  {
    'cardType': 'Apple Pay',
    'lastDigits': '',
    'expiry': '',
    'isDefault': true,
  },
  {
    'cardType': 'Visa',
    'lastDigits': '1234',
    'expiry': 'Expiry 06/2024',
    'isDefault': false,
  },
  {
    'cardType': 'Mastercard',
    'lastDigits': '1234',
    'expiry': 'Expiry 06/2024',
    'isDefault': false,
  },
];

class PaymentMethods extends StatefulWidget {
  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Payment Methods'),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
            text: 'Default Payment',
            size: 18,
            weight: FontWeight.w600,
            paddingBottom: 10,
          ),
          CreditCardsTiles(
            cardType: dummyCards[0]['cardType'],
            lastDigits: dummyCards[0]['lastDigits'],
            expiry: dummyCards[0]['expiry'],
            isDefault: dummyCards[0]['isDefault'],
            isSelected: selectedCardIndex == 2,
            onTap: () {
              setState(() {
                selectedCardIndex = 2;
              });
            },
            onEditTap: () {},
            onSetAsDefaultTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: 'Credit & Debit Card',
                size: 18,
                weight: FontWeight.w600,
              ),
              MyText(
                onTap: () => Get.to(() => AddNewCard()),
                text: 'Add new card',
                size: 14,
                color: kSecondaryColor,
                weight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              dummyCards.length - 1,
              (index) {
                var data = dummyCards[index + 1];
                return CreditCardsTiles(
                  cardType: data['cardType'],
                  lastDigits: data['lastDigits'],
                  expiry: data['expiry'],
                  isDefault: data['isDefault'],
                  isSelected: selectedCardIndex == index,
                  onTap: () {
                    setState(() {
                      selectedCardIndex = index;
                    });
                  },
                  onEditTap: () {},
                  onSetAsDefaultTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
