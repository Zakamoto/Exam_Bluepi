Feature: Register xxx.com
    As a user
    I want to have an account on website xxx.com
    So i register on xxx.com via phone nummber

Scenario: xxx.com Landing Page
    Given a web browser
    When i go to xxx.com website
    Then Greeting text "WELCOME" should visible
    And Only One label input text "สมัครสมาชิก/เข้าสู่ระบบ" should visible
    And Only One input field with placeholder "เบอร์โทรศัพท์" should visible
    And Only One button text "ถัดไป" should visible

Scenario: Request OTP With Duplicated Phone Number
    Given a web browser is on the xxx.com page, phone number 0123456789 have registered already
    When i click button submit phone number with 0123456789
    Then popup warning "Can't register please try again" should visible

Scenario: Request OTP With Text
    Given a web browser is on the xxx.com page
    When i input phone number with ABCD
    Then Input should not have any value

Scenario: Request OTP With Invalid Phone Number Format
    Given a web browser is on the xxx.com page
    When typing 1234567891 to input register field
    Then Input should have value 1234567891
    And warning text "Invalid Phone Number Format Phone Number Format Must Be 0xxxxxxxxx" should visible

Scenario: Request OTP With Phone Number More Than 10 Numbers
    Given a web browser is on the xxx.com page
    When i input phone number with 12345678901
    Then Input phone number should have 1234567890

Scenario: Request OTP With Phone Number Less Than 10 Numbers
    Given a web browser is on the xxx.com page
    When i input phone number with 012345678
    Then Input should have value 012345678
    And warning text "Invalid Phone Number Format Phone Number Format Must Be 0xxxxxxxxx" should visible

Scenario: Request OTP With No Input Value
    Given a web browser is on the xxx.com page
    When i register without input any value on input field
    Then Input should not have any value
    And warning text "Please input only number" should visible

Scenario: Request OTP Success
    Given request OTP on the xxx.com page with phone number 0234567891
    When i submit valid phone number with 0234567891
    Then at mobile phone number 0234567891 should have new SMS OTP 6 charecters
    And link text "ย้อนกลับ" should visible
    And bullet text should visible
    '''
        สมาชิกใหม่
    โปรดกรอกรหัส OTP 6 หลักที่ได้รับทาง SMS
        เพื่อยืนยันตัวตนค่ะ
    '''
    And input without any value should visible
    And link text "ฉันไม่ได้รับ SMS ส่งให้ฉันอีกครั้ง" should visible

Scenario: Request New OTP Via SMS
    Given a page submit OTP from phone number 0234567891
    When i request new SMS OTP to phone number that i have submited 
    Then at mobile phone number 0234567891 should have new SMS OTP 6 charecters
    And i should stil on submit OTP page

Scenario: Submit Invalid OTP
    Given a page submit OTP from phone number 0234567891 and SMS OTP
    When i input 6 charecters different with OTP that i recieved
    Then popup warning "Invalid OTP" should visible
    And i should stil on submit OTP page

Scenario: Submit Valid OTP
    Given a page submit OTP from phone number 0234567891
    And i have SMS OTP
    When i input OTP that i recieved from SMS
    Then i should redirect to register account detail page
    And link text "ย้อนกลับ" should visible
    And text "ข้อมูลส่วนตัว" should visible
    And input placeholder "เลขบัตรประชาชน" should visible
    And input placeholder "เลขหลังบัตรประชาชน" should visible
    And input placeholder "ชื่อ-นามสกุล (ไทย)" should visible
    And input placeholder "วันเดือดปีเกิด ตัวอย่าง(31/12/2530)" should visible
    And bullet text should visible
    '''
        ข้อมูลนี้ใช้สำหรับทำรายการทางการเงิน
    ถ้าข้อมูลไม่ตรงตามความเป็นจริง จะไม่สามารถทำรายได้
    '''
    And active radio page should be 2 of 4

Scenario: Register Account Detail Not Success Field Require เลขบัตรประชาชน
    Given a register account detail page
    And i have input "เลขหลังบัตรประชาชน" with "XY9-99999999-99"
    And i have input "ชื่อ-นามสกุล (ไทย)" with "ทดสอบชื่อ ทดสอบนามสกุล"
    And i have input "วันเดือดปีเกิด ตัวอย่าง(31/12/2530)" with "31/12/2530"

    When i click button submit

    Then popup warning "Please Input Data To Every Input Field" should visible
    And button close pop up warning should visible
    And active radio page should be 2 of 4

