rm run*.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=bm25-version-6 --k=0.75 --b=0.12 \
 /home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run1.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=bm25-version-6 --k=1.75 --b=0.52 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run3.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=bm25-version-6 --k=2.75 --b=0.82 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run2.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=bm25-version-6 --k=4.75 --b=0.12 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run4.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=bm25-version-6 --k=8.75 --b=0.12 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run5.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=bm25-version-6 --k=8.75 --b=0.82 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run6.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=bm25-version-6 --k=18.75 --b=0.92 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run7.txt

/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago batch-search \
--requested=100 --index=/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile --scorer=bm25-version-6 --k=28.75 --b=0.92 \
/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json > run8.txt


/home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin/galago \
eval --judgments="/home/mahdi/Documents/bazyabi/Resources/2-Relevance/relevance.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/bm25-version-6/run1.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/bm25-version-6/run2.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/bm25-version-6/run3.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/bm25-version-6/run4.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/bm25-version-6/run5.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/bm25-version-6/run6.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/bm25-version-6/run7.txt" \
--runs+"/home/mahdi/Documents/bazyabi/runs/bm25-version-6/run8.txt" \
 --details=True --metrics+map --metrics+ndcg --metrics+p10
