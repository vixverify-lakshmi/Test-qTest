Feature:
  Test qTest Scenario with JIRA

  Scenario:
    Testing the font
    Given I login into JIRA
    When I put in the valid credentials
    And Click login
    Then I should see the JIRA home page
