import 'package:flutter/material.dart';
import 'package:language_builder/language_builder.dart';
import 'package:mfecinternship/utils/theme.dart';

import '../../widget/widget_bigtext.dart';
import '../../widget/widget_dialog.dart';
import '../../widget/widget_textformfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _activeStepIndex = 0;
  String _selectedGender = '';
  bool _accepted = false;
  String _selectedLocation = 'Mobile Developper';
  DateTime? _selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameSurname = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController skill = TextEditingController();
  TextEditingController expect = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  String? imageUrl;
  final String _value = LanguageBuilder.texts!['register_term']['term_text'];
  // String _value =
  //     "ข้อ 1 คำนิยามภายในข้อกำหนดนี้(ก) แอปพลิเคชัน หมายความว่าแอปพลิเคชันชื่อว่า มะลิซ้อน TGIA x Farmfeed ซึ่งดำเนินการและให้บริการในลักษณะดังต่อไปนี้แอปพลิเคชันที่ช่วยเหลือเกษตรกรที่ประสบภัยพิบัติแต่ไม่ได้อยู่ในพื้นที่ที่ประกาศภัยพิบัติ(ข) เจ้าของแอปพลิเคชัน หมายความว่า บริษัท อินฟิวส์ จำกัด ทะเบียนนิติบุคคลเลขที่ 0105556133084 สำนักงานตั้งอยู่ที่ 41 ถนนแก้วเงินทองแขวงคลองชักพระเขตตลิ่งชันกรุงเทพมหานคร 10170(ค) ผู้ใช้งาน หมายความว่าผู้เยี่ยมชมผู้ใช้สมาชิกของแอปพลิเคชันหรือบุคคลอื่นใดที่เข้าถึงแอปพลิเคชันไม่ว่าการเยี่ยมชมการใช้การเป็นสมาชิกหรือการเข้าถึงนั้นจะกระทำด้วยวิธีใดลักษณะใดผ่านอุปกรณ์ใดผ่านช่องทางใดและไม่ว่ามีค่าใช้จ่ายหรือไม่ก็ตาม(ง) ข้อมูลส่วนบุคคล หมายความว่าข้อมูลใด ๆ ก็ตามไม่ว่าของผู้ใช้งานหรือบุคคลอื่นใดที่สามารถใช้ในการระบุตัวตนของบุคคลบุคคลนั้นได้ไม่ว่าทางตรงหรือทางอ้อม(จ) เนื้อหา หมายความว่าข้อความ บทความ ความคิดเห็น บทวิเคราะห์ รูปภาพ สัญลักษณ์ เครื่องหมาย รูปภาพประดิษฐ์ภาพถ่าย ภาพเคลื่อนไหว ภาพยนตร์ เสียง สิ่งบันทึกเสียง การออกแบบ คำสั่ง ชุดคำสั่ง หรือการสื่อสาร ไม่ว่าในลักษณะใดและวิธีใด ๆ ในแอปพลิเคชัน และไม่ว่าเนื้อหานั้นจะมีการจำกัดการเข้าถึงหรือไม่ก็ตาม";

  @override
  void dispose() {
    dateController.dispose();
    nameSurname.dispose();
    nickName.dispose();
    birthday.dispose();
    email.dispose();
    phone.dispose();
    skill.dispose();
    expect.dispose();
    password.dispose();
    confirm_password.dispose();
    super.dispose();
  }

  List<Step> stepList() {
    return [
      Step(
        title: _activeStepIndex != 0
            ? const Text('')
            : Text(
                LanguageBuilder.texts!['register_personal']['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        //Form Step 1 personal information
        content: formContentPersonal(),
        isActive: _activeStepIndex == 0,
      ),
      Step(
        title: _activeStepIndex != 1
            ? const Text('')
            : Text(
                LanguageBuilder.texts!['register_skill']['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        content: skillContent(),
        isActive: _activeStepIndex == 1,
      ),
      Step(
        title: _activeStepIndex != 2
            ? const Text('')
            : Text(
                LanguageBuilder.texts!['register_photo']['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        content: skillProfileUpload(),
        isActive: _activeStepIndex == 2,
      ),
      Step(
        title: _activeStepIndex != 3
            ? const Text('')
            : Text(
                LanguageBuilder.texts!['register_password']['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        content: Column(
          children: [
            TextFormFieldRegis(
                textController: password,
                labelText: LanguageBuilder.texts!['register_password']['password_field'],
                hintText: LanguageBuilder.texts!['register_password']['password_field_hint'],
                keyboardType: TextInputType.visiblePassword),
            const SizedBox(
              height: 20.0,
            ),
            TextFormFieldRegis(
                textController: confirm_password,
                labelText: LanguageBuilder.texts!['register_password']['re_password_field'],
                hintText: LanguageBuilder.texts!['register_password']['re_password_field_hint'],
                keyboardType: TextInputType.visiblePassword),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
          ],
        ),
        isActive: _activeStepIndex == 3,
      ),
      Step(
        title: _activeStepIndex != 4
            ? const Text('')
            : Text(
                LanguageBuilder.texts!['register_term']['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
        content: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                LanguageBuilder.texts!['register_term']['term_head'],
                style: AppTheme.h5Style,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              initialValue: _value,
              enabled: false,
              maxLines: 20,
              decoration: InputDecoration(
                labelText: LanguageBuilder.texts!['register_term']['term_field'],
                contentPadding: const EdgeInsets.all(16),
                border: const OutlineInputBorder(),
                floatingLabelBehavior:
                    FloatingLabelBehavior.always, // set always to show label
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _accepted,
                    onChanged: (value) {
                      setState(() {
                        _accepted = value!;
                      });
                    },
                  ),
                  Text(
                    LanguageBuilder.texts!['register_term']['agree_text'],
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        isActive: _activeStepIndex == 4,
      ),
    ];
  }

// Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3
  //===================================================================================================================================

  Column skillProfileUpload() {
    return Column(
      children: [
        Container(
          width: 320.0,
          height: 320.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'asset/images/login/real-photo.png',
                    width: 250.0,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 35.0,
                bottom: 0.0,
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      showImagePickerDialog(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Text(
            LanguageBuilder.texts!['register_photo']['photo_text'],
            style: AppTheme.h2Style,
          )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 5,
        ),
      ],
    );
  }

// Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3 Form Step 3
  //===================================================================================================================================

// Form Step 2 Form Step 2 Form Step 2 Form Step 2 Form Step 2 Form Step 2 Form Step 2 Form Step 2
  //===================================================================================================================================
  Column skillContent() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFormFieldRegis(
          textController: skill,
          labelText: LanguageBuilder.texts!['register_skill']['skill_field'],
          hintText: LanguageBuilder.texts!['register_skill']['skill_hint'],
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: DropdownButtonFormField(
              value: _selectedLocation,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: LanguageBuilder.texts!['register_skill']['position_field'],
              ),
              items: <String>[
                'Mobile Developper',
                'Fontend Developper',
                'Backend Developper',
                'DevOps'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {});
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormFieldRegis(
          textController: expect,
          labelText: LanguageBuilder.texts!['register_skill']['expecting_field'],
          hintText: LanguageBuilder.texts!['register_skill']['expecting_hint'],
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 200,
        ),
      ],
    );
  }

  // Form Step 2 Form Step 2 Form Step 2 Form Step 2 Form Step 2 Form Step 2 Form Step 2 Form Step 2
  //===================================================================================================================================

  //Form Step 1 personal information  //Form Step 1 personal information  //Form Step 1 personal information  //Form Step 1 personal information  //Form Step 1 personal information
  //=========================================================================================================================================================================

  Widget formContentPersonal() {
    return Column(
      children: [
        TextFormFieldRegis(
          textController: nameSurname,
          labelText: LanguageBuilder.texts!['register_personal']['fullname_field'],
          hintText: LanguageBuilder.texts!['register_personal']['fullname_hint'],
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormFieldRegis(
          textController: nickName,
          labelText: LanguageBuilder.texts!['register_personal']['nickname_field'],
          hintText: LanguageBuilder.texts!['register_personal']['nickname_hint'],
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),

        //select radio Gender
        selectedGender(),
        const SizedBox(
          height: 20,
        ),

        //select calendar
        birthDayFormField(),
        const SizedBox(
          height: 20,
        ),
        TextFormFieldRegis(
          textController: email,
          labelText: LanguageBuilder.texts!['register_personal']['email_field'],
          hintText: LanguageBuilder.texts!['register_personal']['email_hint'],
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormFieldRegis(
          textController: phone,
          labelText: LanguageBuilder.texts!['register_personal']['phone_field'],
          hintText: LanguageBuilder.texts!['register_personal']['phone_hint'],
          keyboardType: TextInputType.name,
        ),
      ],
    );
  }

  //Gender Widget
  Widget selectedGender() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: LanguageBuilder.texts!['register_personal']['gender_field'],
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const OutlineInputBorder(),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: 'ชาย',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value.toString();
                  });
                },
              ),
              Text(LanguageBuilder.texts!['register_personal']['gender_male']),
              Radio(
                value: 'หญิง',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value.toString();
                  });
                },
              ),
              Text(LanguageBuilder.texts!['register_personal']['gender_female']),
              Radio(
                value: 'อื่นๆ',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value.toString();
                  });
                },
              ),
              Text(LanguageBuilder.texts!['register_personal']['gender_other']),
            ],
          ),
        ),
      ),
    );
  }

  //Calender Widget
  Widget birthDayFormField() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: LanguageBuilder.texts!['register_personal']['birthdate_field'],
          hintText: LanguageBuilder.texts!['register_personal']['birthdate_hint'],
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today,
                color: AppTheme.buttonBackgroundColor),
            onPressed: () {
              selectDate(context);
            },
          ),
        ),
        controller: dateController,
        readOnly: true,
      ),
    );
  }

  //select Calender dd/mm/yyyy
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dateController.text =
            '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}';
      });
    }
  }

  //Form Step 1 personal information //Form Step 1 personal information //Form Step 1 personal information
  //=========================================================================================================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: BigText(text: LanguageBuilder.texts!['register_page']['appbar_register']),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            value: (_activeStepIndex + 1) / stepList().length,
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                colorScheme: const ColorScheme.light(
                  primary: AppTheme.buttonBackgroundColor,
                  onSurface: Colors.black, // set the inactive color
                ),
              ),
              child: Stepper(
                type: StepperType.horizontal,
                currentStep: _activeStepIndex,
                onStepTapped: (index) {
                  setState(() {
                    _activeStepIndex = index;
                  });
                },
                onStepContinue: () {
                  if (_activeStepIndex < stepList().length - 1) {
                    setState(() {
                      _activeStepIndex++;
                    });
                  } else {
                    // navigate to next page
                  }
                },
                onStepCancel: () {
                  if (_activeStepIndex > 0) {
                    setState(() {
                      _activeStepIndex--;
                    });
                  } else {}
                },
                steps: stepList(),
                controlsBuilder:
                    (BuildContext context, ControlsDetails controlsDetails) {
                  return Theme(
                    data: ThemeData(
                      colorScheme: const ColorScheme.light(
                        primary: AppTheme.buttonBackgroundColor,
                        // กำหนดสีไอคอนเมื่อเลือก (active)
                        onSurface: Colors
                            .black, // กำหนดสีไอคอนเมื่อไม่ได้เลือก (inactive)
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: _activeStepIndex > 0,
                          child: OutlinedButton(
                            onPressed: controlsDetails.onStepCancel,
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_back),
                                Text(LanguageBuilder.texts!['register_page']['back_page']),
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              primary: AppTheme.buttonBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              side: const BorderSide(
                                  color: AppTheme.buttonBackgroundColor),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _activeStepIndex < stepList().length,
                          child: _activeStepIndex == 4
                              ? OutlinedButton(
                                  onPressed: controlsDetails.onStepContinue,
                                  child: Row(
                                    children: [
                                      Text(
                                        LanguageBuilder.texts!['register_page']['confirm_button'],
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        AppTheme.buttonBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                )
                              : OutlinedButton(
                                  onPressed: controlsDetails.onStepContinue,
                                  child: Row(
                                    children: [
                                      Text(
                                        LanguageBuilder.texts!['register_page']['next_page'],
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        AppTheme.buttonBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
