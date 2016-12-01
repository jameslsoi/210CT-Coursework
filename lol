class Node(object):
    def __init__(self, value):
        self.value = value

class Graph(object):
    def __init__(self):
        """Node to list of neighbors hashtable (dict/dictionary in python)"""
        self.nodes = {}

    def nodes(self):
        """Returns all the nodes of the graph"""
        return self.nodes.keys()

    def edges(self):
        """Returns all the edges of a graph"""
        edges = []
        for node in self.nodes:
            for incident in self.nodes[node]:
                edge = (node, incident)
                if edge not in edges:
                    edges.append(edge)
        return edges

    def insert_node(self, value, x):
        """Insert a node with a value which is a neighbor of x"""
        node = Node(value)
        self.nodes[node] = [x]
        self.nodes[x].append(node)

    def remove_node(self, node):
        """Removes a given node  of the graph"""
        for node in self.nodes:
            if node in self.nodes[node]:
                self.nodes[node].remove(node)
        del self.nodes[node]
