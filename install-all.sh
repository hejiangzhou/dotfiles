#!/bin/bash
cd "$(dirname "$0")"
find . -name install.sh -exec {} \;
