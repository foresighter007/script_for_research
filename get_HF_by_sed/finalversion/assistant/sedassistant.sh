#!/bin/bash

function arrangement()
{
    cat calc_result | sed -nf sedassistant >> calc_result_arranged
}

arrangement $1

exit 0
