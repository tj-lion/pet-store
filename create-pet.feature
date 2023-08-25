Feature: Create a new pet in the pet store

  Scenario: Successfully create a new pet
    Given the pet-store API is available
    When I send a POST request to "/pet" with the following data:
      | id     | category_id | category_name | name      | photoUrls         | tag_id | tag_name | status     |
      | 123    | 1           | Cat           | Fluffy    | ["url1", "url2"]  | 1      | Friendly | available  |
    Then the response status code should be 200
    And the response should contain the created pet information:
      | id     | category_id | category_name | name      | photoUrls         | tag_id | tag_name | status     |
      | 123    | 1           | Cat           | Fluffy    | ["url1", "url2"]  | 1      | Friendly | available  |

  Scenario: Attempt to create a pet with missing required fields
    Given the pet-store API is available
    When I send a POST request to "/pet" with the following data:
      | id     | category_id | category_name | name   | photoUrls | tag_id | tag_name | status     |
      | 123    | 1           | Cat           |        |           | 1      | Friendly | available  |
    Then the response status code should be 400
    And the response should contain an error message indicating missing fields
