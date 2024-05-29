#!/bin/bash

# Funktion zur Passwortüberprüfung
check_password() {
    local password="$1"

    # Kriterien überprüfen
    if [[ ${#password} -lt 8 ]]; then
        echo "Schlecht: Passwort muss mindestens 8 Zeichen lang sein."
        return 1
    fi

    if ! [[ $password =~ [0-9] ]]; then
        echo "Schlecht: Passwort muss mindestens eine Zahl enthalten."
        return 1
    fi

    if ! [[ $password =~ [@#\$%\&*+=!?] ]]; then
        echo "Schlecht: Passwort muss mindestens eines der folgenden Zeichen enthalten: @, #, $, %, &, *, +, =, !, ?."
        return 1
    fi

    echo "Gut: Passwort erfüllt alle Kriterien."
    return 0
}

# Passwort eingeben
read -p "Bitte geben Sie ein Passwort ein: " password

# Passwort überprüfen
check_password "$password"

