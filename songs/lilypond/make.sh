#!/bin/sh
ant make -Dsong=`echo $1 | cut -d'.' -f1`
