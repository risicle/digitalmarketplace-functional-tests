@not-production @functional-test
Feature: Supplier Submits Clarification Question

Background: Publish requirements
  Given I have a buyer user account
  And I have deleted all draft buyer requirements
  And I have a 'published' set of requirements

Scenario: Set up suppliers and supplier users
  Given I have test suppliers
  And The test suppliers have users
  And Test supplier users are active

Scenario: Supplier asks a question
  Given I am on the 'Digital Marketplace' login page
  And I login as a 'Supplier' user
  And I am on the public view of the opportunity
  When I click 'Ask a question'
  Then I am taken to the 'Ask a question' page
  When I enter 'How do I ask a question?' in the 'clarification-question' field
  And I click the 'Ask question' button
  Then there is a success banner message containing 'Your question has been sent.'
