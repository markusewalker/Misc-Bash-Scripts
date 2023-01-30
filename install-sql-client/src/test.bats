#!/bin/bash

setup() {
    load "../test/test_helper/bats-support/load"
    load "../test/test_helper/bats-assert/load"
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

@test "run script's usage" {
    run install-sql-client.sh -h
}

@test "run script interactively" {
    run install-sql-client.sh
}

@test "script ran successfully" {
    assert_success
}