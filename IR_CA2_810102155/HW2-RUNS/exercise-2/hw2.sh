indexPath="/home/mahdi/Documents/bazyabi/Resources/indexFile/indexFile"
queryPath="/home/mahdi/Documents/bazyabi/Resources/1-Queries/qureies.json"
runPath="/home/mahdi/Documents/bazyabi/HW2/Resources/doc_ranking.txt"
judgmentsPath="/home/mahdi/Documents/bazyabi/Resources/2-Relevance/relevance.txt"

rm run*.txt

cd /home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin

./galago eval \
--judgments=$judgmentsPath \
--runs+$runPath \
--details=True --metrics+map --metrics+ndcg --metrics+p10
