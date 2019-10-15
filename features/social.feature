Feature: To test the social icons of QED42

@javascript @socialicons_FB

Scenario: to check the facebook social icon of qed website

Given I am on the homepage
When I click on ".icon-footer-facebook"
And I wait for "2" secs
Then I should get redirected to new window
Then I should be on "https://www.facebook.com/qed42"
When I fill in "email" with "chetanbharambe777@gmail.com"
And I fill in "pass" with "Chetan@1829"
And I press "Log In"
Then I should be on "https://www.facebook.com/"

@javascript @socialicons_TW

Scenario: to check the twitter social icon of qed website

Given I am on the homepage
When I click on ".icon-footer-twitter"
And I wait for "2" secs
Then I should get redirected to new window
Then I should be on "https://twitter.com/qed42"


@javascript @socialicons_in

Scenario: to check the linkedin social icon of qed website

Given I am on the homepage
When I click on ".icon-footer-linkedin"
And I wait for "5" secs
Then I should get redirected to new window
And I wait for AJAX to finish
Then I should be on "https://www.linkedin.com/company/qed42"

