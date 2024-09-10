#!/bin/bash

indexPath="/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile"
queryPath="/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json"
runPath="/home/mahdi/Documents/bazyabi/HW2-RUNS/additiveSmoothing"
judgmentsPath="/home/mahdi/Documents/bazyabi/Resources/2-Relevance/relevance.txt"

rm run*.txt

cd /home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin

# ./galago batch-search --requested=100 --index=$indexPath --scorer=additive $queryPath > $runPath/runAdditive1.txt

# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.15 $queryPath > $runPath/runJMS-1.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.25 $queryPath > $runPath/runJMS-2.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.33 $queryPath > $runPath/runJMS-3.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.45 $queryPath > $runPath/runJMS-4.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.56 $queryPath > $runPath/runJMS-5.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.62 $queryPath > $runPath/runJMS-6.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.75 $queryPath > $runPath/runJMS-7.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.853 $queryPath > $runPath/runJMS-8.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=JMSmoothing --landa=0.953 $queryPath > $runPath/runJMS-9.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=1 $queryPath  > $runPath/runDri-1.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=10 $queryPath > $runPath/runDri-2.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=20 $queryPath > $runPath/runDri-3.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=30 $queryPath > $runPath/runDri-4.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=45 $queryPath > $runPath/runDri-5.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=56 $queryPath > $runPath/runDri-6.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=67 $queryPath > $runPath/runDri-7.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=78 $queryPath > $runPath/runDri-8.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=87 $queryPath > $runPath/runDri-9.txt
# ./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=100 $queryPath > $runPath/runDri-10.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=100 --landa=0.15 $queryPath > $runPath/runTwo-1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=200 --landa=0.25 $queryPath > $runPath/runTwo-2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=40 --landa=0.33 $queryPath > $runPath/runTwo-3.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=5 --landa=0.45 $queryPath > $runPath/runTwo-4.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=50 --landa=0.56 $queryPath > $runPath/runTwo-5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=20 --landa=0.62 $queryPath > $runPath/runTwo-6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=2 --landa=0.75 $queryPath > $runPath/runTwo-7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=30 --landa=0.853 $queryPath > $runPath/runTwo-8.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=TwoStep --mu=1 --landa=0.953 $queryPath > $runPath/runTwo-9.txt

./galago eval \
--judgments=$judgmentsPath \
# --runs+$runPath/runAdditive1.txt \
# --runs+$runPath/runJMS-1.txt \
# --runs+$runPath/runJMS-2.txt \
# --runs+$runPath/runJMS-3.txt \
# --runs+$runPath/runJMS-4.txt \
# --runs+$runPath/runJMS-5.txt \
# --runs+$runPath/runJMS-6.txt \
# --runs+$runPath/runJMS-7.txt \
# --runs+$runPath/runJMS-8.txt \
# --runs+$runPath/runJMS-9.txt \
# --runs+$runPath/runDri-1.txt \
# --runs+$runPath/runDri-2.txt \
# --runs+$runPath/runDri-3.txt \
# --runs+$runPath/runDri-4.txt \
# --runs+$runPath/runDri-5.txt \
# --runs+$runPath/runDri-6.txt \
# --runs+$runPath/runDri-7.txt \
# --runs+$runPath/runDri-8.txt \
# --runs+$runPath/runDri-9.txt \
# --runs+$runPath/runDri-10.txt \
--runs+$runPath/runTwo-1.txt \
--runs+$runPath/runTwo-2.txt \
--runs+$runPath/runTwo-3.txt \
--runs+$runPath/runTwo-4.txt \
--runs+$runPath/runTwo-5.txt \
--runs+$runPath/runTwo-6.txt \
--runs+$runPath/runTwo-7.txt \
--runs+$runPath/runTwo-8.txt \
--runs+$runPath/runTwo-9.txt \
--details=True --metrics+map --metrics+ndcg --metrics+p10
