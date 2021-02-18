# Vagrant

## Architechture 

Voici l'architechture du projet : 

![Image of Yaktocat](https://nsa40.casimages.com/img/2021/01/07//210107101009253883.png)

Il se décompose en différents service : 

## 3 VM : 

- 2 VM contenant une pile de conteneurs Docker
- 1 VM contenant un load balancer ainsi que la base master MONGO

## Docker-Compose 

Voici les différents service du docker-compose:

- [Front](https://github.com/gothinkster/node-express-realworld-example-app)
- [Back](https://github.com/gothinkster/react-redux-realworld-example-app) 
- [BDD](https://hub.docker.com/_/mongo)

# Execution 

Pour exécuter le projet il faut utiliser les commandes suivantes : 

```
git clone https://gitlab.com/Killbzz/vagrant.git
ansible-playbook vagrant/playbook/install/install.yml #Commande afin d'initialiser l'installation des packages Vagrant et Virtualbox 6.0
ansible-playbook vagrant/playbook/deploy_server/deploy_server.yml #Commande permettant de créer les Vm Backend, Frontend et bdd a partir de Vagrant

```
