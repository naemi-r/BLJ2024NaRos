#!/bin/bash

# Funktion zur Passwortvalidierung
validate_password() {
  local password="$1"
  local length_valid=$(echo "$password" | grep -Eq '^.{8,}$'; echo $?)
  local number_valid=$(echo "$password" | grep -Eq '[0-9]'; echo $?)
  local uppercase_valid=$(echo "$password" | grep -Eq '[A-Z]'; echo $?)
  local special_char_valid=$(echo "$password" | grep -Eq '[^a-zA-Z0-9]'; echo $?)

  if [[ $length_valid -ne 0 ]]; then
    echo "Passwort ist zu kurz. Es muss mindestens 8 Zeichen lang sein."
    return 1
  elif [[ $number_valid -ne 0 ]]; then
    echo "Passwort muss mindestens eine Zahl enthalten."
    return 1
  elif [[ $uppercase_valid -ne 0 ]]; then
    echo "Passwort muss mindestens einen Großbuchstaben enthalten."
    return 1
  elif [[ $special_char_valid -ne 0 ]]; then
    echo "Passwort muss mindestens ein Sonderzeichen enthalten."
    return 1
  else
    return 0
  fi
}

# Funktion zur E-Mail-Validierung
validate_email() {
  local email="$1"
  local regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"

  if [[ $email =~ $regex ]]; then
    return 0
  else
    echo "Ungültige E-Mail-Adresse."
    return 1
  fi
}

# Funktion zur Erstellung eines Benutzers
create_user() {
  local username="$1"
  local password="$2"
  local email="$3"

  sudo useradd -m "$username"
  echo "$username:$password" | sudo chpasswd
  echo "Benutzer $username erstellt."

  # Cron-Job hinzufügen
  (sudo crontab -l ; echo "0 0 * * 0 tar -czf /home/${username}/backup.tar.gz /home/${username}") | sudo crontab -
  echo "Cron-Job für wöchentliches Backup hinzugefügt."
}

# Liste der erstellten Benutzer
declare -a created_users

# Hauptprogramm
while true; do
  echo "Bitte geben Sie den Benutzernamen ein:"
  read username

  while true; do
    echo "Bitte geben Sie ein Passwort ein:"
    read -s password
    if validate_password "$password"; then
      break
    fi
  done

  while true; do
    echo "Bitte geben Sie die E-Mail-Adresse ein:"
    read email
    if validate_email "$email"; then
      break
    fi
  done

  create_user "$username" "$password" "$email"
  created_users+=("$username")

  echo "Möchten Sie einen weiteren Benutzer erstellen? (j/n)"
  read answer
  if [[ "$answer" != "j" ]]; then
    break
  fi
done

echo "Erstellte Benutzer:"
for user in "${created_users[@]}"; do
  echo "$user"
done
