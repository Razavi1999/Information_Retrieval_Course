#!/bin/bash

indexPath="/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile"
queryPath="/home/mahdi/Documents/bazyabi/CA1_Extra/queries_fixed.json"
runPath="/home/mahdi/Documents/bazyabi/runs/bm25-version-1"
judgmentsPath="/home/mahdi/Documents/bazyabi/Resources/2-Relevance/relevance.txt"

rm run*.txt

cd /home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin

# ./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=0.75 --b=0.92 --delta=0.1 $queryPath > $runPath/run1-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=0.75 --b=0.92 $queryPath > $runPath/run1-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=1.75 --b=0.72 $queryPath > $runPath/run2-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=2.75 --b=0.52 $queryPath > $runPath/run3-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=4.75 --b=0.32 $queryPath > $runPath/run4-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=8.75 --b=0.12 $queryPath > $runPath/run5-v5.txt

./galago eval \
--judgments=$judgmentsPath \
--runs+"$runPath/run1-v5.txt" \
--runs+"$runPath/run2-v5.txt" \
--runs+"$runPath/run3-v5.txt" \
--runs+"$runPath/run4-v5.txt" \
--runs+"$runPath/run5-v5.txt" \
--details=True --metrics+map --metrics+ndcg --metrics+p10
