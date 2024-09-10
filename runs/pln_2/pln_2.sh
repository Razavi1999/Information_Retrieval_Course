rm run*.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=PLN_2 --k=0.75 --b=0.12 \
 /home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run1.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=PLN_2 --k=1.75 --b=0.52 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run3.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=PLN_2 --k=2.75 --b=0.82 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run2.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=PLN_2 --k=4.75 --b=0.12 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run4.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=PLN_2 --k=8.75 --b=0.12 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run5.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=PLN_2 --k=8.75 --b=0.82 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run6.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=PLN_2 --k=18.75 --b=0.92 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run7.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=PLN_2 --k=28.75 --b=0.92 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run8.txt


/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago \
eval --judgments="/home/mahdi/Documents/bazyabi/Resources/2-Relevance/relevance.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/pln_2/run1.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/pln_2/run2.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/pln_2/run3.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/pln_2/run4.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/pln_2/run5.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/pln_2/run6.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/pln_2/run7.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/pln_2/run8.txt" \
 --details=True --metrics+map --metrics+ndcg --metrics+p10
