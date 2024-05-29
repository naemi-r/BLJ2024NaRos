#!/bin/bash

function validDate() {
    local date="$1"
    
    # Definiere den regulären Ausdruck für das Datum im Format "DD MON YYYY"
    local regex="^(0[1-9]|[12][0-9]|30)\ (JAN|FEB|MAR|APR|MAI|JUN|JUL|AUG|SEP|OKT|NOV|DEZ)\ [0-9]{4}$"
    
    if [[ $date =~ $regex ]]; then
        echo "true"
    else
        echo "false"
    fi
}

# Beispiele
echo $(validDate "21 JAN 2030")  # returns true
echo $(validDate "21JAN2030")  # returns false 
echo $(validDate "04 HAL 2000")  # returns false
echo $(validDate "asd12 FEB 1980")  # returns false
echo $(validDate "30 OKT 1292qwe")  # returns false
