import pytest
from app import app

def test_home():
    # Tworzymy klienta testowego
    client = app.test_client()
    
    # Wysyłamy żądanie GET do endpointu '/'
    response = client.get('/')
    
    # Sprawdzamy, czy odpowiedź ma status 200
    assert response.status_code == 200
    
    # Sprawdzamy, czy odpowiedź zawiera oczekiwany tekst
    assert response.data.decode('utf-8') == "Hello, Ai Skills for Dev!"
