#!/bin/bash

MAXSCRIPTITERS=2
ALL_TESTS=(
    "runPerformanceTestNormalFlowCurrentBehaviour"
    "runPerformanceTestPIC"
    "runPerformanceTestJIT"
    "runPerformanceTestNormalFlowWorstCase"
)

declare -A METHODS_BY_GROUP

METHODS_BY_GROUP[depth]="depth1 depth2 depth3 depth5 depth8 depth13 depth21 depth34"
GROUP_ORDER=(depth)

TIMES=$1
RUNNAME=""
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
                        RESULT=$(./scripts/performance-depth-runner.sh $TEST $PICENTRIES \'$METHOD\' $TIMES $RUNNAME $VMPARAMS)

                        echo "Finished $TEST with result: $RESULT."
                        echo "-----------------------------"

                        sleep 0.3s
                    done
                done
            done
        done
    done
done
