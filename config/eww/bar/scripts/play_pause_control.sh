#!/bin/bash

[[ `mpc status | grep paused` ]] && echo "" && exit || echo "" && exit
