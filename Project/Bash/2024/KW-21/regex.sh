#!/bin/bash

function validPhoneNumber() {
    local phone_number="$1"
    
    if [[ $phone_number =~ ^\([0-9]{3}\)\ [0-9]{3}-[0-9]{4}$ ]]; then
        echo "true"
    else
        echo "false"
    fi
}

# Beispiele
echo $(validPhoneNumber "(123) 456-7890")  # returns true
echo $(validPhoneNumber "(1111)555 2345")  # returns false
echo $(validPhoneNumber "(098) 123 4567")  # returns false
echo $(validPhoneNumber "asd(098) 123 4567")  # returns false
echo $(validPhoneNumber "(098) 123 4567qwe")  # returns false
