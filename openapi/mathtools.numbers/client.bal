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
import ballerina/url;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Numbers API v1.5](https://math.tools/api/numbers/) OpenAPI specification.  
# Numbers API of [Math Tools](https://math.tools/) provides the capability to access the operations that are all about numbers
@display {label: "Math Tools Numbers", iconPath: "resources/mathtools.numbers.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Math tools account](https://math.tools/) and obtain tokens following [this guide](https://math.tools/api/numbers/).
    #
    # + apiKeyConfig - Provide your API Key as `X-MathTools-Api-Secret'`. Eg: {X-MathTools-Api-Secret': [<API_KEY>]} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.math.tools") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Get the number of the day for current day
    #
    # + return - 200 Success response 
    remote isolated function getNumberOfTheDay() returns json|error {
        string  path = string `/numbers/nod`;
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Get a random fact about a number
    #
    # + number - Number value 
    # + return - 200 Success response 
    remote isolated function getRandomFactNumber(int number) returns json|error {
        string  path = string `/numbers/fact`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Generate random number(s)
    #
    # + min - Minimum Number value in the range 
    # + max - Maximum Number value 
    # + total - Total number of random numbers to generate. Defaults to 1 
    # + return - 200 Success response 
    remote isolated function generateRandomNumbers(int? min = (), int? max = (), int? total = ()) returns json|error {
        string  path = string `/numbers/random`;
        map<anydata> queryParam = {"min": min, "max": max, "total": total};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Get the ordinal of the given number
    #
    # + number - Number value 
    # + return - 200 Success response 
    remote isolated function getOrdinalOfNumber(int? number = ()) returns json|error {
        string  path = string `/numbers/ordinal`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Get the cardinal of the given number
    #
    # + number - Number value 
    # + language - Language to use 
    # + return - 200 Success response 
    remote isolated function getCardinalOfNumber(int? number = (), string? language = ()) returns json|error {
        string  path = string `/numbers/cardinal`;
        map<anydata> queryParam = {"number": number, "language": language};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Spells out the number as a currency
    #
    # + number - Number to spell 
    # + language - Language to use 
    # + return - 200 Success response 
    remote isolated function spellNumberAsCurrency(int? number = (), string? language = ()) returns json|error {
        string  path = string `/numbers/currency`;
        map<anydata> queryParam = {"number": number, "language": language};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Convert base 10 representation of a given number to egyptian numeral.
    #
    # + number - Number to convert 
    # + return - 200 Success response 
    remote isolated function convertBase10ToEgyptianNumeral(int? number = ()) returns json|error {
        string  path = string `/numbers/numeral/egyptian`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Convert base 10 representation of a given number to chinese numeral.
    #
    # + number - Number to convert 
    # + return - 200 Success response 
    remote isolated function convertBase10ToChineseNumeral(int? number = ()) returns json|error {
        string  path = string `/numbers/numeral/chinese`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Convert base 10 representation of a given number to roman numeral.
    #
    # + number - Number to convert 
    # + return - 200 Success response 
    remote isolated function convertBase10ToRomanNumeral(int? number = ()) returns json|error {
        string  path = string `/numbers/numeral/roman`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Convert a given number to binary
    #
    # + number - Number to convert to binary 
    # + 'from - Base of the supplied number (Optional base 10 assumed by default) 
    # + return - 200 success response 
    remote isolated function convertGivenNumberToBinary(int number, int? 'from = ()) returns json|error {
        string  path = string `/numbers/base/binary`;
        map<anydata> queryParam = {"number": number, "from": 'from};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Convert a given number to octal
    #
    # + number - Number to convert to octal 
    # + 'from - Base of the supplied number (Optional base 10 assumed by default) 
    # + return - 200 success response 
    remote isolated function convertGivenNumberToOctal(int number, int? 'from = ()) returns json|error {
        string  path = string `/numbers/base/octal`;
        map<anydata> queryParam = {"number": number, "from": 'from};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Convert a given number to hexadecimal
    #
    # + number - Number to convert to hex 
    # + 'from - Base of the supplied number (Optional base 10 assumed by default) 
    # + return - 200 success response 
    remote isolated function convertToHexadecimal(int number, int? 'from = ()) returns json|error {
        string  path = string `/numbers/base/hex`;
        map<anydata> queryParam = {"number": number, "from": 'from};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Convert a given number from one base to another base
    #
    # + number - Number to convert to the target base 
    # + to - Target base to convert to 
    # + 'from - Base of the supplied number (Optional base 10 assumed by default) 
    # + return - 200 success response 
    remote isolated function convertBase(int number, int to, int? 'from = ()) returns json|error {
        string  path = string `/numbers/base`;
        map<anydata> queryParam = {"number": number, "from": 'from, "to": to};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Get digits of pi (Ã,â‚¬)
    #
    # + 'from - Optional start position 
    # + to - Optional start position 
    # + return - 200 Success response 
    remote isolated function getDigitsOfPI(int? 'from = (), int? to = ()) returns json|error {
        string  path = string `/numbers/pi`;
        map<anydata> queryParam = {"from": 'from, "to": to};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a known prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsPrime(int? number = ()) returns json|error {
        string  path = string `/numbers/prime/is-prime`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a known mersenne prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsMersennePrime(int? number = ()) returns json|error {
        string  path = string `/numbers/prime/is-mersenne-prime`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a known fermat prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsFermatPrice(int? number = ()) returns json|error {
        string  path = string `/numbers/prime/is-fermat-prime`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a known pell prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsKnownPellPrime(int? number = ()) returns json|error {
        string  path = string `/numbers/prime/is-pell-prime`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a known partition prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsKnownPartitionPrime(int? number = ()) returns json|error {
        string  path = string `/numbers/prime/is-partition-prime`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a known fibonacci prime number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsKnownFibonacciPrime(int? number = ()) returns json|error {
        string  path = string `/numbers/prime/is-fibonacci-prime`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Get the prime factors of a given number.
    #
    # + number - Number to get the factors 
    # + return - 200 Success response 
    remote isolated function getPrimeFactors(int? number = ()) returns json|error {
        string  path = string `/numbers/prime/factors`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a palindrome number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsPalindrome(int? number = ()) returns json|error {
        string  path = string `/numbers/is-palindrome`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a triangle number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsTriangle(int? number = ()) returns json|error {
        string  path = string `/numbers/is-triangle`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a cube number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsCube(int? number = ()) returns json|error {
        string  path = string `/numbers/is-cube`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a square number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function checkNumberIsSquare(int? number = ()) returns json|error {
        string  path = string `/numbers/is-square`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Checks whether a given number is a perfect number or not.
    #
    # + number - Number to check 
    # + return - 200 Success response 
    remote isolated function getNumberIsPerfect(int? number = ()) returns json|error {
        string  path = string `/numbers/prime/is-perfect`;
        map<anydata> queryParam = {"number": number};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Mathtools-Api-Secret": self.apiKeys["X-Mathtools-Api-Secret"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map 
# + return - Returns generated Path or error at failure of client initialization 
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
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
