#!/bin/bash

indexPath="/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile"
queryPath="/home/mahdi/Documents/bazyabi/CA1_Extra/queries_fixed.json"
runPath="/home/mahdi/Documents/bazyabi/runs/bm25-version-1"
judgmentsPath="/home/mahdi/Documents/bazyabi/Resources/2-Relevance/relevance.txt"

rm run*.txt

cd /home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin

./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-1 --k=0.75 --b=0.12 $queryPath > $runPath/run1-v1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-1 --k=1.75 --b=0.52 $queryPath > $runPath/run2-v1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-1 --k=0.75 --b=0.82 $queryPath > $runPath/run3-v1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-1 --k=2.75 --b=0.12 $queryPath > $runPath/run4-v1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-2 --k=0.75 --b=0.12  $queryPath   > $runPath/run1-v2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-2 --k=1.75 --b=0.52   $queryPath  > $runPath/run2-v2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-2 --k=10.75 --b=0.82  $queryPath  > $runPath/run3-v2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-2 --k=112.75 --b=0.12 $queryPath  > $runPath/run4-v2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-3 --k=0.75 --b=0.12 $queryPath > $runPath/run1-v3.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-3 --k=1.75 --b=0.52 $queryPath > $runPath/run2-v3.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-3 --k=2.75 --b=0.82 $queryPath > $runPath/run3-v3.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-3 --k=4.75 --b=0.12 $queryPath > $runPath/run4-v3.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-3 --k=8.75 --b=0.12 $queryPath > $runPath/run5-v3.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-4 --k=0.75 --b=0.92 $queryPath > $runPath/run1-v4.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-4 --k=1.75 --b=0.72 $queryPath > $runPath/run2-v4.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-4 --k=2.75 --b=0.52 $queryPath > $runPath/run3-v4.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-4 --k=4.75 --b=0.32 $queryPath > $runPath/run4-v4.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-4 --k=8.75 --b=0.12 $queryPath > $runPath/run5-v4.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=0.75 --b=0.92 $queryPath > $runPath/run1-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=1.75 --b=0.72 $queryPath > $runPath/run2-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=2.75 --b=0.52 $queryPath > $runPath/run3-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=4.75 --b=0.32 $queryPath > $runPath/run4-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-5 --k=8.75 --b=0.12 $queryPath > $runPath/run5-v5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=0.75 --b=0.92 --delta=0.1 $queryPath > $runPath/run1-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=1.75 --b=0.72 --delta=0.3 $queryPath > $runPath/run2-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=2.75 --b=0.52 --delta=0.5 $queryPath > $runPath/run3-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=4.75 --b=0.32 --delta=0.7 $queryPath > $runPath/run4-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=8.75 --b=0.12 --delta=0.9 $queryPath > $runPath/run5-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=4.75 --b=0.32 --delta=0.2 $queryPath > $runPath/run6-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=8.75 --b=0.12 --delta=0.4 $queryPath > $runPath/run7-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=1.75 --b=0.72 --delta=0.03 $queryPath > $runPath/run8-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=2.75 --b=0.52 --delta=0.95 $queryPath > $runPath/run9-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-6 --k=2.75 --b=0.52 --delta=0.55 $queryPath > $runPath/run10-v6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=0.75 --b=0.92 --delta=0.1 $queryPath > $runPath/run1-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=1.75 --b=0.72 --delta=0.3 $queryPath > $runPath/run2-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=2.75 --b=0.52 --delta=0.5 $queryPath > $runPath/run3-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=4.75 --b=0.32 --delta=0.7 $queryPath > $runPath/run4-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=8.75 --b=0.12 --delta=0.9 $queryPath > $runPath/run5-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=4.75 --b=0.32 --delta=0.2 $queryPath > $runPath/run6-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=8.75 --b=0.12 --delta=0.4 $queryPath > $runPath/run7-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=1.75 --b=0.72 --delta=0.03 $queryPath > $runPath/run8-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=2.75 --b=0.52 --delta=0.95 $queryPath > $runPath/run9-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=bm25-version-7 --k=2.75 --b=0.52 --delta=0.55 $queryPath > $runPath/run10-v7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_1 --k=0.75 --b=0.92 $queryPath > $runPath/run1-pln1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_1 --k=1.75 --b=0.72 $queryPath > $runPath/run2-pln1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_1 --k=2.75 --b=0.52 $queryPath > $runPath/run3-pln1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_1 --k=4.75 --b=0.32 $queryPath > $runPath/run4-pln1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_1 --k=8.75 --b=0.12 $queryPath > $runPath/run5-pln1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_2 --k=0.75 --b=0.92 $queryPath > $runPath/run1-pln2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_2 --k=1.75 --b=0.72 $queryPath > $runPath/run2-pln2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_2 --k=2.75 --b=0.52 $queryPath > $runPath/run3-pln2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_2 --k=4.75 --b=0.32 $queryPath > $runPath/run4-pln2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=PLN_2 --k=8.75 --b=0.12 $queryPath > $runPath/run5-pln2.txt
./galago eval \
--judgments=$judgmentsPath \
--runs+"$runPath/run1-v1.txt" \
--runs+"$runPath/run2-v1.txt" \
--runs+"$runPath/run3-v1.txt" \
--runs+"$runPath/run4-v1.txt" \
--runs+"$runPath/run1-v2.txt" \
--runs+"$runPath/run2-v2.txt" \
--runs+"$runPath/run3-v2.txt" \
--runs+"$runPath/run4-v2.txt" \
# --runs+"$runPath/run1-v3.txt" \
# --runs+"$runPath/run2-v3.txt" \
# --runs+"$runPath/run3-v3.txt" \
# --runs+"$runPath/run4-v3.txt" \
# --runs+"$runPath/run5-v3.txt" \
# --runs+"$runPath/run1-v4.txt" \
# --runs+"$runPath/run2-v4.txt" \
# --runs+"$runPath/run3-v4.txt" \
# --runs+"$runPath/run4-v4.txt" \
# --runs+"$runPath/run5-v4.txt" \
# --runs+"$runPath/run1-v5.txt" \
# --runs+"$runPath/run2-v5.txt" \
# --runs+"$runPath/run3-v5.txt" \
# --runs+"$runPath/run4-v5.txt" \
# --runs+"$runPath/run5-v5.txt" \
# --runs+"$runPath/run1-v6.txt" \
# --runs+"$runPath/run2-v6.txt" \
# --runs+"$runPath/run3-v6.txt" \
# --runs+"$runPath/run4-v6.txt" \
# --runs+"$runPath/run5-v6.txt" \
# --runs+"$runPath/run6-v6.txt" \
# --runs+"$runPath/run7-v6.txt" \
# --runs+"$runPath/run8-v6.txt" \
# --runs+"$runPath/run9-v6.txt" \
# --runs+"$runPath/run10-v6.txt" \
# --runs+"$runPath/run1-v7.txt" \
# --runs+"$runPath/run2-v7.txt" \
# --runs+"$runPath/run3-v7.txt" \
# --runs+"$runPath/run4-v7.txt" \
# --runs+"$runPath/run5-v7.txt" \
# --runs+"$runPath/run6-v7.txt" \
# --runs+"$runPath/run7-v7.txt" \
# --runs+"$runPath/run8-v7.txt" \
# --runs+"$runPath/run9-v7.txt" \
# --runs+"$runPath/run10-v7.txt" \
# --runs+"$runPath/run1-pln1.txt" \
# --runs+"$runPath/run2-pln1.txt" \
# --runs+"$runPath/run3-pln1.txt" \
# --runs+"$runPath/run4-pln1.txt" \
# --runs+"$runPath/run5-pln1.txt" \
# --runs+"$runPath/run1-pln2.txt" \
# --runs+"$runPath/run2-pln2.txt" \
# --runs+"$runPath/run3-pln2.txt" \
# --runs+"$runPath/run4-pln2.txt" \
# --runs+"$runPath/run5-pln2.txt" \
--details=True --metrics+map --metrics+ndcg --metrics+p10
