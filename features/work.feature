Feature: To test the work page of QED42

@javascript @workpage_sab-miller

Scenario: to check the sab-miller case study on workpage of qed website

Given I am on "/work"
And I check "div.slide-page:nth-child(1) div.clients-content div.content:nth-child(2) > div.desc" element should have more than "15" word count
And I click the link "a[href='/work/sab-miller']"
And I wait for "1" secs
Then I should be on "/work/sab-miller"

@javascript @workpage_APF

Scenario: to check the APF case study on workpage of qed website

Given I am on "/work"
And I check "div.slide-page:nth-child(2) div.clients-content div.content:nth-child(2) > div.desc" element should have more than "35" word count
And I click the link "a[href='/work/apf']"
And I wait for "1" secs
Then I should be on "/work/apf"

@javascript @workpage_Clasifika

Scenario: to check the APF case study on workpage of qed website

Given I am on "/work"
And I check "div.slide-page:nth-child(3) div.clients-content div.content:nth-child(2) > div.desc" element should have more than "45" word count
And I click the link "a[href='/work/clasifika']"
And I wait for "1" secs
Then I should be on "/work/clasifika"

@javascript @workpage_Delhi

Scenario: to check the APF case study on workpage of qed website

Given I am on "/work"
And I check "div.slide-page:nth-child(4) div.clients-content div.content:nth-child(2) > div.desc" element should have more than "50" word count
And I click the link "a[href='/work/aamc']"
And I wait for "1" secs
Then I should be on "/work/aamc"

