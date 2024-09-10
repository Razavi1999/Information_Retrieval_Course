#!/bin/bash
indexPath="/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile"
queryPath="/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json"
runPath="/home/mahdi/Documents/bazyabi/HW2-RUNS/DirichletSmoothing"
judgmentsPath="/home/mahdi/Documents/bazyabi/Resources/2-Relevance/relevance.txt"

rm run*.txt

cd /home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin


./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=1 $queryPath  > $runPath/runDri-1.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=10 $queryPath > $runPath/runDri-2.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=20 $queryPath > $runPath/runDri-3.txt
#!/bin/bash

indexPath="/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile"
queryPath="/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json"
runPath="/home/mahdi/Documents/bazyabi/HW2-RUNS/additiveSmoothing"
judgmentsPath="/home/mahdi/Documents/bazyabi/Resources/2-Relevance/relevance.txt"

rm run*.txt
cd /home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin

./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=30 $queryPath > $runPath/runDri-4.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=45 $queryPath > $runPath/runDri-5.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=56 $queryPath > $runPath/runDri-6.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=67 $queryPath > $runPath/runDri-7.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=78 $queryPath > $runPath/runDri-8.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=87 $queryPath > $runPath/runDri-9.txt
./galago batch-search --requested=100 --index=$indexPath --scorer=Dirichlet --mu=100 $queryPath > $runPath/runDri-10.txt

./galago eval \
--judgments=$judgmentsPath \
--runs+$runPath/runDri-1.txt \
--runs+$runPath/runDri-2.txt \
--runs+$runPath/runDri-3.txt \
--runs+$runPath/runDri-4.txt \
--runs+$runPath/runDri-5.txt \
--runs+$runPath/runDri-6.txt \
--runs+$runPath/runDri-7.txt \
--runs+$runPath/runDri-8.txt \
--runs+$runPath/runDri-9.txt \
--runs+$runPath/runDri-10.txt \
--details=True --metrics+map --metrics+ndcg --metrics+p10
