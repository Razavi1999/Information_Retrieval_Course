import subprocess
import pandas as pd
import io

# Define the range and step size for the coarse and fine searches
coarse_search_range = {"k": range(1, 101, 10)}
fine_search_range = {"k": range(1, 11)}

galago_path = '/home/mj/Desktop/galago/galago/galago-3.16/core/target/appassembler/bin/galago'
corpus_path = '/home/mj/Desktop/IR4021_CA1/0-Corpus/documents.trectxt'
queries_path = '/home/mj/Desktop/IR4021_CA1/1-Queries/queries_fixed.json'
relevance_path = '/home/mj/Desktop/IR4021_CA1/2-Relevance/relevance.txt'
index_path = '/home/mj/Desktop/IR4021_CA1/Index'
baseline_path = '/home/mj/Desktop/IR4021_CA1/baseline.txt'
metrics = ['map', 'ndcg', 'p10', 'num_rel', 'num_ret', 'num_rel_ret']
requested_count = 300

# Function to run the search
def run_search(k_values):
    # Initialize a list to store the results
    results = []
    for k in k_values:
        # Run the batch-search command
        search_command = f"{galago_path} batch-search --index={index_path} --requested={requested_count} --scorer=My2ndScoringIterator --k={k} {queries_path}".split(' ')
        search_result = subprocess.check_output(search_command)
        res_split = str(search_result)[2:-1].split(sep='\\n')
        print(" start --> Cmd ran", end="\r")
        with io.open(f'{baseline_path}', 'w') as f:
            for s in res_split[:-1]:
                f.write(s + '\n')
            f.write(res_split[-1])

        # Run the eval command
        eval_command = f"{galago_path} eval --judgments={relevance_path} --baseline={baseline_path} {' '.join(f'--metrics+{metric}' for metric in metrics)}".split(' ')
        eval_result = subprocess.check_output(eval_command)

        eval_split = str(eval_result)[2:-1].split(sep='\\n')
        sp = eval_split[0].split(sep=' ')
        print(" start --> Cmd ran --> eval done", end="\r")

        map = float(eval_split[0].split(sep=' ')[-1])
        ndcg = float(eval_split[1].split(sep=' ')[-1])
        p10 = float(eval_split[2].split(sep=' ')[-1])
        num_rel = float(eval_split[3].split(sep=' ')[-1])
        num_ret = float(eval_split[4].split(sep=' ')[-1])
        num_rel_ret = float(eval_split[5].split(sep=' ')[-1])
        recall = num_rel_ret / num_rel

        # Add the result to the list
        results.append({"k": k, "map": map, 'ndcg': ndcg, 'p10':p10, 'recall':recall})
    return results

# Run the coarse search
res1 = run_search(coarse_search_range["k"])

df1 = pd.DataFrame(res1)
df1.to_csv("hyperparameter_pre_results_2.csv", index=False)

# Find the k and b values that gave the highest MAP value
best_result = max(res1, key=lambda x: x["map"])
best_k = best_result["k"]

# Define the range for the fine search around the best k and b values from the coarse search
fine_search_range["k"] = range(max(1, best_k - 5), min(101, best_k + 6))

# Run the fine search
res2 = run_search(fine_search_range["k"])

# Convert the results to a DataFrame and save it as a CSV file
df2 = pd.DataFrame(res2)
df2.to_csv("hyperparameter_tuning_results_2.csv", index=False)