Scenario: Register Account Detail Not Success Field Require เลขหลังบัตรประชาชน
    Given a register account detail page
    And i have input "เลขบัตรประชาชน" with "1234567890123"
    And i have input "ชื่อ-นามสกุล (ไทย)" with "ทดสอบชื่อ ทดสอบนามสกุล"
    And i have input "วันเดือดปีเกิด ตัวอย่าง(31/12/2530)" with "31/12/2530"

    When i click button submit

    Then popup warning "Please Input Data To Every Input Field" should visible
    And button close pop up warning should visible
    And active radio page should be 2 of 4

Scenario: Register Account Detail Not Success Field Require ชื่อ-นามสกุล
    Given a register account detail page
    And i have input "เลขบัตรประชาชน" with "1234567890123"
    And i have input "เลขหลังบัตรประชาชน" with "XY9-99999999-99"
    And i have input "วันเดือดปีเกิด ตัวอย่าง(31/12/2530)" with "31/12/2530"

    When i click button submit

    Then popup warning "Please Input Data To Every Input Field" should visible
    And button close pop up warning should visible
    And active radio page should be 2 of 4

Scenario: Register Account Detail Success วันเดือดปีเกิด
    Given a register account detail page
    And i have input "เลขบัตรประชาชน" with "1234567890123"
    And i have input "เลขหลังบัตรประชาชน" with "XY9-99999999-99"
    And i have input "ชื่อ-นามสกุล (ไทย)" with "ทดสอบชื่อ ทดสอบนามสกุล"

    When i click button submit

    Then popup warning "Please Input Data To Every Input Field" should visible
    And button close pop up warning should visible
    And active radio page should be 2 of 4

Scenario: Register Account Detail Success
    Given a register account detail page
    And i have input "เลขบัตรประชาชน" with "1234567890123"
    And i have input "เลขหลังบัตรประชาชน" with "XY9-99999999-99"
    And i have input "ชื่อ-นามสกุล (ไทย)" with "ทดสอบชื่อ ทดสอบนามสกุล"
    And i have input "วันเดือดปีเกิด ตัวอย่าง(31/12/2530)" with "31/12/2530"

    When i click button submit

    Then link text "ย้อนกลับ" should visible
    And text "บัญชีธนาคาร" should visible
    And icon bank list should visible
    And active radio page should be 3 of 4

Scenario: Register Select Bank Page With SCB
    Given i'm on bank selection page

    When i select SCB icon

    Then link text "ย้อนกลับ" should visible
    And text "บัญชีธนาคาร" should visible
    And input with text "ธนาคาร ไทยพาณิชย์" should visible
    And icon "x" after bank name "ธนาคาร ไทยพาณิชย์" should visible
    And input placeholder "ชื่อบัญชี (ภาษาอังกฤษ)" should visible
    And input placeholder "เลขที่บัญชี" should visible
    And bullet text should visible
    '''
        ข้อมูลนี้ใช้สำหรับทำรายการทางการเงิน
    ถ้าข้อมูลไม่ตรงตามความเป็นจริง จะไม่สามารถทำรายได้
    '''
    And active radio page should be 3 of 4

Scenario: Icon X Bank Name On Bank Account Detail Page 
    Given i'm on bank account detail page
    And input value bank name selected is "ธนาคาร ไทยพาณิชย์"
    And input field "ชื่อบัญชี (ภาษาอังกฤษ)" have value "firstnameTest lastnameTest"
    And input field "เลขที่บัญชี" have value "301-1-52815-2"
    
    When i click icon "x" after bank name "ธนาคาร ไทยพาณิชย์"

    Then input value bank name selected should have no value
    And i click icon "x" after bank name should not visible
    And input field "ชื่อบัญชี (ภาษาอังกฤษ)" should have value "firstnameTest lastnameTest"
    And input field "เลขที่บัญชี" should have value "301-1-52815-2"
    And bullet text should visible
    '''
        ข้อมูลนี้ใช้สำหรับทำรายการทางการเงิน
    ถ้าข้อมูลไม่ตรงตามความเป็นจริง จะไม่สามารถทำรายได้
    '''
    And active radio page should be 3 of 4
