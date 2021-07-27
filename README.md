# Quick Install for UBUNTU

**install with default configuration**

Install curls and then

`curl -s https://raw.githubusercontent.com/gagginaspinnata/freeNet/master/quickinstall.sh | bash`

# Install with configuration for UBUNTU

**Run the commands below and follow the instruction on screen**

First Clone the repo, then

`apt-get update; apt-get install git; git clone https://github.com/gagginaspinnata/freeNet.git;`

Cd into the directory `cd freeNet` and run `bash install.sh`

To view the new installed commands run `vpshelp`


L'esigenza di utilizzare una vpn o un tunnel ssh nasce dal fatto che android non permette di utilizzare un proxy con le connessioni mobili.
L'idea di base è di instradare tutto il traffico verso un proprio server tramite una vpn o un tunnel ssh. Il traffico arrivato al server viene girato su un proxy (squid) che, prima di far partire le richieste verso l'esterno, modifica gli header http facendo credere al gestore di stare navigando su un loro dominio.
