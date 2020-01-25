#Photovo

## Configuration
- Il faut un environnement ruby, rails
- Deux variables d'environnement sont nécessaires : `username` et `password`, constituant les identifiants d'authentification.

## Installation
Cloner le projet et lancer l'application Rails
```
$ git clone https://github.com/arousmane/photovo
$ cd photovo && bundle install
$ rails s
```

## Architecture
Deux modèles: 
- `Inverter`: Représentant un onduleur
- `InverterRecord` : Représentant les productions horaires