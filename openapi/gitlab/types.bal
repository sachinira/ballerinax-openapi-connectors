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

public type VersionResponse record {
    string 'version?;
    string revision?;
};

public type GroupAccessRequest record {
    int id?;
    string usename?;
    string name?;
    string state?;
    string created_at?;
    string requested_at?;
};

public type AccessTokenList record {
    int user_id?;
    string name?;
    string expires_at?;
    int id?;
    boolean active?;
    string created_at?;
    boolean revoked?;
};

public type ProjectAccessResponse record {
    int id?;
    string usename?;
    string name?;
    string state?;
    string created_at?;
    string requested_at?;
};

public type ProjectAccessApprove record {
    int id?;
    string usename?;
    string name?;
    string state?;
    string created_at?;
    int access_level?;
};

public type GroupAccessResponse record {
    int id?;
    string usename?;
    string name?;
    string state?;
    string created_at?;
    string requested_at?;
};

public type Accesstokenlist1 record {
    int user_id?;
    string name?;
    string expires_at?;
    int id?;
    boolean active?;
    string created_at?;
    boolean revoked?;
    string token?;
};

public type ProjectAccessRequest record {
    int id?;
    string usename?;
    string name?;
    string state?;
    string created_at?;
    string requested_at?;
};

public type GroupAccessApprove record {
    int id?;
    string usename?;
    string name?;
    string state?;
    string created_at?;
    int access_level?;
};
