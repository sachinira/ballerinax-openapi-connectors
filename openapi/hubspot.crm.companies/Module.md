## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview). 
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot CRM Companies connector in your Ballerina application, update the .bal file as follows:

### Step 1 - Import connector
First, import the ballerinax/hubspot.crm.company module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.company;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
company:ClientConfig clientConfig = {
    auth : {
        token: <ACCESS_TOKEN>
    }
};

company:Client baseClient = check new Client(clientConfig);

```

### Step 3 - Invoke connector operation
1. Create a company instance

```ballerina
company:SimplePublicObjectInput company = {
    properties : {
        "city": "Cambridge",
        "domain": "biglytics.net",
        "industry": "Technology",
        "name": "Biglytics",
        "phone": "(877) 929-0687",
        "state": "Massachusetts"
    }      
};

company:SimplePublicObject|error bEvent = baseClient->create(company);

if (bEvent is company:SimplePublicObject) {
    log:printInfo("Created the company" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

2. List companies

```ballerina
company:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error bEvent = baseClient->getPage();

if (bEvent is company:CollectionResponseSimplePublicObjectWithAssociationsForwardPaging) {
    log:printInfo("Company list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

3. Use `bal run` command to compile and run the Ballerina program
