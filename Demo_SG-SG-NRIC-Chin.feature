@Stag1 @demoSG
Feature: Staging Singapore NRIC - Chin
	#@MobileSmokeTest
    Scenario: Create a registration for demoapp-sg-simpleonboard using Chin NRIC
 		Then I go to mobile start page
		Then I fill the field with ID "customerCodeInput" for the value "stag-stand-venture-moon"
		Then I press the button with text "Load Config"
		Then Waiting for "2" seconds
		Then I press the button with text "Start Test"
		Then Waiting for "2" seconds
		Then I press the button with text "Get started"
		Then Waiting for "2" seconds
		Then I press the button with text "NRIC"
		Then Waiting for "2" seconds
		Then I press the button with text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "SG-NRIC-front-Chin.png" card from TestImageService
		Then I press the upload button with the id "frontInput" and choose file "SG-NRIC-front-Chin.png"
		Then Waiting for "5" seconds
		Then I press the button with text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "20" seconds
		Then I press the button with text "GO"
		Then Waiting for "2" seconds
		Then I download the sample "SG-NRIC-back-Chin.png" card from TestImageService
		Then I press the upload button with the id "backInput" and choose file "SG-NRIC-back-Chin.png"
		Then Waiting for "2" seconds
		Then I press the button with text "Submit Above Images (Proceeds to next screen)"
		Then Waiting for "30" seconds
		Then I press the button with text "Skip the instructions >>"
		Then Waiting for "2" seconds
		Then I download the sample "SELFIE-RK.png" card from TestImageService
		Then I press the upload button with the id "selfieInput" and choose file "SELFIE-RK.png"
		Then I press the button with text "Submit Above Images (Proceeds to next screen)"
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
		| 	documentNumber	     | 	S1306655H	        |
		| 	documentGender   	 |   	M        		|  
        | 	surname		     	 |	CHIN HIONG LUEN|	|	
		| 	dob				     |   31/08/1958 		|
		Then I update the input fields with the values as following:
		|   documentIssueDate  |  16/05/2006    |
		|   dob                |  05/05/1991    |
		| 	streetName		   |  Singapore 	|
		| 	postcode		   |  270018 	    |
		Then I update the dropdown fields with the values as following:
		| nationality           | Chinese       |		
		Then I press the button with text "Continue"
		Then Waiting for "5" seconds
		Then I should find text "Your details didn't match" in "h1"
		Then I should find text "We couldn't verify you using the data you submitted from your NRIC" in "div"		
		Then I should find bold text "we need you to try again"
		Then I press the button with text "Complete later"
		