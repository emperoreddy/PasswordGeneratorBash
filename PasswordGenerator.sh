#! /bin/bash

# Generare parola aleatoare cu lungimea specificata si elementele dorite

echo "Cate caractere doriti sa aiba parola?"
read -r nrCaractere # Lungimea parolei

echo "Doriti sa contina cifre? (y/n)"
read -r cifre
# Verificare daca cifrele sunt dorite
if [[ $cifre = 'Y' || $cifre = 'y' ]]; then
    cifre='0-9'
else unset cifre
fi

echo "Doriti sa contina litere mici? (y/n)"
read -r litereMici
# Verificare daca literele mici sunt dorite
if [[ $litereMici = 'Y' || $litereMici = 'y' ]]; then
    litereMici='a-z'
else unset litereMici
fi

echo "Doriti sa contina litere mari? (y/n)"
read -r litereMari
# Verificare daca literele mari sunt dorite
if [[ $litereMari = 'Y' || $litereMari = 'y' ]]; then
    litereMari='A-Z'
else unset litereMari
fi

echo "Doriti sa contina simboluri? (y/n)"
read -r simboluri
# Verificare daca simbolurile sunt dorite
if [[ $simboluri = 'Y' || $simboluri = 'y' ]]; then
    simboluri='!@#$%^&*()_+'
else unset simboluri
fi


# Generare parola cu elementele dorite
tr -dc "$cifre""$litereMici""$litereMari""$simboluri" </dev/urandom | head -c "$nrCaractere" ; echo

# Daca nu merge linia 43, foloseste urmatoarea linie
# LC_ALL=C tr -dc "$cifre""$litereMici""$litereMari""$simboluri" </dev/urandom | head -c "$nrCaractere" ; echo

# LC_ALL=C override locale