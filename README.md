# Anotações Iniciais

## Pré-requisitos

O que é necessário para o projeto rodar

- Virtualbox-7.0
  - Recomendado

    ```bash
      sudo mkdir --parents --verbose /etc/vbox && sudo cp .scripts/vbox/networks.conf /etc/vbox/networks.conf
    ```

- Vagrant
- Make

  ```bash
  sudo apt install make
  ```

## Como utilizar

> Foram criados atalhos dos comandos do vagrant por causa da injeção de informações via .env

- Levantar a VM

  ```bash
  make up;
  ```

- Desligara VM

  ```bash
  make halt;
  ```

- Conectar na VM por linha de comando

  ```bash
  make ssh;
  ```

- Abrir o Projeto utilizando VSCode
  > - [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh)
  > - [Configurar acesso SSH](#configurar-acesso-ssh)

  ```bash
  make code-projects;
  ```

- Atualizar as configurações da VM

  ```bash
  make reload;
  ```

- Destruia VM

  ```bash
  make destroy;
  ```

## Configurar acesso SSH

  > configurar o host no `.ssh/config` [SSH to Vagrant from VScode](https://medium.com/@lizrice/ssh-to-vagrant-from-vscode-5b2c5996bc0e)

- Executar o comando `make ssh-config`
- Copiar o conteúdo do retorno
- Colar o conteúdo no arquivo `~/.ssh/config`

## Tips

 > [connect-to-a-remote-host-from-the-terminal](https://code.visualstudio.com/docs/remote/troubleshooting#_connect-to-a-remote-host-from-the-terminal)

For example, to connect to remote_server and open the /code/my_project folder, run:

```bash
code --remote ssh-remote+remote_server /code/my_project
```
