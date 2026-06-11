#!/bin/bash

TEST=$1
PICENTRIES=$2
METHOD=$3
TIMES=$4
GCTIMES=$5
RUNNAME=$6
MEASUREUNIT=$7

shift 7
VMPARAMS="$@"

COMMAND="PerformanceTest initializeWithPicEntries: $PICENTRIES stresMethod: $METHOD iterate: $TIMES gcTimes: $GCTIMES saveItAsIterationName: $RUNNAME withMeasureUnit: $MEASUREUNIT! PerformanceTest $TEST!"

echo "Running: "
echo $COMMAND

echo $COMMAND | ./vm-pic/latest/squeak $VMPARAMS CuisUniversity-7641-reader.image

RESULT=$?
echo "ExitCode: $RESULT"
