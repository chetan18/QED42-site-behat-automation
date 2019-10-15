Feature: To test the footer of QED42

@javascript @socialicons_footer

Scenario: to check the footer of qed website
Given I am on the homepage
And I scroll "#social-links" into view
And I check "#social-links a:nth-child(1)" element should have "https://twitter.com/qed42" link in "footer" region
And I check "#social-links a:nth-child(2)" element should have "https://www.instagram.com/qed42.design" link in "footer" region
And I check "#social-links a:nth-child(3)" element should have "https://www.facebook.com/qed42" link in "footer" region
And I check "#social-links a:nth-child(4)" element should have "https://www.linkedin.com/company/qed42" link in "footer" region
And I check ".email" element should have "business@qed42.com" text in "footer" region
