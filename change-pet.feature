Feature: Update pet information

  Scenario: Successfully update pet information
    Given the pet-store API is available
    And an existing pet with ID 123 exists
    When I send a POST request to "/pet/update" with the following form data:
      | petId | name    | status  |
      | 123   | NewName | Updated |
    Then the response status code should be 200
    And the response should confirm the successful update

  Scenario: Attempt to update pet information with missing required field
    Given the pet-store API is available
    And an existing pet with ID 123 exists
    When I send a POST request to "/pet/{petId}" with the following form data:
      | petId | name   | status  |
      |       | fluffy | Updated |
    Then the form should throw an error "Required field is not provided"