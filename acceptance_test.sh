#!/bin/bash
test $(curl localhost:9876/sum?a=1\&b=2) -eq 3
