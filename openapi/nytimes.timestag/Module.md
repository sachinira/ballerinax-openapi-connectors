## Overview
This is a generated connector for [New York Times TimesTags API v1.0.0](https://developer.nytimes.com/docs/timestags-product/1/overview) OpenAPI specification. 
With the TimesTags API, you can mine the riches of the New York Times tag set. The TimesTags service matches your query to the controlled vocabularies that fuel NYTimes.com metadata. You supply a string of characters, and the service returns a ranked list of suggested terms. 
The TimesTags service can help you build a tag set, standardize names of people and organizations, or identify subjects that are currently making news. Information architects and librarians may also wish to compare Times tags to Library of Congress subject headings and other classification systems.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [NYTimes](https://developer.nytimes.com/accounts/login) developer account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
 
## Quickstart

To use the New York Times TimesTags connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/nytimes.timestags` module into the Ballerina project.
```ballerina
import ballerinax/nytimes.timestags as nt;
```

### Step 2: Create a new connector instance
Create a `timestags:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
nt:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nt:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get tags based on a few characters, searching all dictionaries using the connector. Here we have searched for tags with characters "cel".

    Get tags based on a few characters

    ```ballerina
    public function main() {
        nt:TimesTags|error response = baseClient->timestags("cel");
        if (response is nt:TimesTags) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

    Following is an example on how to get names of people and organizations using the connector. You can now get names of people and organizations. Here we have searched for people with characters "edwards".

    Get names of people and organizations

    ```ballerina
    public function main() {
        nt:TimesTags|error response = baseClient->timestags("edwards", "Per");
        if (response is nt:TimesTags) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
