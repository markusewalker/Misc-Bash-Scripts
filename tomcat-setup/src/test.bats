#!/bin/bash

setup() {
    load "../test/test_helper/bats-support/load"
    load "../test/test_helper/bats-assert/load"
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}

@test "verify script can run" {
    run setup-tomcat.sh
}

@test "run usage" {
    run setup-tomcat.sh -h
}

@test "check Tomcat was downloaded" {
    RESULT="$HOME/apache-tomcat-*"
    [ -d "$RESULT" ]
}

@test "check extracted file was removed" {
    RESULT="$HOME/apache-tomcat-*.tar.gz"
    [ ! -d "$RESULT" ]
}

@test "check to see if Tomcat manager is enabled" {
    grep -i 'manager-gui' "$HOME/apache-tomcat-*/conf/tomcat-users.xml"
    RESULT=$?
    [ $RESULT -eq 0 ]
}

@test "verify pots are 80/443 in server.xml" {
    grep -i 'Connector port="80"' "$HOME/apache-tomcat-*/conf/server.xml"
    RESULT=$?
    [ $RESULT -eq 0 ]
}
