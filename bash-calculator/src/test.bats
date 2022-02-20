#!/bin/bash

setup() {
    load "../test/test_helper/bats-support/load"
    load "../test/test_helper/bats-assert/load"
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

@test "run script's usage" {
    run calculator.sh -h
}

@test "perform addition interactively, do not continue" {
    run addition-expect.sh
}

@test "perform subtraction interactively, do not continue" {
    run subtraction-expect.sh
}

@test "perform multiplication interactively, do not continue" {
    run multiplication-expect.sh
}

@test "perform division interactively, do not continue" {
    run division-expect.sh
}

@test "perform addition interactively, continue and perform division interactively" {
    run repeat-operation.sh
}
