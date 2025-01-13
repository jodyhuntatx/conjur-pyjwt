#!/bin/bash

pushd conjur-setup
  ./_stop-jwt-this.sh
  rm -rf jwt-this .token .trust jwt.info __pycache__
popd

pushd conjur-test
  rm -rf __pycache__ logs
popd
