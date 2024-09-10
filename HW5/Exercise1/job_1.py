import csv
import io
from mrjob.job import MRJob

class BooleanColumnMR(MRJob):
    def configure_args(self):
        super(BooleanColumnMR , self).configure_args()
        self.add_file_arg('--database')

    def mapper(self, _, line):
        byte_line = line.encode('utf-8')  # Encode the line to bytes
        text_line = byte_line.decode('utf-8')  # Decode the byte line to text
        file_like = io.StringIO(text_line)  # Create a file-like object from the text line
        reader = csv.reader(file_like)

        for row in reader:
            # print(f'len row : {len(row)} \n')
            if len(row) > 6:
                # splitted = row.split(',')
                value = row[5].lower()  # Assuming the 6th column is at index 5 (0-based index)

                if value == 'true':
                    yield 'True', 1
                elif value == 'false':
                    yield 'False', 1

    def reducer(self, key, values):
        yield key, sum(values)

if __name__ == '__main__':
    job = BooleanColumnMR(args=['--database', 'BA_AirlineReviews.csv'])
    # print('Im here !!!')
    job.run()

    # CountFalseTrue.run()
