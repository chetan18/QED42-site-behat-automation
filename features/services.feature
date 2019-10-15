Feature: To test the services page of QED42

@javascript @services_design

Scenario: to check the services page of qed website

Given I am on "/services"
And I scroll into "a[href='/services/design']" css element
And I click "Our Design Services"
And I wait for "1" secs
Then I should be on "/services/design"
And I should see "Crafting ambitious digital experiences"
And I check ".plain-text" element should have more than "20" word count

@javascript @services_cdd

Scenario: to check the consultancy, design and development on services page of qed website

Given I am on "/services"
And I should see "Consultancy"
And I should see "Development"
And I should see "Design"



