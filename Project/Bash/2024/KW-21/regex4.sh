#!/bin/bash

validEMail() {
  local email="$1"
  local regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"

  if [[ $email =~ $regex ]]; then
    echo "true"
  else
    echo "false"
  fi
}

# Test cases
echo "$(validEMail "viola1.vorlage@gmx.ch")"          # true
echo "$(validEMail "saku@.jp.")"                      # false
echo "$(validEMail "management@noseryoung.ch")"       # true
echo "$(validEMail "diesisteinevielzulangeemailaddresseundentsprichtsomitnichtdenangaben@loremipsum.org")" # false
echo "$(validEMail "@meineEmail.com")"                # false
echo "$(validEMail "ümlautesinderlaubt@mail.com")"    # true
echo "$(validEMail "noser@young")"                    # false
echo "$(validEMail "zuerichermail.com")"              # false
