from collections import deque
# A linked list
graph_1 = {
    'a': ['b', 'c', 'd', 'e'],
    'b': ['a', 'd', 'e'],
    'c': ['a'],
    'd': ['a', 'b', 'e'],
    'e': ['a', 'b', 'd'],
    'f': ['g'],
    'g': ['f']
}

# This function aims to find all the distance from a node v to any other nodes
# in the graph.
def distance(graph, v):
    dist = {}
    for key in graph_1:
        dist[key] = float('inf')
    dist[v] = 0
    queue = deque([])
    queue.append(v)
    while len(queue) != 0:
        u = queue.popleft()
        for w in graph[u]:# same as for each (u, w) in E
            if dist[w] == float('inf'):
                dist[w] = dist[u] + 1
                queue.append(w)
    return dist

print(distance(graph_1, 'c'))

def hub(graph):
    h = 0
    min_remote = float('inf')
    for v in graph:
        dist = distance(graph, v)
        max_distance = -float('inf')
        for j in graph:
            if dist[j] >= max_distance:
                max_distance = dist[j]
        if max_distance <= min_remote:
            # If compare with only <, an unconnected graph may have two nodes
            # with the same min_remote of infite. Thus, this if statement will
            # be False and h will never be assigned value (it keeps value as
            # h = 0.
            min_remote = max_distance
            h = v
    return h

def main():
    print(hub(graph_1))

main()
