#!/bin/bash

setup() {
    load "../test/test_helper/bats-support/load"
    load "../test/test_helper/bats-assert/load"
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

@test "run script's usage {
    run sys-info.sh -h
}

@test "run option 1" {
    run option1.sh
}

@test "run option 2" {
    run option2.sh
}

@test "run option 3" {
    run option3.sh
}

@test "run option 4" {
    run option4.sh
}

@test "run option 5" {
    run option5.sh
}

@test "run option 6" {
    run option6.sh
}