@Stag1 @demoUK
Feature: Staging DEMO - UK- DL -David -with details update functionality
          
	#@MobileSmokeTest
    Scenario: Create a registration for demoapp-uk-simpleonboard using DAVID UK DL
 		Then I go to mobile start page
		Then I fill the field with ID "customerCodeInput" for the value "stag-beth-lathe-fungus"
		Then I press the button with the text "Load Config"
		Then Waiting for "2" seconds
		Then I press the button with the text "Start Test"
		Then Waiting for "2" seconds
		Then I press the button with the text "Get started"
		Then Waiting for "2" seconds
		Then I press the button with the text "GB Driver's licence"
		Then Waiting for "2" seconds
		Then I press the button with the text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "UK-DL-front-Jonathan.png" card from TestImageService
		Then I press the upload button with the id "frontInput" and choose file "UK-DL-front-Jonathan.png"
		Then Waiting for "2" seconds
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "10" seconds
		Then I press the button with the text "GO"
		Then I download the sample "UK-DL-back.png" card from TestImageService
		Then I press the upload button with the id "backInput" and choose file "UK-DL-back.png"
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "10" seconds
		Then I press the button with the text "Skip the instructions >>"
		Then Waiting for "2" seconds
		Then I download the sample "SELFIE-JONATHAN.png" card from TestImageService
		Then I press the upload button with the id "selfieInput" and choose file "SELFIE-JONATHAN.png"
		Then I press the button with the text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "20" seconds
		Then I should see the label texts as following:
		| 	documentNumber	| 	Driver's licence number |
		| 	givenName		|	First name		|
		| 	middleNames		|	Middle name(s)	|
		| 	surname			|	Surname			|
		|  flatNumber       |  Flat number      |
		|  propertyName     |  Building name    |
		|  streetNumber     | Building number       |
		|  streetName       |   Street name     |  
		|   town            |   Town            |
		|  postcode         |  Postcode         |
		| 	dob				|	DATE OF BIRTH (DD/MM/YYYY)	|
		Then I update the input fields with the values as following:
		| 	documentNumber	|  GRACH711174DA9JM13  |
		| 	givenName		|	DAVID				|
		| 	middleNames		|	ANTHONY				|
		| 	surname			|	GRACHVOGEL			|
		|  flatNumber       |  12                   |
		|  propertyName     |  Vix Building         |
		|  streetNumber     |  10                   |
		|  streetName       |   Street name         |
		|   town            |   OXTED               |
		|  postcode         |  RH8 0AN              |
		| 	dob				|   17/11/1974		    |
		
		#Then I tick the tickbox with the css className "greenid-so-content-agree-label control-label"
		Then I press the button with the text "Continue"
		Then Waiting for "5" seconds
		Then I press the link with text "Go to next screen"
		Then Waiting for "2" seconds
        Then I should find text "Congratulations, you're all done" in "h1"
        Then I should find text "Your application is being reviewed" in "div"
        Then Waiting for "5" seconds
	
	#@MobileSmokeTest
   	Scenario: BUSBY DL- PENDNG-v-v-v
		Given I logged in to the admin panel for "demoapp-uk-simpleonboard" using default details
		Then I press the "search-form:search-button" button
		#Then I press the link for the registration with userID "SjhVGayd"
		Then I press the link for the latest registration and then wait for "overall"
		Then I should see "1" combo source in "PENDING" state
		And The combo source in "PENDING" state should have the following sub components:
		| 	Authenticity 	|	PENDING	|
		| 	Data Extraction |	PENDING|
		| 	Registration Match 	|	VERIFIED |
		| 	Face Comparison |	PENDING	 |	
		#================ Authenticity Component - Verified state =============#
		Then I press "Authenticity" sub component link of this combo source
		Then Waiting for "5" seconds
		Then I should find bold text "may not be authentic"
		Then I should find text "requires review" in "strong" "1" times
		Then The Authenticity sub component should have a button with the text "Review this component" and press it
        Then Waiting for "5" seconds
		Then I should find the modal is in "PENDING" state
		Then I should find bold text "may not be authentic" on the modal
		Then I should see the div with id "authenticity-content1-preview" on the modal having the following information:
		| Image | 	slow-load-authenticity-1	|
		| Text1	|	Driver's Licence (front)	|
		| Text2	| 	Auto capture				|
		| Link	| 	Download image				|
		Then I should see the div with id "authenticity-content2-preview" on the modal having the following information:
		| Image | 	slow-load-authenticity-2	|
		| Text1	|	Driver's Licence (back)	|
		| Text2	| 	Auto capture				|
		| Link	| 	Download image				|
		Then I press the modal close button	
		# =========DATA EXTRACTION COMPONENT - Verified state=============#
		Then I press "Data Extraction" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "automatically extracted"
		Then I should find text "Driver's Licence" in "strong" "3" times
		Then I should see table with css class "bodytable changes pending" having the following information:
		| EXTRACTED | 	No data extracted 	| 	No data extracted 	| 	No data extracted 	| 	No data extracted 	|
		| CHANGES 	| 	DAVID				|	GRACHVOGEL 			| 	17/11/1974 			| 	GRACH711174DA9JM13 	|
		Then I press the button with the text "Show additional extracted data"
		Then Waiting for "5" seconds
		Then I should find bold text "don't contribute to verification"
		#Then I should see table with css class "bodytable changes" having the following information:
		#| EXTRACTED | No data extracted |
		#| CHANGES 	| 	ANTHONY	|	12 10 Street name RH8 0AN|
		Then I press the button with the text "Hide additional extracted data"		
		Then The data extraction sub component should have a button with the text "Review the differences" and press it
		Then Waiting for "20" seconds
		Then I should find the modal is in "PENDING" state
		Then I should find bold text "automatically extracted" on the modal
		#Then I should find bold text "Driver's Licence" on the modal
		Then I should see the div with id "accept-reject-content1-preview" on the modal having the following information:
		| Image | 	slow-load-id-1	|
		| Text	|	Driver's Licence (front)	|
		| Link	| 	Download image	|
		Then I should see the div with id "accept-reject-content2-preview" on the modal having the following information:
		| Image | 	slow-load-id-2	|
		| Text	|	Driver's Licence (back)	|
		| Link	| 	Download image	|
		Then I should see table with css class "bodytable document-actions-extracted-details PENDING contributing-data has-changed-data" on the modal having the following information:
		| First name:      	|   No data extracted  		| DAVID 	|
		| Surname:      	|   No data extracted  		| GRACHVOGEL 	|
		| Date of Birth:    |   No data extracted  		| 17/11/1974 	|
		| Document number:	| No data extracted   		| GRACH711174DA9JM13	|
		Then Waiting for "2" seconds
		Then I press the button with the text "Show additional extracted data" on the modal
		Then Waiting for "5" seconds
		Then I should see table with css class "bodytable document-actions-extracted-details PENDING non-contributing-data has-changed-data" on the modal having the following information:
		| Middle name(s):	|     No data extracted     |  ANTHONY    |
		| Unit No.:			|     No data extracted     |  12    |
		| Street No.:		|     No data extracted     |  10    |
		| Street Name:	   	| 	  No data extracted 	| Street name        |		
		| Postcode:	    	|	  No data extracted	 	| RH8 0AN 	|
		Then I press the button with the text "Hide additional extracted data" on the modal
		Then I press the modal close button
	    #================ Registration Match =======================
		Then I press "Registration Match" sub component link of this combo source
		Then Waiting for "20" seconds
		Then I should find bold text "matched his/her registration data"
		#================ Face Comparison =======================
		Then I press "Face Comparison" sub component link of this combo source
		Then Waiting for "10" seconds
		Then I should find bold text "requires manual review"
		Then I should find bold text "automatic comparison couldn't be completed"
		Then The face comparison sub component should have a button with the text "Review the photos" and press it
		Then Waiting for "10" seconds
		Then I should find the modal is in "PENDING" state
		Then I should find bold text "automatic comparison couldn't be completed" on the modal
		Then I should find bold text "requires manual comparison" on the modal
		Then I should see the score box with text "0" in "FAILED" state from "score-box-match-score" on the modal
		Then I should see the score box with text "PASS" in "VERIFIED" state from "score-box-liveness-result" on the modal
		Then I should see the div with id "face1-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-1	|
		| Text1	|	Driver's Licence Photo	|
		| Text2	| 	Photo wasn't extracted	|
		| Link	| 	Download full image	|
		Then I should see the div with id "face2-content-preview" on the modal having the following information:
		| Image | 	slow-load-face-2 	|
		| Text1	|	Selfie				|
		| Text2	| 	Auto capture		|
		| Link	| 	Download this photo	|
		Then I press the modal close button
		Then Waiting for "20" seconds