#!/bin/bash

setup() {
    load "../test/test_helper/bats-support/load"
    load "../test/test_helper/bats-assert/load"
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

@test "run script's usage" {
    run user-management.sh -h
}

@test "interactively add user" {
    run add-user.sh
}

@test "interactively delete user" {
    run del-user.sh
}

@test "interactively add group" {
    run add-group.sh
}

@test "interactively delete group" {
    run del-group.sh
}

@test "silently add user" {
    run silent-add-user.sh
}

@test "silently delete user" {
    run silent-remove-user.sh
}

@test "silently add group" {
    run silent-add-group.sh
}

@test "silently delete group" {
    run silent-remove-group.sh
}