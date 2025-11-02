"""
Testes para o módulo algorithms
"""
import pytest
from src.algorithms import factorial, fibonacci, gcd, is_prime


class TestFactorial:
    def test_factorial_zero(self):
        assert factorial(0) == 1
    
    def test_factorial_one(self):
        assert factorial(1) == 1
    
    def test_factorial_positive(self):
        assert factorial(5) == 120
        assert factorial(10) == 3628800
    
    def test_factorial_negative(self):
        with pytest.raises(ValueError):
            factorial(-1)


class TestFibonacci:
    def test_fibonacci_zero(self):
        assert fibonacci(0) == 0
    
    def test_fibonacci_one(self):
        assert fibonacci(1) == 1
    
    def test_fibonacci_sequence(self):
        assert fibonacci(2) == 1
        assert fibonacci(5) == 5
        assert fibonacci(10) == 55
    
    def test_fibonacci_negative(self):
        with pytest.raises(ValueError):
            fibonacci(-1)


class TestGCD:
    def test_gcd_basic(self):
        assert gcd(48, 18) == 6
        assert gcd(100, 35) == 5
    
    def test_gcd_coprime(self):
        assert gcd(17, 19) == 1
    
    def test_gcd_same_number(self):
        assert gcd(42, 42) == 42
    
    def test_gcd_with_zero(self):
        assert gcd(0, 5) == 5
        assert gcd(5, 0) == 5
    
    def test_gcd_negative(self):
        assert gcd(-48, 18) == 6
        assert gcd(48, -18) == 6


class TestIsPrime:
    def test_small_primes(self):
        assert is_prime(2) == True
        assert is_prime(3) == True
        assert is_prime(5) == True
        assert is_prime(7) == True
    
    def test_not_prime(self):
        assert is_prime(0) == False
        assert is_prime(1) == False
        assert is_prime(4) == False
        assert is_prime(9) == False
    
    def test_larger_primes(self):
        assert is_prime(17) == True
        assert is_prime(23) == True
        assert is_prime(97) == True
    
    def test_negative(self):
        assert is_prime(-5) == False
