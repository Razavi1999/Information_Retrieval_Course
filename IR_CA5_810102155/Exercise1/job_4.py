from mrjob.job import MRJob
import csv

class TopWordsTrueMR(MRJob):
    def configure_args(self):
        super(TopWordsTrueMR , self).configure_args()
        self.add_file_arg('--database')


    def mapper(self, _, line):
        # Split the line into fields using CSV reader
        row = next(csv.reader([line]))

        if len(row) > 8:
            # feedback_index = int(row[0])  # Assuming the feedback index is the first field
            feedback = row[7]  # Assuming the feedback text is the second field
            column_six = row[5]  # Assuming column[6] is the seventh field (index 6)

            if column_six.lower() == 'false':
                words = set(feedback.split())  # Split the feedback into words and create a set

                for word in words:
                    yield word, 1

    def reducer_init(self):
        self.top_words = []

    def reducer(self, word, counts):
        total_count = sum(counts)
        self.top_words.append((word, total_count))
        self.top_words = sorted(self.top_words, key=lambda x: x[1], reverse=True)[:5]

    def reducer_final(self):
        for word, count in self.top_words:
            yield word, count

if __name__ == '__main__':
    job = TopWordsTrueMR(args=['--database' , 'BA_AirlineReviews_output.csv'])
    job.run()
