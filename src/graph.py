"""
Módulo para algoritmos de Teoria dos Grafos
"""


class Graph:
    """
    Classe para representar um grafo usando lista de adjacências.
    """
    
    def __init__(self, directed=False):
        """
        Inicializa um grafo.
        
        Args:
            directed (bool): True para grafo direcionado, False para não-direcionado
        """
        self.adjacency_list = {}
        self.directed = directed
    
    def add_vertex(self, vertex):
        """
        Adiciona um vértice ao grafo.
        
        Args:
            vertex: Identificador do vértice
        """
        if vertex not in self.adjacency_list:
            self.adjacency_list[vertex] = []
    
    def add_edge(self, vertex1, vertex2, weight=1):
        """
        Adiciona uma aresta entre dois vértices.
        
        Args:
            vertex1: Primeiro vértice
            vertex2: Segundo vértice
            weight: Peso da aresta (padrão: 1)
        """
        self.add_vertex(vertex1)
        self.add_vertex(vertex2)
        
        self.adjacency_list[vertex1].append((vertex2, weight))
        if not self.directed:
            self.adjacency_list[vertex2].append((vertex1, weight))
    
    def get_vertices(self):
        """
        Retorna todos os vértices do grafo.
        
        Returns:
            list: Lista de vértices
        """
        return list(self.adjacency_list.keys())
    
    def get_neighbors(self, vertex):
        """
        Retorna os vizinhos de um vértice.
        
        Args:
            vertex: Vértice a ser consultado
            
        Returns:
            list: Lista de tuplas (vizinho, peso)
        """
        return self.adjacency_list.get(vertex, [])
    
    def dfs(self, start_vertex):
        """
        Busca em profundidade (DFS) a partir de um vértice.
        
        Args:
            start_vertex: Vértice inicial
            
        Returns:
            list: Lista de vértices na ordem de visitação
        """
        visited = set()
        result = []
        
        def dfs_helper(vertex):
            visited.add(vertex)
            result.append(vertex)
            
            for neighbor, _ in self.get_neighbors(vertex):
                if neighbor not in visited:
                    dfs_helper(neighbor)
        
        dfs_helper(start_vertex)
        return result
    
    def bfs(self, start_vertex):
        """
        Busca em largura (BFS) a partir de um vértice.
        
        Args:
            start_vertex: Vértice inicial
            
        Returns:
            list: Lista de vértices na ordem de visitação
        """
        visited = set([start_vertex])
        queue = [start_vertex]
        result = []
        
        while queue:
            vertex = queue.pop(0)
            result.append(vertex)
            
            for neighbor, _ in self.get_neighbors(vertex):
                if neighbor not in visited:
                    visited.add(neighbor)
                    queue.append(neighbor)
        
        return result
