class Dfs(object):
    """
    lalala
    """

    def __init__(self, graph=None):
        self._mark = {}
        self._count = 0
        self._graph = graph


    def debug(self):
        '''using adjacency list'''
        graph_1 = {
            'a': ['b', 'c', 'd', 'e'],
            'b': ['a', 'd', 'e'],
            'c': ['a'],
            'd': ['a', 'b', 'e'],
            'e': ['a', 'b', 'd'],
            'f': ['g'],
            'g': ['f']
        }
        print(self.dfs(graph_1))


    def dfs(self, graph=None):
        if graph is None:
            graph = self._graph
        for v in graph:
            self._mark[v] = 0
            # print(self._mark)
        for v in self._mark:
            if self._mark[v] == 0:
                self.dfs_explore(v, graph)
        return self._mark, self._count


    def dfs_explore(self, v, graph):
        self._count += 1
        self._mark[v] = self._count
        # print(self._mark)
        for w in graph[v]:
            if self._mark[w] == 0:
                self.dfs_explore(w, graph)

# debug()
a = Dfs()
a.debug()
