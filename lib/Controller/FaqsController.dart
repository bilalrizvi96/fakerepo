import 'package:get/get.dart';

import '../Model/FaqsModel.dart';

class FaqsController extends GetxController {
  var faqlist = [].obs;
  var subfaqlist = [].obs;

  @override
  void onInit() {
    super.onInit();
    List<FaqsModel> faq = <FaqsModel>[
      FaqsModel(
        id: 0,
        title: 'My Account',
        subcat: [
          Faqsubcat(
            title: 'I want to update my information',
            id: 0,
            is_textbox: false,
            subsubcat: [
              Faqsubsubcat(
                  title: 'Phone number',
                  id: 0,
                  subString: 'Please contact your regional HR for this action',
                  is_textbox: false),
              Faqsubsubcat(
                  title: 'Email address',
                  id: 1,
                  subString: 'Please contact your regional HR for this action',
                  is_textbox: false),
              Faqsubsubcat(
                  title: 'Job timings and off days',
                  id: 2,
                  subString: 'Please contact your regional HR for this action',
                  is_textbox: false),
            ],
          ),
          Faqsubcat(
            title: 'SMS verification not received',
            id: 1,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(title: '', id: 0, subString: '', is_textbox: false),
            ],
          ),
          Faqsubcat(
            title: 'I am having trouble in registration',
            id: 2,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(title: '', id: 0, subString: '', is_textbox: false),
            ],
          ),
          Faqsubcat(
            title: 'I cannot login into application',
            id: 3,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(title: '', id: 0, subString: '', is_textbox: false),
            ],
          ),
        ],
      ),
      FaqsModel(
        id: 1,
        title: 'Safety Concerns',
        subcat: [
          Faqsubcat(
            title: 'I think someone is using my account',
            id: 0,
            is_textbox: false,
            subsubcat: [
              Faqsubsubcat(
                  title:
                      'Don’t worry we never public your identity or personal information. We have applied state-of-the-art authentication in this application so no one can use your account.',
                  id: 0,
                  subString: ''),
            ],
          ),
          Faqsubcat(
            title: 'Why do you capture my face on login and registration',
            id: 1,
            is_textbox: false,
            subsubcat: [
              Faqsubsubcat(
                  title:
                      'This is required to genuinely verify that it is only you who is using the account on the provided employee code.',
                  id: 0,
                  subString: ''),
            ],
          ),
        ],
      ),
      FaqsModel(
        id: 2,
        title: 'Attendance ',
        subcat: [
          Faqsubcat(
            title: 'I am having trouble in marking attendance',
            id: 0,
            is_textbox: false,
            subsubcat: [
              Faqsubsubcat(
                  title: 'I can’t clock-in',
                  id: 0,
                  subString: '',
                  is_textbox: true),
              Faqsubsubcat(
                  title: 'I can’t clock-out',
                  id: 1,
                  subString: '',
                  is_textbox: true),
            ],
          ),
          Faqsubcat(
            title: 'My Attendance summary is not correct',
            id: 1,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(title: ' ', id: 0, subString: ''),
            ],
          ),
          Faqsubcat(
            title: 'I forgot to clock-out yesterday',
            id: 2,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(
                  title:
                      'Please tap on CLOCK-OUT on the dashboard screen and mark your last day attendance',
                  id: 0,
                  subString: ''),
            ],
          ),
          Faqsubcat(
            title: 'I cannot login into application',
            id: 3,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(title: '', id: 0, subString: ''),
            ],
          ),
        ],
      ),
      FaqsModel(
        id: 3,
        title: 'Points and Rewards',
        subcat: [
          Faqsubcat(
            title: 'I did not receive my points',
            id: 0,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(title: '', id: 0, is_textbox: true, subString: ''),
            ],
          ),
          Faqsubcat(
            title: 'Redeeming points',
            id: 1,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(
                  title: 'This feature will be rolled out in future ',
                  id: 0,
                  subString: '',
                  is_textbox: false),
            ],
          ),
          Faqsubcat(
            title: 'I am having trouble in registration',
            id: 2,
            is_textbox: true,
            subsubcat: [
              Faqsubsubcat(title: '', id: 0, subString: ''),
            ],
          ),
        ],
      ),
    ];
    faqlist.value = faq;
  }

  expandedUpdate(index) {
    faqlist.value[index].subcat[0].expanded =
        !faqlist.value[index].subcat[0].expanded;
    update();
  }
}
