"""
Testes para o módulo graph
"""
import pytest
from src.graph import Graph


class TestGraph:
    def test_add_vertex(self):
        g = Graph()
        g.add_vertex(1)
        assert 1 in g.get_vertices()
    
    def test_add_edge_undirected(self):
        g = Graph(directed=False)
        g.add_edge(1, 2)
        assert (2, 1) in g.get_neighbors(1)
        assert (1, 1) in g.get_neighbors(2)
    
    def test_add_edge_directed(self):
        g = Graph(directed=True)
        g.add_edge(1, 2)
        assert (2, 1) in g.get_neighbors(1)
        assert len(g.get_neighbors(2)) == 0
    
    def test_get_neighbors(self):
        g = Graph()
        g.add_edge(1, 2)
        g.add_edge(1, 3)
        neighbors = g.get_neighbors(1)
        assert len(neighbors) == 2
    
    def test_dfs(self):
        g = Graph()
        g.add_edge(1, 2)
        g.add_edge(1, 3)
        g.add_edge(2, 4)
        
        result = g.dfs(1)
        assert result[0] == 1
        assert len(result) == 4
        assert set(result) == {1, 2, 3, 4}
    
    def test_bfs(self):
        g = Graph()
        g.add_edge(1, 2)
        g.add_edge(1, 3)
        g.add_edge(2, 4)
        
        result = g.bfs(1)
        assert result[0] == 1
        assert len(result) == 4
        assert set(result) == {1, 2, 3, 4}
    
    def test_weighted_edges(self):
        g = Graph()
        g.add_edge(1, 2, weight=5)
        neighbors = g.get_neighbors(1)
        assert (2, 5) in neighbors
