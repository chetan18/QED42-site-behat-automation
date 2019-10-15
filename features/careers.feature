@javascript @careers
Feature: To test various types of hiring positions

  Background: Default
    Given I am on the homepage
    When I click "Careers"
    And I wait for "2" secs
    Then I am on "/careers"

  Scenario: To test Technical Lead developer position
    Given I am on "/careers"
    And I wait for "5" secs
    When I click on "#block-openposition"
    Then I should see "Open Job Positions"
    And I should see "Technical Lead Developer [6+ years]"
    And I should see "Senior Business Development Executive [4+ years]"
    And I should see "Drupal Technical Architect"