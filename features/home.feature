Feature: To test the homepage of QED42

@javascript @homepage_dei

Scenario: To check taking Drupal experts India on the website

Given I am on the homepage
Then I should see "Your Drupal experts in India"
And I scroll ".main-content wrapper" into view
And I wait for "5" secs

@javascript @homepage_apf

Scenario: To check homepage apf page

Given I am on the homepage
And I scroll into "a[href='/work/apf']" css element
And I click the link "a[href='/work/apf']"
And I wait for "1" secs
Then I should be on "/work/apf"

@javascript @homepage_sab-miller

Scenario: To check homepage sab-miller page

Given I am on the homepage
And I scroll into "a[href='/work/sab-miller']" css element
And I click the link "a[href='/work/sab-miller']"
And I wait for "1" secs
Then I should be on "/work/sab-miller"

@javascript @homepage_designapp

Scenario: To check homepage design approach page

Given I am on the homepage
And I scroll into "a[href='/services/design']" css element
And I click the link "a[href='/services/design']"
And I wait for "1" secs
Then I should be on "/services/design"

@javascript @homepage_ourservices

Scenario: To check homepage our services page

Given I am on the homepage
And I maximize browser window size
And I scroll "#block-homepagecasestudyblock" into view
And I click the link ".links:nth-child(2) .read-more > a.see-all-link"
And I wait for "1" secs
Then I should be on "/services"

@javascript @homepage_client_logos

Scenario: To check no of logos on qed website

Given I am on the homepage
And I will count logos with class ".client-logos-row > .company"
And Logo count is "22" in class ".client-logos-row > .company"

@javascript @wordcount_block_ourservices

Scenario: To verify OUR SERVICES block has description.

Given I am on the homepage
And I check "#block-homepagecasestudyblock > div:nth-child(2) p" element should have more than "11" word count


