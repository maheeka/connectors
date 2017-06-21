import org.wso2.ballerina.connectors.amazonlambda;

import ballerina.lang.system;
import ballerina.net.http;
import ballerina.test;

message lambdaResponse;
json lambdaJSONResponse;

function init () (amazonlambda:ClientConnector){

    string accessKeyId = system:getEnv("ACCESS_KEY");
    string secretAccessKey = system:getEnv("SECRET_ACCESS_KEY");
    string region = system:getEnv("REGION");
    amazonlambda:ClientConnector lambdaConnector = create amazonlambda:ClientConnector(accessKeyId, secretAccessKey, region);
    return lambdaConnector;
}

function testInvokeFunction () {
    amazonlambda:ClientConnector lambdaConnector = init();
    lambdaResponse = amazonlambda:ClientConnector.invokeFunction (lambdaConnector, "BallerinaTestFunction");
    int status = http:getStatusCode(lambdaResponse);
    test:assertIntEquals(status, 200, "InvokeFunction Failed");
    system:println("===testInvokeFunction completed===\n");
}


function testInvokeFunctionWithParam () {
    amazonlambda:ClientConnector lambdaConnector = init();
    json payload = {"name":"Ballerina"};
    lambdaResponse = amazonlambda:ClientConnector.invokeFunctionWithParam (lambdaConnector, "BallerinaTestFunction", payload);
    int status = http:getStatusCode(lambdaResponse);
    test:assertIntEquals(status, 200, "InvokeFunctionWithParam Failed");
    system:println("===testInvokeFunctionWithParam completed===\n");
}


function testListFunctions () {
    amazonlambda:ClientConnector lambdaConnector = init();
    lambdaResponse = amazonlambda:ClientConnector.listFunctions (lambdaConnector);
    int status = http:getStatusCode(lambdaResponse);
    test:assertIntEquals(status, 200, "ListFunctions Failed");
    system:println("===testListFunctions completed===\n");
}


function testGetFunctionVersions () {
    amazonlambda:ClientConnector lambdaConnector = init();
    lambdaResponse = amazonlambda:ClientConnector.getFunctionVersions (lambdaConnector, "BallerinaTestFunction");
    int status = http:getStatusCode(lambdaResponse);
    test:assertIntEquals(status, 200, "GetFunctionVersions Failed");
    system:println("===testGetFunctionVersions completed===\n");
}


function testGetFunction () {
    amazonlambda:ClientConnector lambdaConnector = init();
    lambdaResponse = amazonlambda:ClientConnector.getFunction (lambdaConnector, "BallerinaTestFunction");
    int status = http:getStatusCode(lambdaResponse);
    test:assertIntEquals(status, 200, "GetFunction Failed");
    system:println("===testGetFunction completed===\n");
}


function testGetAccountDetails () {
    amazonlambda:ClientConnector lambdaConnector = init();
    lambdaResponse = amazonlambda:ClientConnector.getAccountDetails (lambdaConnector);
    int status = http:getStatusCode(lambdaResponse);
    test:assertIntEquals(status, 200, "GetAccountDetails Failed");
    system:println("===testGetAccountDetails completed===\n");
}


function testDeleteFunction () {
    amazonlambda:ClientConnector lambdaConnector = init();
    lambdaResponse = amazonlambda:ClientConnector.deleteFunction (lambdaConnector, "BallerinaTestFunction");
    int status = http:getStatusCode(lambdaResponse);
    test:assertIntEquals(status, 204, "DeleteFunction Failed");
    system:println("===testDeleteFunction completed===\n");
}


