#!/bin/bash

MAXSCRIPTITERS=2
ALL_TESTS=(
    "runPerformanceTestNormalFlowCurrentBehaviour"
    "runPerformanceTestPIC"
    "runPerformanceTestJIT"
    "runPerformanceTestNormalFlowWorstCase"
)

declare -A METHODS_BY_GROUP

METHODS_BY_GROUP[asArray]="a1 a2 a3 a5 a8 a13 a21 a34"
METHODS_BY_GROUP[copy]="c1 c2 c3 c5 c8 c13 c21 c34"
METHODS_BY_GROUP[includes]="i1 i2 i3 i5 i8 i13 i21 i34"
METHODS_BY_GROUP[size]="s1 s2 s3 s5 s8 s13 s21 s34"

GROUP_ORDER=(asArray copy includes size)


TIMES=$1
GCTIMES=1
RUNNAME=""

# MEASUREUNIT="'msNoGc'"
MEASUREUNIT="'us'"

# VMPARAMS="-vm-display-null -vm-sound-null -codesize 100m -eden 1024m"
# VMPARAMS="-vm-display-null -vm-sound-null -noevents -memory 12g -eden 8g" #-codesize 4096m"
# VMPARAMS="-vm-display-null -vm-sound-null -noevents -memory 2g -eden 1g"

VMPARAMS="-vm-display-null -vm-sound-null -noevents"

for i in $(seq -w 1 $MAXSCRIPTITERS); do
    echo "Iteration $i of $MAXSCRIPTITERS"

    for TEST in "${ALL_TESTS[@]}"; do
        for GROUP in "${GROUP_ORDER[@]}"; do
            for METHOD in ${METHODS_BY_GROUP[$GROUP]}; do
                for PICENTRIES in $(seq 1 6); do
                    for REPEAT_TIME in $(seq 1 100); do
                        echo "Running $TEST for $PICENTRIES..."

                        RUNNAME="'$GROUP/run$i'"
                        RESULT=$(./scripts/performance-runner.sh $TEST $PICENTRIES \'$METHOD\' $TIMES $GCTIMES $RUNNAME $MEASUREUNIT $VMPARAMS)

                        echo "Finished $TEST with result: $RESULT."
                        echo "-----------------------------"

                        sleep 0.3s
                    done
                done
            done
        done
    done
done
