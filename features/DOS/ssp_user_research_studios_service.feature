@not-production @functional-test @ssp-dos
Feature: Submitting a new DOS service for User research studios
  In order to submit my services as a supplier user
  I want to answer questions about my service

  Background: Log in as a supplier
    Given I am on the 'Supplier' login page
    When I login as a 'Supplier' user
    Then I should be on the supplier home page

  Scenario: Select User research studios as a service to add
    Given I am at '/suppliers'
    When I click 'Continue your Digital Outcomes and Specialists application'
    Then I am taken to the 'Apply to Digital Outcomes and Specialists' page

    When I click 'Add, edit and complete services'
    Then I am taken to the 'Your Digital Outcomes and Specialists services' page

    When I click 'Apply to provide user research studios'
    Then I am taken to the 'User research studios services' page

  Scenario: Provide a lab name
    Given I am at '/suppliers/frameworks/digital-outcomes-and-specialists/submissions/user-research-studios'
    When I click 'Add a service'
    Then I am taken to the 'Lab name' page

    When I fill in 'serviceName' with 'My user research studio'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio' page

  Scenario: Edit lab name
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Lab name'
    Then I should be on the 'Lab name' page

    When I fill in 'serviceName' with 'My user research studio service'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Provide Lab address
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Lab address'
    Then I should be on the 'Lab address' page

    When I fill in 'labAddressBuilding' with 'No 1 Test Street'
    And I fill in 'labAddressTown' with 'Test Town'
    And I fill in 'labAddressPostcode' with 'TE57ME'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Provide Location
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Transport'
    Then I should be on the 'Transport' page

    When I fill in 'labPublicTransport' with 'Take bus 786 towards the radio tower and get off at the Testlington Street'
    And I fill in 'labCarPark' with 'Customer parking available underground'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: A draft service has been created
    Given I am at '/suppliers/frameworks/digital-outcomes-and-specialists/submissions'
    Then There is 'a' draft 'Apply to provide user research studios' service

    When I am at '/suppliers/frameworks/digital-outcomes-and-specialists/submissions/user-research-studios'
    Then There is 'a' draft 'My user research studio service' service

  Scenario: Provide Lab size
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Lab size'
    Then I should be on the 'Lab size' page

    When I fill in 'labSize' with 'Thirty 2'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Provide Viewing info
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Viewing'
    Then I should be on the 'Viewing' page

    When I choose 'Yes – included as standard' for 'labViewingArea'
    And I choose 'Yes – for an additional cost' for 'labStreaming'
    And I choose 'No' for 'labDesktopStreaming'
    And I choose 'Yes – for an additional cost' for 'labDeviceStreaming'
    And I choose 'No' for 'labEyeTracking'
    And I choose 'No' for 'labWiFi'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Provide Technical assistance info
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Technical assistance'
    Then I should be on the 'Technical assistance' page

    When I choose 'Yes – included as standard' for 'labTechAssistance'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Provide Hospitality info
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Hospitality'
    Then I should be on the 'Hospitality' page

    When I choose 'Yes – for an additional cost' for 'labHosting'
    And I choose 'Yes – included as standard' for 'labWaitingArea'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Provide Facilities info
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Facilities'
    Then I should be on the 'Facilities' page

    When I choose 'Yes' for 'labToilets'
    And I choose 'No' for 'labBabyChanging'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Provide Accessibility info
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Accessibility'
    Then I should be on the 'Accessibility' page

    When I fill in 'labAccessibility' with 'Wheelchair accessible, lifts and toilets accommodate wheelchairs.'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Provide Price info
    Given I am on ssp page 'user-research-studios'
    When I click the 'Edit' link for 'Price'
    Then I should be on the 'Price' page

    When I fill in 'labPriceMin' with '158'
    And I select '2 hours' from 'labTimeMin'
    And I click 'Save and continue'
    Then I should be on the 'My user research studio service' page

  Scenario: Verify text on summary page
    Given I am on the summary page
    Then Summary row 'What is the name of the lab?' under 'Lab name' should contain 'My user research studio service'
    And Summary row 'Building and street' under 'Lab address' should contain 'No 1 Test Street'
    And Summary row 'Town or city' under 'Lab address' should contain 'Test Town'
    And Summary row 'Postcode' under 'Lab address' should contain 'TE57ME'
    And Summary row 'How do visitors get to your studio using public transport?' under 'Location' should contain 'Take bus 786 towards the radio tower and get off at the Testlington Street'
    And Summary row 'Where can visitors to your studio park?' under 'Location' should contain 'Customer parking available underground'
    And Summary row 'How many people can the lab accommodate?' under 'Lab size' should contain 'Thirty 2'
    And Summary row 'Do you have an viewing area?' under 'Viewing' should contain 'Yes – included as standard'
    And Summary row 'Do you provide remote streaming from the lab?' under 'Viewing' should contain 'Yes – for an additional cost'
    And Summary row 'Do you stream a view of the desktop or laptop screen?' under 'Viewing' should contain 'No'
    And Summary row 'Do you stream a view of a mobile or tablet device?' under 'Viewing' should contain 'Yes – for an additional cost'
    And Summary row 'Do you provide eye-tracking?' under 'Viewing' should contain 'No'
    And Summary row 'Do you provide Wi-Fi?' under 'Viewing' should contain 'No'
    And Summary row 'Do you provide help with studio equipment and streaming?' under 'Technical assistance' should contain 'Yes – included as standard'
    And Summary row 'Do you welcome and host participants?' under 'Hospitality' should contain 'Yes – for an additional cost'
    And Summary row 'Do you provide a waiting area?' under 'Hospitality' should contain 'Yes – included as standard'
    And Summary row 'Do you provide toilets?' under 'Facilities' should contain 'Yes'
    And Summary row 'Do you provide baby-changing facilities?' under 'Facilities' should contain 'No'
    And Summary row 'How accessible is your studio?' under 'Accessibility' should contain 'Wheelchair accessible, lifts and toilets accommodate wheelchairs.'
    And Summary row 'What is the minimum amount of time your lab can be booked for and how much does it cost?' under 'Price' should contain '£158 per lab'

  @delete_service
  Scenario: Delete the service
    Given I am on the summary page
    When I click 'Delete'
    Then I am presented with the message 'Are you sure you want to delete this lab?'

    When I click 'Yes, delete'
    Then I am taken to the 'User research studios services' page
    And I am presented with the message 'My user research studio service was deleted'
    And There is 'no' draft 'My user research studio service' service

    When I am at '/suppliers/frameworks/digital-outcomes-and-specialists/submissions'
    Then There is 'no' draft 'User research studios' service