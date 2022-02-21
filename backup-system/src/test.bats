#!/bin/bash

setup() {
    load "../test/test_helper/bats-support/load"
    load "../test/test_helper/bats-assert/load"
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

teardown() {
    rm -rf /home/markus/backups/*
}

@test "run script's usage" {
    run backup-system.sh -h
}

@test "silently backup single folder" {
    run backup-system.sh -b /home/markus/Pictures -d /home/markus/backups
}

@test "silently backup multiple folders" {
    run backup-system.sh -b "/home/markus/Pictures /home/markus/Downloads" -d /home/markus/backups
}

@test "interactively backup" {
    run backup-expect.sh
}