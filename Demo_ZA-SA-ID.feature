@Stag1 @demoZA
Feature: staging - DEMO -ZA-National ID card
	#@MobileSmokeTest
	Scenario: Create a registration for staging ZA ID Book
 		Then I go to mobile start page
		Then I fill the field with ID "customerCodeInput" for the value "stag-gene-defer-dreg"
		Then I press the button with the text "Load Config"
		Then Waiting for "2" seconds
		Then I press the button with the text "Start Test"
		Then Waiting for "2" seconds
		Then I press the button with the text "National Identity Document"
		Then Waiting for "2" seconds
		Then I press the button with the text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "ZA-ID-front.png" card from TestImageService
		Then I press the upload button with the id "frontInput" and choose file "ZA-ID-front.png"
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "10" seconds
		Then I press the button with the text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "ZA-ID-back.png" card from TestImageService
		Then I press the upload button with the id "backInput" and choose file "ZA-ID-back.png"
		Then Waiting for "2" seconds
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "20" seconds	
		Then I press the button with the text "Skip the instructions >>"
		Then Waiting for "2" seconds
		Then I download the sample "SELFIE-YORK.png" card from TestImageService
		Then I press the upload button with the id "selfieInput" and choose file "SELFIE-YORK.png"
		Then Waiting for "2" seconds
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "20" seconds
		Then I should see the label texts as following:
		| 	documentNumber	| 	Document number |  
		| 	givenName		|	First name		|
		| 	middleNames		|	Middle name(s)	|
		| 	surname			|	Surname			|
		| 	dob				|	DATE OF BIRTH (DD/MM/YYYY)	|
        Then I should see the input fields with the values as following:
		| 	documentNumber	| 	5809265115088|   
	    | 	givenName		|	JOHANNES   |
		| 	middleNames		|   HUGO       |
		| 	surname			|	SMIT	   |
	    | 	dob				|	26/09/1958 |
		Then I press the button with the text "CONTINUE"
		Then Waiting for "10" seconds
		Then I should find text "Your details didn't match" in "h1"
		Then I should find text "We couldn't verify you using the data you submitted from your National Identity Document" in "div"		
		Then I should find bold text "we need you to try again"
		Then I press the button with the text "Complete later"
 	
 	#@MobileSmokeTest
	Scenario: DEMO ZA  - HUGO's NAtional ID card of SA  all F-P-P-P-F
		Given I logged in to the admin panel for "demoapp-za-simpleonboard" using default details
		Then I press the "search-form:search-button" button
		Then I press the link for the registration with userID "5eGKv73z"
		#Then I press the link for the latest registration and then wait for "overall"
		Then I should see "1" combo source in "Failed" state
		And The combo source in "Failed" state should have the following sub components:
		| 	Authenticity 	| Failed	|
		| 	Data Extraction | VERIFIED	|
		| 	Registration Match|	VERIFIED|
		| 	Face Comparison | Failed	|
		#================ Authenticity =======================#
		Then I press "Authenticity" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "doesn't appear to be authentic"
		#Then I should find text "National Identity Document" in "strong" 
		Then The Authenticity sub component should have a button with the text "View this failed component" and press it
        Then Waiting for "20" seconds
		Then I should find the modal is in "Failed" state
		Then I should find bold text "doesn't appear to be authentic" on the modal
		Then I should see the div with id "authenticity-content1-preview" on the modal having the following information:
		| Image | 	slow-load-authenticity-1	    |
		| Text1	|	National ID Card (front)	|
		| Text2	| 	Auto capture	|
		| Link	| 	Download image	|
		Then I should see the div with id "authenticity-content2-preview" on the modal having the following information:
		| Image | 	slow-load-authenticity-2	    |
		| Text1	|	National ID Card (back)	|
		| Text2	| 	Auto capture	|
		| Link	| 	Download image	|
		Then I press the modal close button
		#================ Data Extraction =======================
		Then I press "Data Extraction" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "correctly automatically extracted"
		#Then I should find text "National Identity Card" in "strong" 
		Then The sub component should have a list with cucumber attribute value "data-extraction" showing the verified fields:
		| 	FIRST NAME	|
		| 	SURNAME		|
		|	D.O.B.		|
		|   DOCUMENT NUMBER	|
		Then I press the button with the text "Show additional extracted data"
		#Then I should see data extraction change table with following information:
		#| MIDDLE NAME 		| 	DOCUMENT EXPIRY DATE	|
		#| HUGO 	        | 		                    |
		Then Waiting for "3" seconds	
		Then I press the button with the text "Hide additional extracted data"
		Then The data extraction sub component should have a button with the text "View this verified component" and press it
		Then Waiting for "20" seconds
		Then I should find the modal is in "VERIFIED" state
		Then I should find bold text "correctly automatically extracted" on the modal
		Then I should see the div with id "accept-reject-content1-preview" on the modal having the following information:
		| Image | 	slow-load-id-1	         |
		| Text	|	National ID Card (front) |
		| Link	| 	Download image	         |
		Then I should see the div with id "accept-reject-content2-preview" on the modal having the following information:
		| Image | 	slow-load-id-2	        |
		| Text	|	National ID Card (back)	|
		| Link	| 	Download image	        |
		Then Waiting for "2" seconds
		Then I should see table with css class "bodytable document-actions-extracted-details VERIFIED contributing-data no-changed-data" on the modal having the following information:
		| First name:	|   JOHANNES     |
        | Surname:	    |   SMIT         |
        | Date of Birth:|	26/09/1958   | 
        | Document number:|	5809265115088|
		Then I press the button with the text "Show additional extracted data" on the modal
		Then Waiting for "5" seconds
		Then I should see table with css class "bodytable document-actions-extracted-details VERIFIED non-contributing-data no-changed-data" on the modal having the following information:
		| Middle name(s): 	    | 	HUGO   |
		Then I press the button with the text "Hide additional extracted data" on the modal
		Then Waiting for "10" seconds
		Then I press the modal close button
		#================ Data Match =======================
		Then I press "Data Match" sub component link of this combo source
		Then Waiting for "5" seconds
		#Then I should find bold text "National Identity Card:"
		Then The sub component should have a list with cucumber attribute value "data-source" showing the verified fields:
		|	FIRST NAME	|
		|	MIDDLE NAME	|
		|	SURNAME		|
		|	D.O.B.		|
		|   GOV ID		|
		#================ Registration Match =======================
		Then I press "Registration Match" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "matched his/her registration data"
		#================ Face Comparison =======================
		Then I press "Face Comparison" sub component link of this combo source
		Then Waiting for "20" seconds
		Then I should find bold text "Failed"
		Then I should find bold text "match score of 26.63"
		Then The face comparison sub component should have a button with the text "View this failed component" and press it
		Then Waiting for "20" seconds
		Then I should find the modal is in "FAILED" state
		Then I should find bold text "match score of 26.63" on the modal
		Then I should find bold text "automatically fail" on the modal
		Then I should see the score box with text "26.63" in "Failed" state from "score-box-match-score" on the modal
		Then I should see the score box with text "PASS" in "VERIFIED" state from "score-box-liveness-result" on the modal
		Then I should see the div with id "face1-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-1		|
		| Text	|	National ID Card Photo 	|
		| Link1	| 	Download cropped photo	|
		| Link2	| 	Download full image		|
		Then I should see the div with id "face2-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-2 	|
		| Text1	|	Selfie				|
		| Text2	| 	Auto capture		|
		| Link	| 	Download this photo	|
		Then I press the modal close button
		Then Waiting for "20" seconds	

