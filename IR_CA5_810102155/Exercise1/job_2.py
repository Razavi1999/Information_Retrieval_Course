import csv
from mrjob.job import MRJob

class InvertedIndex(MRJob):

    def mapper(self, _, line):
        reader = csv.reader([line])
        for row in reader:
            if len(row) > 8 :
                text = row[7]
                # Assuming the textual column is the senventh column
                # words = text.split()
                for word in text:
                    yield word, row[0]  # Emitting the word as the key and the row index as the value

    def reducer(self, word, row_indices):
        yield word, ','.join(row_indices)

if __name__ == '__main__':
    InvertedIndex.run()
