import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/widget/my_button_widget.dart';
import 'package:e_learning_app/view/widget/my_text_field.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';

class AddNewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Add new card',
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: AppSizes.DEFAULT,
        children: [
          MyTextField(
            labelText: 'Card name',
          ),
          MyTextField(
            labelText: 'Card number',
            keyboardType: TextInputType.phone,
            maxLength: 15,
          ),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  labelText: 'MM/YY',
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: MyTextField(
                  labelText: 'CVC',
                  maxLength: 3,
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
          MyButton(
            onTap: () {},
            buttonText: 'Save',
          ),
        ],
      ),
    );
  }
}
