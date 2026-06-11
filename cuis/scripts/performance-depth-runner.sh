#!/bin/bash

TEST=$1
PICENTRIES=$2
METHOD=$3
TIMES=$4
RUNNAME=$5
shift 5
VMPARAMS="$@"

COMMAND="DepthPICBenchmark initializeWithPicEntries: $PICENTRIES stressMethod: $METHOD iterate: $TIMES saveItAsIterationName: $RUNNAME! DepthPICBenchmark $TEST!"

echo "Running: "
echo $COMMAND "with VMPARAMS: [$VMPARAMS]"

echo $COMMAND | ./vm-pic/latest/squeak $VMPARAMS CuisUniversity-7641-reader.image

RESULT=$?
echo "ExitCode: $RESULT"
