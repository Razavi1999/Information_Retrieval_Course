import networkx as nx
import matplotlib.pyplot as plt

G = nx.DiGraph()

cnt = 1
with open('web-Google.txt', 'r') as f:
    lines = f.readlines()
    for line in lines:
        if line[0] == '#':
            continue

        line = str(line)

        words = line.split('\t')

        if len(words) > 1:
            firstNode = words[0]
            secondNode = words[1]

            firstNode = firstNode.replace('\n' , '')
            secondNode = secondNode.replace('\n' , '')
            # print(f"FirstNode: {firstNode} \n SecondNode: {secondNode}")

        # print('------------------')

        cnt += 1

        G.add_edge(firstNode , secondNode , weight = 1)

max_subgraph = None
max_nodes = 0


# Find the weakly connected component subgraphs
# Find the weakly connected components
weakly_connected_components = nx.weakly_connected_components(G)

# Find the largest weakly connected component
largest_component = max(weakly_connected_components, key=len)

# Create a subgraph of the largest component
largest_component_subgraph = G.subgraph(largest_component)


print('***********************************************')

print(f'len of nodes of largest_component_subgraph : {len(largest_component_subgraph.nodes())}\n')

print(f'len of edges of largest_component_subgraph : {len(largest_component_subgraph.edges())} \n')
# for each in max_subgraph.edges():
#     print(each)

print('*********************************************')

# print(max_nodes)
# largest = max(nx.weakly_connected_components(G) , key=len)
# print(largest.nodes())
# print(largest.edges())

# Second part of this # QUESTION: 2
# Calculate the PageRank scores
pagerank_scores = nx.pagerank(largest_component_subgraph)

# Draw the histogram diagram
# plt.hist(list(pagerank_scores.values()) , bins = 50)
# plt.xlabel('Nodes')
# plt.ylabel('PageRank Score')
# plt.title('PageRank Scores')
# plt.show()
# plt.savefig("pagerank.png")


# # Calculate the Hub and Authority scores
hub_scores, authority_scores = nx.hits(largest_component_subgraph)

# Draw the histogram diagram for Hub scores
# plt.hist(list(hub_scores.values()), bins = 50)
# plt.xlabel('Nodes')
# plt.ylabel('Hub Score')
# plt.title('Hub Scores')
# plt.show()
# plt.savefig("HubScores.png")

# Draw the histogram diagram for Authority scores
# plt.hist(list(authority_scores.values() ), bins = 50)
# plt.xlabel('Nodes')
# plt.ylabel('Authority Score')
# plt.title('Authority Scores')
# plt.show()
# plt.savefig("AuthorityScores.png")

# -----------------------------------------------------


# third part of this # QUESTION: 3
top_pagerank_nodes = []

setA = set( pagerank_scores )
setB = set( hub_scores )
setC = set( authority_scores)

commonNodes_pageRank_hub = setA.intersection( setB )
commonNodes_pageRank_authority = setA.intersection( setC )
commonNodes_authority_hub = setB.intersection( setC )

print(f'Number of common nodes between PageRank and Hub : {len(commonNodes_pageRank_hub)}')
print(f'Number of common nodes between PageRank and authority : {len(commonNodes_pageRank_authority)}')
print(f'Number of common nodes between authority and Hub : {len(commonNodes_authority_hub)}')
