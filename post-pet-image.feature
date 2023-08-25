Feature: Upload pet image

  Scenario: Successfully upload pet image
    Given the pet-store API is available
    And an existing pet with ID 123 exists
    When I send a POST request to "/pet/{petId}/uploadImage" with the following form data:
      | petId | additionalMetadata | file |
      | 123   | metaData           | file |
    Then the response status code should be 200
    And the response should confirm the successful update

  Scenario: Attempt to update pet image with missing required field
    Given the pet-store API is available
    And an existing pet with ID 123 exists
    When I send a POST request to "/pet/{petId}/uploadImage" with the following form data:
      | petId | additionalMetadata | file |
      |       | metaData           | file |
    Then the form should throw an error "Required field is not provided"