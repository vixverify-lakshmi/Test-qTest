@Stag1 @demoZA
Feature: staging Demo ZA Registration - York's ID book with selfie
	#@MobileSmokeTest
    Scenario: Create a registration for demoapp-ZA-simpleonboard using Yorks ID Book
 		Then I go to mobile start page
		Then I fill the field with ID "customerCodeInput" for the value "stag-gene-defer-dreg"
		Then I press the button with the text "Load Config"
		Then Waiting for "2" seconds
		Then I press the button with the text "Start Test"
		Then Waiting for "2" seconds
		Then I press the button with the text "National Identity Book"
		Then Waiting for "2" seconds
		Then I press the button with the text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "SA-IDBook-york.png" card from TestImageService
		Then I press the upload button with the id "frontInput" and choose file "SA-IDBook-york.png"
		Then Waiting for "2" seconds
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "30" seconds
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
		| 	documentNumber	| 	9001115059080|   
	    | 	givenName		|	YORK 		 |
		| 	middleNames		|		         |
		| 	surname			|	STANHAM		 |
	    | 	dob				|	11/01/1990	 |
		Then I press the button with the text "CONTINUE"
		Then Waiting for "10" seconds
		Then I press the link with text "Go to next screen"
		Then Waiting for "2" seconds
        Then I should find text "Congratulations, you're all done" in "h1"
        Then I should find text "Your application is verified" in "div"
        Then Waiting for "5" seconds
		
	#@MobileSmokeTest	
	Scenario: DEMO ZA  - York's SA -booklet all PASSED
		Given I logged in to the admin panel for "demoapp-za-simpleonboard" using default details
		Then I press the "search-form:search-button" button
		#Then I press the link for the registration with userID "7GGf1WBR"
		Then I press the link for the latest registration and then wait for "overall"
		Then I should see "1" combo source in "Verified" state
		And The combo source in "VERIFIED" state should have the following sub components:
		| 	Authenticity 	|	VERIFIED		|
		| 	Data Extraction |	VERIFIED		|
		| 	Registration Match 	|	VERIFIED	|
		| 	Face Comparison |	VERIFIED		    |
		#================ Authenticity =======================#
		Then I press "Authenticity" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "appears to be authentic"
		Then I should find text "National Identity Book" in "strong" "3" times
		Then The Authenticity sub component should have a button with the text "View this verified component" and press it
        Then Waiting for "20" seconds
		Then I should find the modal is in "VERIFIED" state
		Then I should find bold text "appears to be authentic" on the modal
		Then I should see the div with id "authenticity-content1-preview" on the modal having the following information:
		| Image | 	slow-load-authenticity-1	    |
		| Text1	|	National Identity Book (front)	|
		| Text2	| 	Auto capture	|
		| Link	| 	Download image	|
		Then I press the modal close button
		#================ Data Extraction =======================
		Then I press "Data Extraction" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "correctly automatically extracted"
		Then The sub component should have a list with cucumber attribute value "data-extraction" showing the verified fields:
		| 	FIRST NAME	|
		| 	SURNAME		|
		|	D.O.B.		|
		|   DOCUMENT NUMBER	|
		Then I press the button with the text "Show additional extracted data"
		Then Waiting for "3" seconds	
		Then I press the button with the text "Hide additional extracted data"
		Then The data extraction sub component should have a button with the text "View this verified component" and press it
		Then Waiting for "20" seconds
		Then I should find the modal is in "VERIFIED" state
		Then I should find bold text "correctly automatically extracted" on the modal
		Then I should see the div with id "accept-reject-content1-preview" on the modal having the following information:
		| Image | 	slow-load-id-1	                |
		| Text	|	National Identity Book (front)	|
		| Link	| 	Download image	                |
		Then I should see table with css class "bodytable document-actions-extracted-details VERIFIED contributing-data no-changed-data" on the modal having the following information:
		| First name: 		| 	YORK		  |
		| Surname:			|	STANHAM  	  |
		| Date of Birth:	| 	11/01/1990	  |
		| Document number:	| 	9001115059080 |
		Then I press the button with the text "Show additional extracted data" on the modal
		Then Waiting for "5" seconds
		Then I press the button with the text "Hide additional extracted data" on the modal
		Then Waiting for "10" seconds
		Then I press the modal close button
		#================ Data Match =======================
		Then I press "Data Match" sub component link of this combo source
		Then Waiting for "5" seconds
		Then The sub component should have a list with cucumber attribute value "data-source" showing the verified fields:
		|	FIRST NAME	|
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
		Then I should find bold text "automatically verified"
		Then I should find bold text "match score of 53.96"
		Then The face comparison sub component should have a button with the text "View this verified component" and press it
		Then Waiting for "20" seconds
		Then I should find the modal is in "verified" state
		Then I should find bold text "match score of 53.96" on the modal
		Then I should find bold text "automatically verified" on the modal
		Then I should see the score box with text "53.96" in "VERIFIED" state from "score-box-match-score" on the modal
		Then I should see the score box with text "PASS" in "VERIFIED" state from "score-box-liveness-result" on the modal
		Then I should see the div with id "face1-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-1		|
		| Text	|	National Identity Book 	|
		| Link1	| 	Download cropped photo	|
		| Link2	| 	Download full image		|
		Then I should see the div with id "face2-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-2 	|
		| Text1	|	Selfie				|
		| Text2	| 	Auto capture		|
		| Link	| 	Download this photo	|
		Then I press the modal close button
		Then Waiting for "20" seconds