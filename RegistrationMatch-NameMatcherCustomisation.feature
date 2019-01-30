@demoAU
Feature: ASB Registration Match Notification Test

  Scenario: Make sure the account is in stubs mode
    Given I logged in to the admin panel for "demoapp-au-simpleonboard" using default details
    Then click the interactable with the text "change this"
    Then Waiting for "2" seconds
    Then attempt to click the interactable with the text "Enable stubs mode"
    Then Waiting for "2" seconds

  Scenario: Create basic returningUser registration for demoapp-au-simpleonboard
    Given I have registered a verification for mobile with the following details:
      | accountId                             | demoapp-au-simpleonboard |
      | webServicePassword                    | password                 |
      | verificationId                        |                          |
      | ruleId                                | default                  |
      | Given name                            | S AM                     |
      | Middle name                           | SAMI                     |
      | Surname                               | SA\'MPLE                 |
      | DoB day                               |                       26 |
      | DoB month                             |                       03 |
      | DoB year                              |                     1992 |
      | streetNumber                          |                      100 |
      | streetName                            | Hobson                   |
      | streetType                            | CCT                      |
      | city                                  | Wellington               |
      | postcode                              |                     6012 |
      | suburb                                | thorndon                 |
      | country                               | AU                       |
      | extra_generateMobileReturningUserCode | true                     |
      | extra_business_unit                   | domestic                 |
    Then I call the url to get the return user code
    Then I go to mobile start page
    Then I fill the field with ID "customerCodeInput" for the value "stag-pine-link-vibe"
    Then I press the button with the text "Load Config"
    Then Waiting for "2" seconds
    Then I fill the return user code I got from previous step
    Then Waiting for "5" seconds
    Then I press the button with the text "Start Test"
    Then Waiting for "5" seconds
    Then I press the button with the text "ACT driver's licence"
    Then Waiting for "2" seconds
    Then I press the button with the text "GO"
    Then Waiting for "2" seconds
    Then I download the sample "NZ-DL-front.png" card from TestImageService
    Then I press the upload button with the id "frontInput" and choose file "NZ-DL-front.png"
    Then Waiting for "2" seconds
    Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
    Then Waiting for "5" seconds
    Then I press the button with the text "GO"
    Then Waiting for "2" seconds
    Then I download the sample "NZ-DL-front.png" card from TestImageService
    Then I press the upload button with the id "backInput" and choose file "NZ-DL-front.png"
    Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
    Then Waiting for "30" seconds
    Then I press the button with the text "Skip the instructions >>"
    Then Waiting for "2" seconds
    Then I download the sample "SELFIE-RK.png" card from TestImageService
    Then I press the upload button with the id "selfieInput" and choose file "SELFIE-RK.png"
    Then Waiting for "5" seconds
    Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
    Then Waiting for "20" seconds
    Then I should see the label texts as following:
      | documentNumber          | DRIVER'S LICENCE NUMBER     |
      | givenName               | FIRST NAME                  |
      | middleNames             | MIDDLE NAME(S)              |
      | surname                 | SURNAME                     |
      | dob                     | DATE OF BIRTH (DD/MM/YYYY)  |
    Then I should see the input fields with the values as following:
      | documentNumber | DL123456   |
      | givenName      | SAM        |
      | middleNames    | SAMI       |
      | surname        | SAMPLE     |
      | dob            | 26/03/1992 |
    Then I update the input fields with the values as following:
      | documentNumber | 11111111 |
    Then I tick the tickbox with the css className "greenid-so-content-agree-label control-label"
    Then I press the button with the text "Continue"
    Then Waiting for "15" seconds
    #=======Failed registration ======#
    Then I should find text "Your details didn't match" in "h1"
    Then I should find text "We couldn't verify you using the data you submitted from your driver licence" in "div"
    Then I should find bold text "we need you to try again"
    Then I press the button with the text "Complete later"
    Then Waiting for "2" seconds
    Then I press the button with the text "Yes, quit now"
    Then Waiting for "2" seconds

  Scenario: Check that a notifiation is sent for asb when the Registration Match component changes state
    Given I logged in to the admin panel for "demoapp-au-simpleonboard" using default details
    Then I press the "search-form:search-button" button
    Then I press the link for the latest registration and then wait for "overall"
    Then I should see "1" combo source in "FAILED" state
    And The combo source in "FAILED" state should have the following sub components:
      | Registration Match | VERIFIED |
