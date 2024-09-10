#!/bin/bash
inPath="/home/mahdi/Documents/bazyabi/Resources/0-Corpus/documents.trectxt"
inIndex=""
cd /home/mahdi/Documents/bazyabi/Installation/galago/galago/galago-3.16/core/target/appassembler/bin


./galago build --server=true --port=60000 --inputPath=$inPath --indexPath=$inIndex \
--nonStemmedPostings=true --stemmedPostings=true --stemmer+porter \
--corpus=true --tokenizer/fields+docno --tokenizer/fields+head --tokenizer/fields+text
