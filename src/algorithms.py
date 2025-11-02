"""
Módulo contendo algoritmos de Matemática Discreta
"""


def factorial(n):
    """
    Calcula o fatorial de um número.
    
    Args:
        n (int): Número inteiro não-negativo
        
    Returns:
        int: Fatorial de n
        
    Raises:
        ValueError: Se n for negativo
        
    Examples:
        >>> factorial(0)
        1
        >>> factorial(5)
        120
    """
    if n < 0:
        raise ValueError("O fatorial não está definido para números negativos")
    if n == 0 or n == 1:
        return 1
    return n * factorial(n - 1)


def fibonacci(n):
    """
    Calcula o n-ésimo número de Fibonacci.
    
    Args:
        n (int): Posição na sequência de Fibonacci (começando em 0)
        
    Returns:
        int: N-ésimo número de Fibonacci
        
    Raises:
        ValueError: Se n for negativo
        
    Examples:
        >>> fibonacci(0)
        0
        >>> fibonacci(1)
        1
        >>> fibonacci(10)
        55
    """
    if n < 0:
        raise ValueError("N deve ser não-negativo")
    if n == 0:
        return 0
    if n == 1:
        return 1
    
    a, b = 0, 1
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b


def gcd(a, b):
    """
    Calcula o Máximo Divisor Comum (MDC) usando o algoritmo de Euclides.
    
    Args:
        a (int): Primeiro número
        b (int): Segundo número
        
    Returns:
        int: MDC de a e b
        
    Examples:
        >>> gcd(48, 18)
        6
        >>> gcd(100, 35)
        5
    """
    a, b = abs(a), abs(b)
    while b:
        a, b = b, a % b
    return a


def is_prime(n):
    """
    Verifica se um número é primo.
    
    Args:
        n (int): Número a ser verificado
        
    Returns:
        bool: True se n é primo, False caso contrário
        
    Examples:
        >>> is_prime(2)
        True
        >>> is_prime(17)
        True
        >>> is_prime(4)
        False
    """
    if n < 2:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    
    i = 3
    while i * i <= n:
        if n % i == 0:
            return False
        i += 2
    return True
