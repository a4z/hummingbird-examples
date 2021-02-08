#!/bin/bash

set -eux

build_example()
{
    EXAMPLE=$1
    pushd "$EXAMPLE"
    swift package update
    swift package edit hummingbird --revision main
    swift build
    swift package unedit hummingbird
    popd
}

# Test latest code against for examples
build_example hello
build_example html-form
build_example http2
build_example todos-dynamodb
build_example todos-fluent
