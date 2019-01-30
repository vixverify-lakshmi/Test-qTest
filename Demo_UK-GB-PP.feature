@Stag1 @demoUK
Feature: staging Demo UK  Registration - Valid PASSPORT - Jonathan Face
	#@MobileSmokeTest
    Scenario: Create a registration for demoapp-uk-simpleonboard using PASSPORT
 		Then I go to mobile start page
		Then I fill the field with ID "customerCodeInput" for the value "stag-beth-lathe-fungus"
		Then I press the button with the text "Load Config"
		Then Waiting for "2" seconds
		Then I press the button with the text "Start Test"
		Then Waiting for "2" seconds
		Then I press the button with the text "Get started"
		Then Waiting for "2" seconds
		Then I press the button with the text "PASSPORT"
		Then Waiting for "2" seconds
		Then I press the button with the text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "UK-PASSPORT.png" card from TestImageService
		Then I press the upload button with the id "frontInput" and choose file "UK-PASSPORT.png"
		Then Waiting for "2" seconds
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "30" seconds
		Then I press the button with the text "Skip the instructions >>"
		Then Waiting for "2" seconds
		Then I download the sample "SELFIE-RK.png" card from TestImageService
		Then I press the upload button with the id "selfieInput" and choose file "SELFIE-RK.png"
		#Then I press the upload button with the id "selfieInput" and choose file "Jonathan-face.png"
		Then Waiting for "2" seconds
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "10" seconds
		Then I should see the label texts as following:
		| 	documentNumber	| 	Passport number |
		|documentExpiryDate |   Date of expiry (DD/MM/YYYY)   |
		|documentGender     |   Gender          |    
		| 	givenName		|	First name		|
		| 	middleNames		|	Middle name(s)	|
		| 	surname			|	Surname			|
		| 	dob				|	DATE OF BIRTH (DD/MM/YYYY)	|
		Then I should see the input fields with the values as following:
		| 	documentNumber	| 	210010854		|
		|documentExpiryDate |  	03/10/2019      |
		|documentGender     | 	M             	|    
		| 	givenName		|	JONATHAN 		|
		| 	middleNames		|	NEIL CAMPBELL	|
		| 	surname			|	JENSEN			|
		| 	dob				|	16/12/1961		|
		Then I press the button with the text "Confirm"
		Then Waiting for "5" seconds
		Then I should see the label texts as following:
		| flatNumber   | Flat number   |
		| propertyName | Building Name |
		| streetNumber | Street number |
		| streetName   | Street name   |
		| townCity     | Town          |
		| postcode     | Postcode      |
		Then I update the input fields with the values as following:
		| flatNumber   | 10            |
		| propertyName | TEST Building |
		| streetNumber | 12            |
		| streetName   | Main Road     |
		| townCity     | Oxted         |
		| postcode     | rh8 0an       |
		Then I press the button with the text "Continue"		
		Then Waiting for "10" seconds
		Then I press the link with text "Go to next screen"
		Then Waiting for "2" seconds
		#=======Verification is being reviewed ====#
		#Then I should find text "Your details didn't match" in "h1"
		Then I should find text "We couldn't verify you using the data you submitted from your passport" in "div"
		Then I should find bold text "we need you to try again"
		Then I press the button with the text "Complete later"
		
	#@MobileSmokeTest	
	Scenario: demo UK - Jonathans PASSPORT - Verified state
		Given I logged in to the admin panel for "demoapp-uk-simpleonboard" using default details
		Then I press the "search-form:search-button" button
		#Then I press the link for the registration with userID "LswHf5fu"
		Then I press the link for the latest registration and then wait for "overall"
		Then I should see "1" combo source in "FAILED" state
		And The combo source in "FAILED" state should have the following sub components:
		| 	Authenticity 	|	VERIFIED		|
		| 	Data Extraction |	VERIFIED		|
		| 	Registration Match 	|	VERIFIED	|
		| 	Face Comparison |	FAILED		    |
		#================ Authenticity =======================#
		Then I press "Authenticity" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "appears to be authentic"
		Then The Authenticity sub component should have a button with the text "View this verified component" and press it
        Then Waiting for "20" seconds
		Then I should find the modal is in "VERIFIED" state
		Then I should find bold text "appears to be authentic" on the modal
		Then I should see the div with id "authenticity-content1-preview" on the modal having the following information:
		| Image | 	slow-load-authenticity-1	|
		| Text1	|	Passport (front)	|
		| Text2	| 	Auto capture	|
		| Link	| 	Download image	|
		Then I press the modal close button
		#================ Data Extraction =======================
		Then I press "Data Extraction" sub component link of this combo source
		Then Waiting for "20" seconds
		Then I should find bold text "correctly automatically extracted"
		Then I should find text "Passport" in "strong" "3" times
		Then The sub component should have a list with cucumber attribute value "data-extraction" showing the verified fields:
		| 	FIRST NAME	|
		| 	SURNAME		|
		|	D.O.B.		|
		|   DOCUMENT NUMBER	|
		Then I press the button with the text "Show additional extracted data"
		#Then I should see data extraction change table with following information:
		#| MIDDLE NAME 		| 	ADDRESS                | DOCUMENT EXPIRY DATE	|
		#| NEIL CAMPBELL    | 	10 12 Main Road rh8 0an| 03/10/2019	            |
		Then Waiting for "3" seconds	
		Then I press the button with the text "Hide additional extracted data"
		Then The data extraction sub component should have a button with the text "View this verified component" and press it
		Then Waiting for "20" seconds
		Then I should find the modal is in "VERIFIED" state
		Then I should find bold text "correctly automatically extracted" on the modal
		Then I should see the div with id "accept-reject-content1-preview" on the modal having the following information:
		| Image | 	slow-load-id-1	|
		| Text	|	Passport (front)	|
		| Link	| 	Download image	|
		Then I should see table with css class "bodytable document-actions-extracted-details VERIFIED contributing-data no-changed-data" on the modal having the following information:
		| First name:       | JONATHAN	    |
		| Surname:	        | JENSEN	    |
		| Date of Birth:	| 	16/12/1961	|
		| Document number:	| 	 210010854  |
		Then I press the button with the text "Show additional extracted data" on the modal
		Then Waiting for "10" seconds
		Then I should see table with css class "bodytable document-actions-extracted-details VERIFIED non-contributing-data has-changed-data" on the modal having the following information:
		| Middle name(s):   | NEIL CAMPBELL			|  No change 	|
		| Unit No.:	        | No data extracted	 	|  10			|
		| Street No.:		| No data extracted		|  12			|
		| Street Name:		| 	   					|  Main Road	|
		| Postcode:			| No data extracted  	|  rh8 0an		|
		| Expiry date:		| 03/10/2019	   		|  No change	|
		Then I press the button with the text "Hide additional extracted data" on the modal
		Then I press the modal close button
		#================ Registration Match =======================
		Then I press "Registration Match" sub component link of this combo source
		Then Waiting for "2" seconds
		Then I should find bold text "matched his/her registration data"
		#================ Face Comparison =======================
		Then I press "Face Comparison" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "Automatically Fail"
		Then I should find bold text "match score of 10.23"
		Then The face comparison sub component should have a button with the text "View this failed component" and press it
		Then Waiting for "10" seconds
		Then I should find the modal is in "Failed" state
		Then I should find bold text "match score of 10.23" on the modal
		Then I should see the score box with text "10.23" in "Failed" state from "score-box-match-score" on the modal
		Then I should see the score box with text "PASS" in "VERIFIED" state from "score-box-liveness-result" on the modal
		Then I should find bold text "JONATHAN may not be the person using the device" on the modal
		Then I should see the div with id "face1-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-1	|
		| Text	|	Passport Photo	|
		| Link1	| 	Download cropped photo	|
		| Link2	| 	Download full image	|
		Then I should see the div with id "face2-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-2 	|
		| Text1	|	Selfie			|
		| Text2	| 	Auto capture		|
		| Link	| 	Download this photo	|
		Then I press the modal close button
		Then Waiting for "20" seconds