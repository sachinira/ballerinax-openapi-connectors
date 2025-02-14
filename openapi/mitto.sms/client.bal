// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Mitto SMS and Bulk SMS APIs v1](https://docs.mitto.ch/sms-api-reference/) OpenAPI specification.
# Send individual SMS reliably and securely, or send them in bulk. 
# You can choose from different servers to test with based on where you want to send a message to.
@display {label: "Mitto SMS", iconPath: "resources/mitto.sms.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Mitto account](https://docs.mitto.ch) and obtain tokens by following [this guide](https://docs.mitto.ch/sms-api/#authentication).
    #
    # + apiKeyConfig - Provide your API key as `X-Mitto-API-Key`. Eg: `{"X-Mitto-API-Key" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://rest.mittoapi.net") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Send an SMS
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function sendSms(Body payload) returns Sms|error {
        string  path = string `/sms`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeys["X-Mitto-API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Sms response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Sms);
        return response;
    }
    # Track Conversions
    #
    # + payload - Request payload 
    # + return - Success 
    remote isolated function trackConversions(Body1 payload) returns http:Response|error {
        string  path = string `/sms/converted`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeys["X-Mitto-API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Send SMS in Bulk
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function sendBulkSms(Body2 payload) returns Smsbulk|error {
        string  path = string `/smsbulk`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeys["X-Mitto-API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Smsbulk response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Smsbulk);
        return response;
    }
    # Usage by Country
    #
    # + payload - Request payload 
    # + return - Success. 
    remote isolated function getUsageByCountry(Body3 payload) returns Usage|error {
        string  path = string `/usage/bycountry`;
        map<any> headerValues = {"X-Mitto-API-Key": self.apiKeys["X-Mitto-API-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Usage response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Usage);
        return response;
    }
}

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
