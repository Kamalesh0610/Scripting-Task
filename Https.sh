#!/bin/bash

echo "Checking HTTP response code for guvi.in..."
response_code=$(curl -s -o /dev/null -w "%{http_code}" https://www.guvi.in)

echo "HTTP Response Code: $response_code"

if [[ $response_code =~ ^2 ]]; then
    echo "Success: The request was successful."
elif [[ $response_code =~ ^4 ]]; then
    echo "Failure: Client error occurred."
elif [[ $response_code =~ ^5 ]]; then
    echo "Failure: Server error occurred."
else
    echo "Failure: Unexpected status code received."
fi
