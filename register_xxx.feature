Feature: Register xxx.com
    As a user
    I want to have a account xxx.com
    So i can register on xxx.com phone nummber

Scenario: xxx.com Landing Page
    Given a web browser
    When i go to xxx.com website
    Then Greeting text "WELCOME" should visible
    And Only One label input text "สมัครสมาชิก/เข้าสู่ระบบ" should visible
    And Only One input field with placeholder "เบอร์โทรศัพท์" should visible
    And Only One button text "ถัดไป" should visible

Scenario: Request OTP With Duplicated Phone Number
    Given a web browser is on the xxx.com page, phone number 0123456789 have registered already
    When i submit phone number with 0123456789
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