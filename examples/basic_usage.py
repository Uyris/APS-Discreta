"""
Exemplos básicos de uso dos algoritmos de Matemática Discreta
"""
from src.algorithms import factorial, fibonacci, gcd, is_prime
from src.graph import Graph


def example_algorithms():
    """Exemplos de algoritmos básicos"""
    print("=== Algoritmos Básicos ===\n")
    
    # Fatorial
    print("Fatorial de 5:", factorial(5))
    
    # Fibonacci
    print("\nSequência de Fibonacci (primeiros 10 números):")
    fib_sequence = [fibonacci(i) for i in range(10)]
    print(fib_sequence)
    
    # MDC
    print("\nMDC de 48 e 18:", gcd(48, 18))
    
    # Números primos
    print("\nNúmeros primos até 20:")
    primes = [n for n in range(2, 21) if is_prime(n)]
    print(primes)


def example_graph():
    """Exemplo de uso de grafos"""
    print("\n\n=== Grafos ===\n")
    
    # Criar um grafo não-direcionado
    g = Graph(directed=False)
    
    # Adicionar arestas
    g.add_edge('A', 'B')
    g.add_edge('A', 'C')
    g.add_edge('B', 'D')
    g.add_edge('C', 'D')
    g.add_edge('D', 'E')
    
    print("Vértices do grafo:", g.get_vertices())
    
    # Busca em profundidade
    print("\nBusca em profundidade a partir de 'A':")
    print(g.dfs('A'))
    
    # Busca em largura
    print("\nBusca em largura a partir de 'A':")
    print(g.bfs('A'))


if __name__ == "__main__":
    example_algorithms()
    example_graph()
