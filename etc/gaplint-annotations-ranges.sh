#!/bin/bash
set -e

gaplint --github-annotations --ranges *.g lib/*.g tst/*.g
