#!/bin/bash
set -e

gaplint --github-annotations *.g lib/*.g tst/*.g
