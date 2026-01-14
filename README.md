# Keycloak Theme

## Packaging

Per fare il pacchetto del tema, è sufficiente lanciare, dalla root del progetto, il comando:

```sh
$ ./build.sh
```

Il pacchetto JAR del tema sarà disponibile al path `./target/mytheme.jar`

## Installazione

Per installare il tema:

- copiare il pacchetto nella cartella `providers` di Keycloak (direttamente nella root di installazione di Keycloak)
- riavviare Keycloak

### Docker / Docker Compose

All'interno dell'immagine docker, il tema deve essere già presente nella cartella `providers` alla creazione del container

