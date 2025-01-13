#!/bin/bash

source ./demo-vars.sh

if ! test -f ./jwt-this; then
  curl -sLO https://github.com/tr1ck3r/jwt-this/releases/download/v1.2.5/jwt-this_linux.zip
  unzip jwt-this_linux.zip
  rm jwt-this_linux.zip
fi

./jwt-this -a $JWT_AUDIENCE -u $JWT_ISSUER -t RSA > jwt.info &
sleep 3

# Get JWT
echo "JWT:"
curl -s http://localhost:8000/token

# Get signing keys
echo
echo
echo "Keys:"
curl -s http://localhost:8000/.well-known/jwks.json
