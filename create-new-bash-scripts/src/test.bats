#!/bin/bash

setup() {
    load "../test/test_helper/bats-support/load"
    load "../test/test_helper/bats-assert/load"
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

teardown() {
    rm -rf test.sh
}

@test "run script's usage" {
    run new-scripts.sh -h
}

@test "silently create new script" {
    run new-scripts.sh -n test
}

@test "interactively create new script" {
    run create-expect.sh
}
