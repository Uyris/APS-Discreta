"""
Setup script for APS-Discreta package
"""
from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setup(
    name="aps-discreta",
    version="0.1.0",
    author="APS-Discreta Team",
    description="Matemática Discreta - Algoritmos e Problemas Selecionados",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/Uyris/APS-Discreta",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Topic :: Scientific/Engineering :: Mathematics",
    ],
    python_requires=">=3.8",
    install_requires=[
        "numpy>=1.24.0",
        "matplotlib>=3.7.0",
    ],
    extras_require={
        "dev": [
            "pytest>=7.4.0",
            "pytest-cov>=4.1.0",
        ],
    },
)
