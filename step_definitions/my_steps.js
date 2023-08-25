const axios = require('axios');

let response;

// Step Definitions
Given('the pet-store API is available', () => {
    // No action needed here, just a placeholder for the context setup
});

When('I send a POST request to {string} with the following data:', async (endpoint, dataTable) => {
    const requestData = dataTable.hashes()[0]; // Get the first row of data as an object

    try {
        response = await axios.post(endpoint, requestData);
    } catch (error) {
        response = error.response; // Store the error response for assertions
    }
});

Then('the response status code should be {int}', (statusCode) => {
    expect(response.status).toBe(statusCode);
});

Then('the response should contain the created pet information:', (dataTable) => {
    const expectedData = dataTable.hashes()[0];
    const responseData = response.data;

    // Perform assertions for each property
    for (const key in expectedData) {
        expect(responseData[key]).toEqual(expectedData[key]);
    }
});

Then('the response should contain an error message indicating missing fields', () => {
    expect(response.status).toBe(400);
    expect(response.data.error).toBeDefined();
});

Given('an existing pet with ID {int} exists', async (petId) => {
    // Assuming you have a way to create an existing pet in your setup
});

When('I send a POST request to {string} with the following form data:', async (endpoint, dataTable) => {
    const formData = dataTable.hashes()[0]; // Get the first row of form data as an object

    try {
        response = await axios.post(endpoint, formData);
    } catch (error) {
        response = error.response; // Store the error response for assertions
    }
});

Then('the response should confirm the successful update', () => {
    expect(response.data.message).toBe('Update successful'); // Assuming your response includes this message
});

Then('the form should throw an error {string}', (text) => {
    expect(errorText).toBe(text); // Check error text
});