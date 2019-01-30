@Stag1 @demoSG
Feature: Staging Singapore NRIC - Tan PEI PEI
	#@MobileSmokeTest
    Scenario: Create a registration for demoapp-sg-simpleonboard using Tan PEI PEI NRIC
 		Then I go to mobile start page
		Then I fill the field with ID "customerCodeInput" for the value "stag-stand-venture-moon"
		Then I press the button with the text "Load Config"
		Then Waiting for "2" seconds
		Then I press the button with the text "Start Test"
		Then Waiting for "2" seconds
		Then I press the button with the text "Get started"
		Then Waiting for "2" seconds
		Then I press the button with the text "NRIC"
		Then Waiting for "2" seconds
		Then I press the button with the text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "SG-NRIC-front-TPP.png" card from TestImageService
		Then I press the upload button with the id "frontInput" and choose file "SG-NRIC-front-TPP.png"
		Then Waiting for "5" seconds
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "20" seconds
		Then I press the button with the text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "SG-NRIC-back-TPP.png" card from TestImageService
		Then I press the upload button with the id "backInput" and choose file "SG-NRIC-back-TPP.png"
		Then Waiting for "2" seconds
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "30" seconds
		Then I press the button with the text "Skip the instructions >>"
		Then Waiting for "2" seconds
		Then I download the sample "SELFIE-RK.png" card from TestImageService
		Then I press the upload button with the id "selfieInput" and choose file "SELFIE-RK.png"
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "30" seconds
		Then I should see the label texts as following:
		| documentNumber	    | DOCUMENT NUMBER  				 |
		| documentIssueDate     | Issue Date (DD/MM/YYYY)    	 |
		| nationality           | Nationality                    |
		| documentGender        | Gender                    	 |
		| surname               | Name                           |
		| 	dob				    | DATE OF BIRTH (DD/MM/YYYY)	 |
		| streetName            | Address                        |
		| postcode              | Postcode                       |	
		Then I should see the input fields with the values as following:
		| 	documentNumber	     | 	B9116082Z	        |
		| 	documentGender   	 |   	F        		|  
        | 	surname		     	 |	I AN PM PM			|
		Then I update the input fields with the values as following:
		 | 	surname		       |  TAN PEI PEI	|
		|   documentIssueDate  |  16/05/2006    |
		|   dob                |  05/05/1991    |
		| 	streetName		   |  Singapore 	|
		| 	postcode		   |  270018 	    |
		Then I update the dropdown fields with the values as following:
		| nationality           | Chinese       |		
		Then I press the button with the text "Continue"
		Then Waiting for "5" seconds
		Then I should find text "Your details didn't match" in "h1"
		Then I should find text "We couldn't verify you using the data you submitted from your NRIC" in "div"		
		Then I should find bold text "we need you to try again"
		Then I press the button with the text "Complete later"
		
	#@MobileSmokeTest
    Scenario: NRIC - of TAN PEI PEI
		Given I logged in to the admin panel for "demoapp-sg-simpleonboard" using default details
		Then I press the "search-form:search-button" button
		#Then I press the link for the registration with userID "c2INW7UN"
		Then I press the link for the latest registration and then wait for "overall"
		Then I should see "1" combo source in "Failed" state
		And The combo source in "Failed" state should have the following sub components:
		| 	Authenticity 	|	PENDING	|
		| 	Data Extraction |	PENDING|
		| 	Registration Match 	|	VERIFIED |
		| 	Face Comparison |	FAILED |
		#================ Authenticity Component - Verified state =============#
		Then I press "Authenticity" sub component link of this combo source
		Then Waiting for "5" seconds
		Then I should find bold text "may not be authentic"
		Then I should find text "review can no longer help" in "strong" "2" times
		Then The Authenticity sub component should have a button with the text "View this component" and press it
        Then Waiting for "10" seconds
		Then I should find the modal is in "PENDING" state
		Then I should find bold text "may not be authentic" on the modal
		Then I should find bold text "review can no longer help" on the modal
		Then I should see the div with id "authenticity-content1-preview" on the modal having the following information:
		| Image | 	slow-load-authenticity-1	|
		| Text1	|	National ID Card (front)	|
		| Text2	| 	Auto capture				|
		| Link	| 	Download image				|
		Then I should see the div with id "authenticity-content2-preview" on the modal having the following information:
		| Image | 	slow-load-authenticity-2	|
		| Text1	|	National ID Card (back)	|
		| Text2	| 	Auto capture				|
		| Link	| 	Download image				|
	    Then I press the modal close button
		# =========DATA EXTRACTION COMPONENT - Verified state=============#
		Then I press "Data Extraction" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "automatically extracted"
		Then I should find bold text "National ID Card"
		Then I should see table with css class "bodytable changes pending has-failed-component" having the following information:
		| EXTRACTED | 	I AN PM PM      |	No data extracted |
		| CHANGES 	| 	TAN PEI PEI		|	05/05/1991 |
		Then The sub component should have a list with cucumber attribute value "data-extraction" showing the verified fields:
		|   DOCUMENT NUMBER	|
		Then I press the button with the text "Show additional extracted data"
		Then Waiting for "5" seconds
		Then I should find bold text "don't contribute to verification"
		Then I should see table with css class "bodytable changes  has-failed-component" having the following information:
		| EXTRACTED | No data extracted |
		| CHANGES 	| 	Singapore 270018	|	16/05/2006 |	
		Then I press the button with the text "Hide additional extracted data"
		Then The data extraction sub component should have a button with the text "View the differences" and press it
		Then Waiting for "20" seconds
		Then I should find the modal is in "PENDING" state
		Then I should find bold text "automatically extracted" on the modal
		Then I should find bold text "National ID Card" on the modal
		Then I should find bold text "changes to the extracted details" on the modal
		Then I should see the div with id "accept-reject-content1-preview" on the modal having the following information:
		| Image | 	slow-load-id-1	|
		| Text1	|	National ID Card (front)	|
		| Link	| 	Download image				|
		Then I should see the div with id "accept-reject-content2-preview" on the modal having the following information:
		| Image | 	slow-load-id-2	|
		| Text1	|	National ID Card (back)	    |		
		| Link	| 	Download image				|
		Then I should see table with css class "bodytable document-actions-extracted-details PENDING contributing-data has-changed-data" on the modal having the following information:
		| Name:       		|   I AN PM PM  		| TAN PEI PEI 	|
		| Date of Birth:	| No data extracted   	| 05/05/1991	|
		Then I should see table with css class "bodytable document-actions-extracted-details PENDING contributing-data no-changed-data" on the modal having the following information:
		| Document number:	| 	 B9116082Z  |
		Then Waiting for "2" seconds
		Then I press the button with the text "Show additional extracted data" on the modal
		Then Waiting for "5" seconds
		Then I should see table with css class "bodytable document-actions-extracted-details PENDING non-contributing-data has-changed-data" on the modal having the following information:
		| Street Name:		|     No data extracted         |  Singapore    |
		| Postcode:	   		| 	  No data extracted      	| 270018        |		
		| Issue date:	    |	  No data extracted	 		| 16/05/2006 	|
		Then I press the button with the text "Hide additional extracted data" on the modal
		Then I press the modal close button
	    #================ Registration Match =======================
		Then I press "Registration Match" sub component link of this combo source
		Then Waiting for "20" seconds
		Then I should find bold text "matched his/her registration data"
		#================ Face Comparison =======================
		Then I press "Face Comparison" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "Failed"
		Then I should find bold text "match score of 0"
		Then The face comparison sub component should have a button with the text "View this failed component" and press it
		Then Waiting for "10" seconds
		Then I should find the modal is in "Failed" state
		Then I should find bold text "match score of 0" on the modal
		Then I should find bold text "TAN PEI PEI may not be the person using the device" on the modal
		Then I should see the score box with text "0" in "Failed" state from "score-box-match-score" on the modal
		Then I should see the score box with text "PASS" in "VERIFIED" state from "score-box-liveness-result" on the modal
		#Then I should find text "must be reviewed by an administrator" on the modal
		Then I should see the div with id "face1-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-1	|
		| Text	|	National ID Card Photo	|
		| Link1	| 	Download cropped photo	|
		| Link2	| 	Download full image	|
		Then I should see the div with id "face2-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-2 	|
		| Text1	|	Selfie		     	|
		| Text2	| 	Manual capture		|
		| Link	| 	Download this photo	|
		Then I press the modal close button
		Then Waiting for "20" seconds	
		