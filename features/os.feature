Feature: To test the open source page of QED42

@javascript @os_qed

Scenario: to check the open source at qed website

Given I am on "https://www.qed42.com/open-source"
Then I should see "Open Source at QED42"
And I should see "CODE"
And I wait for "1" secs
When I scroll into "div.contribution:nth-child(1) > div.txt" css element
And I should see "team has contributed to Drupal."
When I scroll into "div.contribution:nth-child(2) > div.txt" css element
And I should see "Projects supported on Drupal.org"
When I scroll into "div.contribution:nth-child(3) > div.txt" css element
And I should see "Drupal 8 projects delivered."
And I check "div.info-block div.code:nth-child(1) > p.txt" element should have more than "25" word count
And I should see "Code"
And I check "div.info-block div.code:nth-child(2) > p.txt" element should have more than "30" word count
And I should see "Community"
And I scroll into "div.sponsored-events-logo:nth-child(1) > img:nth-child(1)" css element
And I should see "We've sponsored"
