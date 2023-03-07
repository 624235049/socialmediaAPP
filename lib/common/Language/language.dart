// ignore_for_file: file_names

/* 
  - Edit profile can use register_personal
  - Term and condition detail can use in register page
  - 'year_diff' use for different calendar ex. CE-2022 BE-2565
  * Time text is not set here  
 */
class Languages {
  static Map<String, String> languages = {
    "en": """{
        "login": {
          "email_field": "Email",
          "password_field": "Password",
          "login_button": "Login",
          "title_not_registered": "No account?",
          "register_button": "Register"
        },
        "register_page": {
          "appbar_register": "Register",
          "next_page": "Next",
          "confirm_button": "Confirm",
          "back_page": "Back"
        },
        "register_personal": {
          "title": "Personal Detail",
          "fullname_field": "Fullname",
          "fullname_hint": "Fullname",
          "nickname_field": "Nickname",
          "nickname_hint": "Nickname",
          "gender_field": "Gender",
          "gender_male": "Male",
          "gender_female": "Female",
          "gender_other": "Other",
          "gender_other_input": "(Required)",
          "birthdate_field": "Birth date",
          "birthdate_hint": "dd/mm/yyyy",
          "email_field": "Email",
          "email_hint": "mail@mail.com",
          "phone_field": "Phone Number",
          "phone_hint": "0123456789",
          "position_field": "Position",
          "position_hint": "Choose position",
          "position_1": "#1",
          "position_2": "#2",
          "position_3": "#3",
          "university_field": "University",
          "university_hint": "Choose position",
          "university_1": "#1",
          "university_2": "#2",
          "university_3": "#3",
          "faculty_field": "Faculty",
          "faculty_hint": "Choose position",
          "faculty_1": "#1",
          "faculty_2": "#2",
          "faculty_3": "#3"
        },
        "register_skill": {
          "title": "Skills",
          "skill_field": "Current Skills",
          "skill_hint": "Skills",
          "position_field": "Position of internship",
          "position_hint": "Choose position to internship",
          "position_1": "#1",
          "position_2": "#2",
          "position_3": "#3",
          "expecting_field": "Expecting from internship",
          "expecting_hint": "Expecting..."
        },
        "register_photo": {
          "title": "Profile Photo",
          "photo_text": "Let's add photo to profile!"
        },
        "register_password": {
          "title": "Password",
          "password_field": "Password",
          "password_field_hint": "Password",
          "password_require_text": "Password should between 8 to 16 characters including lowercase, uppercase and number.",
          "re_password_field": "Retype Password",
          "re_password_field_hint": "Password"
        },
        "register_term": {
          "title": "Term and Condition",
          "term_head": "Save term for use and store and publish personal detail",
          "term_field": "Term and condition",
          "term_text": "Term Condition Term Condition Term Condition Term Condition Term Condition Term Condition",
          "agree_text": "I already read and understand about Term and Condition."
        },
        "home_drawer": {
          "home_page": "Home",
          "about_page": "About Company",
          "term_page": "Term and condition",
          "language_page": "Change language",
          "signout": "Logout"
        },
        "home_page": {
          "friend_title": "Friend",
          "friend_all": "See all",
          "post_more": "See more"
        },
        "post_page": {
          "like": "like",
          "comment": "comment",
          "no_comment": "No ",
          "send": "send",
          "comment_field": "comment",
          "reply": "Reply",
          "cancel": "Cancel",
          "post_title": "Posts",
          "post_suffix": "\'s"
        },
        "post_write_page": {
          "post_title": "Create post",
          "post_hint": "Share something.",
          "post_button": "Post",
          "post_choose_image": "Choose image",
          "post_image_add": "Add"
        },
        "friend_list": {
          "friend_title": "Colleague",
          "friend_search_hint": "Search colleague",
          "role_mentor": "Mentor",
          "role_intern": "Internship"
        },
        "profile": {
          "friend_profile_title": "Friend profile",
          "profile_title": "Profile",
          "personal_title": "Personal detail",
          "personal_fullname": "Fullname",
          "personal_gender": "Gender",
          "personal_birthdate": "Birthdate",
          "personal_age": "Age",
          "contact_title": "Contact",
          "contact_phone": "Phone number",
          "contact_email": "Email",
          "education_title": "Education",
          "education_university": "University",
          "education_faculty": "Faculty",
          "skill_title": "Skills",
          "expecting_title": "Expecting from internship",
          "mentor_title": "Mentor",
          "mentor_hint": "Mentor's name has not been entered",
          "edit_button": "Edit profile"
        },
        "edit_profile": {
          "mentor_title": "Mentor",
          "mentor_hint": "Mentor's name",
          "save_button": "Save",
          "image_camera": "Open camera",
          "image_choose": "Choose image"
        },
        "about_page": {
          "about_title": "About Company",
          "history_title": "History and Background of Company",
          "history_detail": "History and Background of Company detail",
          "vision_title": "Organization Vision and Mission",
          "vision_detail_1_title": "\u2022 vision detail 1 title",
          "vision_detail_1": "vision detail 1 text",
          "vision_detail_2_title": "\u2022 vision detail 2 title",
          "vision_detail_2": "vision detail 2 text"
        },
        "term_page": {
          "term_title": "Term and condition"
        },
        "language_page": {
          "language_title": "Languages Setting"
        },
        "logout_dialog": {
          "logout_title": "Logout",
          "logout_text": "Do you want to logout?",
          "confirm": "Logout",
          "cancel": "Cancel"
        },
        "time_stamp": {
          "just_now": "Just now",
          "second": "second",
          "minute": "minute",
          "hour": "hour",
          "day": "day",
          "ago": " ago",
          "suffix": "s",
          "year_diff": "0",
          "default_month": "[month]"
        },
        "month": {
          "jan": "January",
          "feb": "Febuary",
          "mar": "March",
          "apr": "April",
          "may": "May",
          "jun": "June",
          "jul": "July",
          "aug": "August",
          "sep": "September",
          "oct": "October",
          "nov": "November",
          "dec": "December"
        },
        "month_less": {
          "jan": "Jan",
          "feb": "Feb",
          "mar": "Mar",
          "apr": "Apr",
          "may": "May",
          "jun": "Jun",
          "jul": "Jul",
          "aug": "Aug",
          "sep": "Sep",
          "oct": "Oct",
          "nov": "Nov",
          "dec": "Dec"
        }
    }""",
    "th": """{
        "login": {
          "email_field": "อีเมล์",
          "password_field": "รหัสผ่าน",
          "login_button": "เข้าสู่ระบบ",
          "title_not_registered": "ยังไม่ได้ลงทะเบียนใช่ไหม?",
          "register_button": "สมัครสมาชิก"
        },
        "register_page": {
          "appbar_register": "สมัครสมาชิก",
          "next_page": "หน้าต่อไป",
          "confirm_button": "ยืนยัน",
          "back_page": "ย้อนกลับ"
        },
        "register_personal": {
          "title": "ข้อมูลส่วนตัว",
          "fullname_field": "ชื่อ - นามสกุล",
          "fullname_hint": "ชื่อ - นามสกุล",
          "nickname_field": "ชื่อเล่น",
          "nickname_hint": "ชื่อเล่น",
          "gender_field": "เพศ",
          "gender_male": "ชาย",
          "gender_female": "หญิง",
          "gender_other": "อื่นๆ",
          "gender_other_input": "(โปรดระบุ)",
          "birthdate_field": "วันเกิด",
          "birthdate_hint": "วว/ดด/ปปปป",
          "email_field": "อีเมล์",
          "email_hint": "mail@mail.com",
          "phone_field": "เบอร์โทรศัพท์",
          "phone_hint": "0123456789",
          "position_field": "ตำแหน่ง",
          "position_hint": "เลือกตำแหน่ง",
          "position_1": "#1",
          "position_2": "#2",
          "position_3": "#3",
          "university_field": "มหาวิทยาลัย",
          "university_hint": "เลือกมหาวิทยาลััย",
          "university_1": "#1",
          "university_2": "#2",
          "university_3": "#3",
          "faculty_field": "คณะ",
          "faculty_hint": "เลือกคณะ",
          "faculty_1": "#1",
          "faculty_2": "#2",
          "faculty_3": "#3"
        },
        "register_skill": {
          "title": "ทักษะ",
          "skill_field": "ทักษะที่มี",
          "skill_hint": "ทักษะ",
          "position_field": "ตำแหน่งที่ต้องการฝึก",
          "position_hint": "เลือกตำแหน่งที่ต้องการฝึก",
          "position_1": "#1",
          "position_2": "#2",
          "position_3": "#3",
          "expecting_field": "สิ่งที่คาดหวังจากการฝึกงาน",
          "expecting_hint": "คาดหวัง..."
        },
        "register_photo": {
          "title": "อัปโหลดรูปโปรไฟล์",
          "photo_text": "เพิ่มรูปโปรไฟล์กันเถอะ"
        },
        "register_password": {
          "title": "ตั้งค่ารหัสผ่าน",
          "password_field": "รหัสผ่าน",
          "password_field_hint": "กรอกรหัสผ่าน",
          "password_require_text": "รหัสผ่านจะต้องประกอบด้วย 8-16 ตัวอักษรทั้งพิมพ์เล็ก, พิมพ์ใหญ่, และตัวเลข",
          "re_password_field": "ยืนยันรหัสผ่าน",
          "re_password_field_hint": "กรอกรหัสผ่านอีกครั้ง"
        },
        "register_term": {
          "title": "เงื่อนไขและข้อตกลง",
          "term_head": "บันทึกการยินยอมให้เก็บ-ใช้ และเปิดเผยข้อมูลส่วนบุคคล",
          "term_field": "เงื่อนไขและข้อตกลง",
          "term_text": "ตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลงตัวอย่างเงื่อนไขและข้อตกลง",
          "agree_text": "ข้าพเจ้าได้อ่านและเข้าใจข้อความในบันทึกการยินยอมแล้ว"
        },
        "home_drawer": {
          "home_page": "หน้าหลัก",
          "about_page": "เกี่ยวกับ บริษัท",
          "term_page": "เงื่อนไขและข้อตกลง",
          "language_page": "เปลี่ยนภาษา",
          "signout": "ออกจากระบบ"
        },
        "home_page": {
          "friend_title": "เพื่อน",
          "friend_all": "ดูทั้งหมด",
          "post_more": "ดูเพิ่มเติม"
        },
        "post_page": {
          "like": "ถูกใจ",
          "comment": "ความคิดเห็น",
          "no_comment": "ไม่มี",
          "send": "ส่ง",
          "comment_field": "แสดงความคิดเห็น",
          "reply": "ตอบกลับ",
          "cancel": "ยกเลิก",
          "post_title": "โพสต์",
          "post_suffix": ""
        },
        "post_write_page": {
          "post_title": "เขียนโพสต์",
          "post_hint": "แบ่งปันอะไรบางอย่าง",
          "post_button": "โพสต์",
          "post_choose_image": "เลือกรูปภาพ",
          "post_image_add": "เพิ่ม"
        },
        "friend_list": {
          "friend_title": "เพื่อนร่วมงาน",
          "friend_search_hint": "ค้นหาเพื่อนร่วมงาน",
          "role_mentor": "พี่เลี้ยง",
          "role_intern": "น้องฝึกงาน"
        },
        "profile": {
          "friend_profile_title": "โปรไฟล์เพื่อน",
          "profile_title": "โปรไฟล์",
          "personal_title": "ข้อมูลส่วนตัว",
          "personal_fullname": "ชื่อ - นามสกุล",
          "personal_gender": "เพศ",
          "personal_birthdate": "วันเกิด",
          "personal_age": "อายุ",
          "contact_title": "ข้อมูลการติดต่อ",
          "contact_phone": "เบอร์โทร",
          "contact_email": "อีเมลล์",
          "education_title": "ข้อมูลการศึกษา",
          "education_university": "มหาวิทยาลัย",
          "education_faculty": "คณะ",
          "skill_title": "ทักษะ",
          "expecting_title": "สิ่งที่คาดหวังจากการฝึกงาน",
          "mentor_title": "พี่เลี้ยง",
          "mentor_hint": "ยังไม่ได้ใส่ชื่อพี่เลี้ยง",
          "edit_button": "แก้ไขโปรไฟล์"
        },
        "edit_profile": {
          "mentor_title": "พี่เลี้ยง",
          "mentor_hint": "กรอกชื่อพี่เลี้ยง",
          "save_button": "บันทึก",
          "image_camera": "เปิดกล้อง",
          "image_choose": "เลือกรูป"
        },
        "about_page": {
          "about_title": "เกี่ยวกับ บริษัท",
          "history_title": "ประวัติและความเป็นมาของ บริษัท",
          "history_detail": "รายละเอียดประวัติและความเป็นมาของ บริษัท",
          "vision_title": "วิสัยทัศน์องค์กรและพันธกิจ",
          "vision_detail_1_title": "\u2022 vision detail 1 title",
          "vision_detail_1": "vision detail 1 text",
          "vision_detail_2_title": "\u2022 vision detail 2 title",
          "vision_detail_2": "vision detail 2 text"
        },
        "term_page": {
          "term_title": "เงื่อนไขและข้อตกลง"
        },
        "language_page": {
          "language_title": "เปลี่ยนภาษา"
        },
        "logout_dialog": {
          "logout_title": "ออกจากระบบ",
          "logout_text": "ต้องการออกจากระบบใช่ไหม",
          "confirm": "ออกจากระบบ",
          "cancel": "ยกเลิก"
        },
        "time_stamp": {
          "just_now": "ตอนนี้",
          "second": "วินาที",
          "minute": "นาที",
          "hour": "ชั่วโมง",
          "day": "วัน",
          "ago": "ที่แล้ว",
          "suffix": "",
          "year_diff": "543",
          "default_month": "[เดือน]"
        },
        "month": {
          "jan": "มกราคม",
          "feb": "กุมพาพันธ์",
          "mar": "มีนาคม",
          "apr": "เมษายน",
          "may": "พฤษภาคม",
          "jun": "มิถุยายน",
          "jul": "กรกฎาคม",
          "aug": "สิงหาคม",
          "sep": "กันยายน",
          "oct": "ตุลาคม",
          "nov": "พฤศจิกายน",
          "dec": "ธันวาคม"
        },
        "month_less": {
          "jan": "ม.ก.",
          "feb": "ก.พ.",
          "mar": "มี.ค.",
          "apr": "เม.ย.",
          "may": "พ.ค.",
          "jun": "มิ.ย.",
          "jul": "ก.ค.",
          "aug": "ส.ค.",
          "sep": "ก.ย.",
          "oct": "ต.ค.",
          "nov": "พ.ย.",
          "dec": "ธ.ค."
        }
    }"""
  };
}
