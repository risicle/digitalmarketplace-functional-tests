@password_change @notify @skip-staging
Feature: Password change
Background:

Scenario Outline: Logged in user can change their password
  Given I am logged in as a <role> user
  And I am on the <dashboard_url> page
  When I click 'Change your password'
  Then I am on the 'Change your password' page
  When I enter that user.password in the 'Old password' field
  And I enter that user.password in the 'New password' field
  And I enter that user.password in the 'Confirm new password' field
  And I click 'Save changes' button
  Then I see a success banner message containing 'You have successfully changed your password.'
  And I am on the <dashboard_url> page
  And I receive a 'change-password-alert' email for that user.emailAddress
  And I click the link in that email
  Then I am on the 'Reset password' page

  Examples:
    | role     |  dashboard_url |
    | buyer    |  /buyers       |
    | supplier |  /suppliers    |


Scenario Outline: Logged in admin user can change their password
  Given I am logged in as a production <role> user
  And I am on the /admin page
  When I click 'Change your password'
  Then I am on the 'Change your password' page
  When I enter that user.password in the 'Old password' field
  And I enter that user.password in the 'New password' field
  And I enter that user.password in the 'Confirm new password' field
  And I click 'Save changes' button
  Then I see a success banner message containing 'You have successfully changed your password.'
  And I am on the /admin page
  And I receive a 'change-password-alert' email for that user.emailAddress
  And I click the link in that email
  Then I am on the 'Reset password' page

  Examples:
    | role                    |
    | admin                   |
    | admin-framework-manager |
    | admin-ccs-category      |
    | admin-ccs-sourcing      |
    | admin-manager           |
