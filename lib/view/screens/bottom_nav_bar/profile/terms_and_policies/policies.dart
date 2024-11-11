import 'package:e_learning_app/constants/app_sizes.dart';
import 'package:e_learning_app/view/widget/my_text_widget.dart';
import 'package:e_learning_app/view/widget/simple_app_bar_widget.dart';
import 'package:flutter/material.dart';

class Policies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Privacy Policy',
      ),
      body: ListView(
        shrinkWrap: true,
        padding:AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
              size: 12,
              text:
                  'Privacy Policies are required by law to be posted on your website. You may be required to include specific clauses in your Privacy Policy, depending on the applicable laws within your area or where you are conducting business.'
                  '\n\nIn fact, privacy laws are in place in many countries around the globe, including the following:'
                  '\n\nCanada\'s Personal Information Protection and Electronic Documents Act (PIPEDA)'
                  '\nThe California Online Privacy Protection Act (CalOPPA)'
                  '\nThe California Consumer Privacy Act (CCPA)'
                  '\nEurope\'s General Data Protection Regulation (GDPR)'
                  '\nAustralia\'s Privacy Act'
                  '\nThe UK\'s Data Protection Act'
                  '\nLoading...'
                  '\nThird Party Services Require a Privacy Policy'
                  '\n\nMany third-party services that you use to improve your website\'s user experience, monitor analytics, or display ads require you to post a Privacy Policy.'
                  '\n\nYou should provide clauses detailing how you use third-party services, APIs and SDKs.'
                  '\n\nJust some of the most popular third-party services, which require you to post a Privacy Policy are:'
                  '\nGoogle Analytics'
                  '\nGoogle AdSense'
                  '\nGoogle AdWords'
                  '\nAmazon Associates'
                  '\nClickBank'
                  '\nTwitter Lead Generation'
                  '\nFacebook Pages, Stores and Apps'
                  '\nGoogle Play Store'
                  '\nGoogle Play Store'
                  '\nApple\'s App Store'
                  '\n\nA few of the reasons these third-party services require you to post a Privacy Policy and disclose your usage of their cookies and services are due to the fact that they place cookies on your visitors\' computers. They also collect information about them whenever they visit your site, such as their browsing habits, the device used, and so on.'),
        ],
      ),
    );
  }
}
