#!/bin/bash

setup() {
    load "../test/test_helper/bats-support/load"
    load "../test/test_helper/bats-assert/load"
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

@test "run script's usage" {
    run ./kwanzaa.sh -h
}

@test "select option 1" {
    run ./choice1.sh
}

@test "select option 2" {
    run ./choice2.sh
}

@test "select option 3" {
    run ./choice3.sh
}

@test "select option 4" {
    run ./choice4.sh
}

@test "select option 5" {
    run ./choice5.sh
}

@test "select option 6" {
    run ./choice6.sh
}

@test "select option 7" {
    run ./choice7.sh
}

@test "select option 8" {
    run ./choice8.sh
}

@test "select option 9" {
    run ./choice9.sh
}

@test "select option 10" {
    run ./choice10.sh
}

@test "select all options" {
    run ./repeat-choice.sh
}
