Feature: To test the Blog page of QED42

@javascript @blog_page

Scenario: to check the all bullet point on blog page of qed website

Given I am on the homepage
Then I click "Blog"
And I wait for "1" secs
Then I should be on "/blog"

@javascript @blog_count

Scenario: To verify the number of blogs available on the blog page before and after clicking on view more link

Given I am on "/blog"
Then I should see more than "4" blogs in blog page
And I click "View more"
And I wait for AJAX to finish
Then I should see more than "8" blogs in blog page

@javascript @blog_design

Scenario: to check the design bullet point on blog page of qed website

Given I am on "/blog"
And I click "Design"
Then I should be on "/blog/design"
Then I should see more than "4" blogs in blog page
And I click "View more"
And I wait for AJAX to finish
Then I should see more than "6" blogs in blog page

@javascript @blog_drupal

Scenario: to check the design bullet point on blog page of qed website

Given I am on "/blog"
And I click "Drupal"
Then I should be on "/blog/drupal"
Then I should see more than "4" blogs in blog page
And I click "View more"
And I wait for AJAX to finish
Then I should see more than "8" blogs in blog page

@javascript @blog_events

Scenario: to check the design bullet point on blog page of qed website

Given I am on "/blog"
And I click "Events"
Then I should be on "/blog/events"
Then I should see more than "4" blogs in blog page
And I click "View more"
And I wait for AJAX to finish
Then I should see more than "8" blogs in blog page

@javascript @blog_js

Scenario: to check the design bullet point on blog page of qed website

Given I am on "/blog"
And I click "JS"
Then I should be on "/blog/js"
Then I should see more than "4" blogs in blog page
And I click "View more"
And I wait for AJAX to finish
Then I should see more than "8" blogs in blog page
