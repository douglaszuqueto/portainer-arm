# Portainer para Raspberry PI (v1.17.1)

## Rodando o portainer

### Passo 1 - Criar volume

```
docker volume create portainer_data
```

### Passo 2 - Criar container

```
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data douglaszuqueto/portainer:raspberry-1.17.1
```

### Passo 3 - Testando

Abra no seu navegador o IP da raspberry seguido da porta colocada acima. Caso deseje mudar a porta, apenas troque o 9000 acima da primeira casa,
ficando desta forma: *-p 8000:9000*.

## Referências
- [Repositório Github](https://github.com/douglaszuqueto/portainer-arm)
- [Portainer](https://portainer.io/install.html)
