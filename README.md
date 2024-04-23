# WorkStation PHP

Uma configuração padrão de Vagrant para desenvolvimento com Symfony PHP

## Pré-requisitos

> O que é necessário para o projeto rodar

- [Virtualbox-7.0](https://www.virtualbox.org/)
  - Recomendado

    ```bash
      sudo mkdir --parents --verbose /etc/vbox && sudo cp .scripts/vbox/networks.conf /etc/vbox/networks.conf
    ```

- [Vagrant](https://developer.hashicorp.com/vagrant)
- [Make](https://www.gnu.org/software/make/manual/make.html)

  ```bash
  sudo apt install make
  ```

## Softwares Instalados

- [Git](https://git-scm.com/)
- [PHP 8.2](https://www.php.net/releases/8.2/pt_BR.php)
  > php8.2-zip php8.2-xml php8.2-pgsql php8.2-intl php8.2-mbstring php8.2-xdebug
- [Xdebug](https://xdebug.org/)
- [Composer](https://getcomposer.org)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://github.com/docker/compose/)
- [Symfony CLI](https://symfony.com/download)

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
