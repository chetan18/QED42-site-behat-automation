Feature: To test the let's talk page of QED42

@javascript @lt_menu

Scenario: to check the let's talk menu of qed website

Given I am on the homepage
And I wait for AJAX to finish
Then I click the link "#block-letstalk"
Then I visit "/contact"
And I wait for "1" secs
And I fill in the following:
    |edit-field-full-name-0-value   |Chetan Vikas Bharambe           |
    |edit-mail                      |chetan.bharambe@qed42.com       |
    |Contact Number                 |9096334999                      |
    |Your organisation              |QED42                           |
    |Tell us about your project*    |Nestle Project                  |


@javascript @lt_link

Scenario: to check the let's talk link above footer on homepage of qed website

Given I am on the homepage
And I scroll into ".lets-talk-toggle" css element
And I click the link ".lets-talk-toggle"
And I fill in the following:
    |Full Name*                     |Chetan Vikas Bharambe           |
    |Email Address*                 |chetan.bharambe@qed42.com       |
    |Contact Number                 |9096334999                      |
    |Your organisation              |QED42                           |
    |Tell us about your project*    |Nestle Project                  |
