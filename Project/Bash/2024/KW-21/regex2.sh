#!/bin/bash

function validAHVNumber() {
    local ahv_number="$1"
    
    if [[ $ahv_number =~ ^[0-9]{3}\.[0-9]{4}\.[0-9]{4}\.[0-9]{2}$ ]]; then
        echo "true"
    else
        echo "false"
    fi
}

# Beispiele
echo $(validAHVNumber "123.1234.1234.12")  # returns true
echo $(validAHVNumber "123 1234 1234 12")  # returns false
echo $(validAHVNumber "123.1234,1234,12")  # returns false
echo $(validAHVNumber "asd123.1234.1234.12")  # returns false
echo $(validAHVNumber "123.1234.1234.12qwe")  # returns false
echo $(validAHVNumber "123.12e4.abcd.12")  # returns false
