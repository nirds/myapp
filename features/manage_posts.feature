Feature: As a blogger I would like to CRUD posts

Scenario: I would like to see my post titles on the homepage
  Given I have a "Post" with a "content" "TESTTTTT!!!!!"
  When I am on the homepage
  Then I should see "TESTTTTT!!!!!"

Scenario: I want to be able to create posts
  Given I am on the homepage
  When I click "New Post"
    And fill in "Content" with "Hello There"
    And I press "Create Post"
  Then I should be on the homepage
    And I should see "Hello There"