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

def bfs(graph):
    mark = {}
    for v in graph:
        mark[v] = 0
    count = 0
    queue = deque([])
    for v in graph:
        if mark[v] == 0:
            count += 1
            mark[v] = count
            queue.append(v)
            while list(queue) != []:
                u = queue.popleft()
                for w in graph[u]:
                    if mark[w] == 0:
                        count += 1
                        mark[w] = count
                        queue.append(w)
    return mark

print(bfs(graph_1))
