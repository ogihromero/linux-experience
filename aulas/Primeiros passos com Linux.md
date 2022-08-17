# Primeiros passos com Linux
## Introdução ao Desenvolvimento Moderno de Software
- Ao iniciar o desenvolvimento, o primeiro passo é definir a(s) plataforma(s) que o software será executado
    - sistemas desktops são autônomos que podem ser instalados no computador.
    - Sistemas Web pode ser utilizados remotamente, sem a necessidade de instalação e atualização local.
    - Sistemas móveis são pensandos em smartphones/tablets, geralmente com distruibição por loja on-line.

- O UX é responsável pela experiência do usuário, incluindo acessibilidade e satisfação.
- O UX designer pode fazer pesquisas, realizar protótipos e definir os objetivos da interface ao UI designer.
- O UI designer tratará das cores, tipografias, microinterações, estilos e layouts

- O modelo cliente-servidor é uma estrutura de aplicação que distribui as tarefas e cargas de trabalho entre os fornecedores de um recurso ou serviço, designados como servidores, e os requerentes dos serviços, designados como clientes.
- O Desenvolvedor front-end programa a parte visual de um site ou aplicativo.

- O Back End trabalha em boa parte dos casos fazendo a ponte entre os dados que vem do navegador rumo ao banco de dados e vice-versa.

- Desenvolvedor Full Stack conhecem todo o processo (tanto Front End quanto Back End)

- QA(quality Assurance) pode ser definida como um conjunto de ações que as empresas realizam com o objetivo de entregar aos consumidores um produto ou serviço com alto nível de qualidade. No desenvolvimento de software, aplicar os métodos de QA geram confiança e segurança aos clientes, indicando que os seus produtos terão a qualidade esperada na etapa de implantação.

----
## Introdução ao Sistema Operacional Linux
- O sistema operacional é um software, ou conjunto de softwares, que tem a função de administrar e gerenciar os recursos de um sistema
- Kernel é a ponte entre o usuário e o sistema.
    - estabelece uma camada de abstração de baixo nível e gerencia recursos como processador, RAM e dispositivos I/O.
- Ao executar VMs, necessário trocar checar `bcedit`e trocar `bcedit /set hypervisorlaunchtype` para `off` ou `auto`caso queira usar Virtualbox ou Hyper-V/Wsl respectivamente.

- O PuTTY é um client SSH para windows, a porta padrão do protocolo é 22.
    - O PuTTY trabalha com arquivos .ppk ao invés de .pem, o PuTTYgen serve para essa conversão.
    - Para conectar via ssh usa-se Connection>auth para selecionar o arquivo
    - Depois basta conectar pela session normalmente.
- Para permitir acesso na máquina virtual, necessário o comando:    
    - `sudo apt-get install openssh-server`
- Para acessar no Linux, usa-se `ssh usuario@ip`
- `sudo chmod  600 arquivo` para alterar as opções de acesso.
- Em acesso externo basta usar:
    - `ssh -i arquivoDaChave.pem usur@ipDestino` o I é de identificar arquivo

---
## Terminal linux (shell)
- o `$` no terminal significa que não é um super usuário. O usuário root usa `#`
- Os comandos no bash são case sensitive.
- para usar espaços nos nomes de diretórios/arquivos usa-se aspas simples `'`
- para executar comandos sudo, é necessário estar no grupo adm e sudo.
- sshd é o serviço de acesso remoto.
- Todas as configurações são feitos em arquivo de texto.
- `nano`é um editor de texto no terminal, `ctrl+o` para salvar , `ctrl+x` para sair
    - no `vi` i entra em insert mode,`esc`para sair do modo de inserção, `:` abre o menu, (w para salvar, q para sair)
- Para pemitir login em acesso remoto com user root, acessar `etc\ssh\ssh_config` e alterar
- no `.bashrc` (na home do usuário) é possível alterar o `history`size.
    - `date` informa data e hora atual.
    - `clear` limpa a tela, o seu atalho é `[ctrl+l]`
    - `pwd` mostra o caminho completo do diretório atual.
    - `cd [destino]` muda o diretório
        - Se começar o destino com `/` ele irá começar da raiz.
        - ` ..` volta para o diretório-pai
        - `-` volta para o anterior.
        - um `tab duplo` mostra os diretórios-filhos no destino.
        - `cd ~` vai direto para a pasta do usuário.
    - `ls` mostra os arquivos e diretórios presentes no diretório atual.
        - `| more` para exibir os resultados em uma lista. `[ctrl+c]` para sair dela
        - `ls parteNome[tab+tab]` para exibir resultados com incluam parteNome.
        - `ls part*` exibirá todos que incluam part e os arquivos dentro de suas pastas.
        - `*` é qualquer coisa, `?` é uma letra
        - `ls arquivo[1-n]` exibira todos os arquivos com nome arquivo1 até arquivon.
        - `ls arquivo[1,n]` exibiraos arquivos com nome arquivo1 e arquivon.
        - `ls arquivo[^1-n]` exibira todos os arquivos com nome arquivo menos os que terminam 1 até arquivon.
        - o destino pode ser filtrado também.
        - `ls -a` lista todos os arquivos, incluídos ocultos.
        - `ls -l` exibe os arquivos em uma lista longa(detalhada)
            - A primeira letra `l` significa link, `d` diretório, `-` um arquivo.
            - A segunda linha é a quantidade de arquivos/diretórios dentro, a terceira o dono e a quarta o grupo.
    - `touch` cria uma rquivo vazio
    - `find -name` pesquisa o arquivo pelo nome, a partir do local atual
    - `mkdir local` para criar um diretório.
    - `rmkdir` ou `rm -r` remove um diretório vazio. `-r` é de recursivo. `-f` para forçar a ação.
    - `rm` apaga arquivo.
    - `comando --help` para exibir a ajuda/instrução do comando ou `help comando`. Outra opção é `man comando` o
    - `sudo passwd user` para criar senha a um usuário.
    - `systemctl status servico` Para ver os status/log de um serviço.
    - `systemctl restart servico` Para reiniciar um serviço.
    - `history` exibe os últimos 1000 comandos utilizados (armazenado por usuário)
        - `set +o history` desativa o history.
    _ `!numero` executa o numeroX comando usado segundo o history.
    - `!!` executa o último comando novamente
    - `!?comando?` pesquisa se o comando existe e executa duma vez.
    - `history | grep "grupo"` mostra o histórico dos comandos usados com o comando/pasta/arquivo em "grupo"
    - `export termo` especifica variáveis ou funções a serem repassadas.

---
## Trabalhando com usuários
- criamos usuários com `useradd nome`
    - `-m`para criar a pasta home
    - `-p` para senha(mas já encriptado)
        - para encriptar: `p $(openssl passwd -crypt senha)
    - `-s /bin/bash` para bash
    - `e` para adicionar uma data de expiração
- removemos com `userdel nome`
    - `-r` paga apagar home directory
- `chsh -s /bin/bash nome` para definir o bash como shell padrão do usuário
- `usermod usuario` altera informações do usuário
- `passwd -e` pode ser usado para forçar a alteração de senha imediatamente.
- É possível criar um arquivo de lote com os comandos a serem executados, para criar 2 usuários por exemplo. ex:
```bash
#!/bin/bash

echo "Criando 2 usuários"
useradd guest -c "Usuário Convidado" -s /bin/bash -m -p $(openssl passwd -crypt senha)
passwd guest -e

useradd guest2 -c "Usuário Convidado2" -s /bin/bash -m -p $(openssl passwd -crypt senha)
passwd guest2 -e

echo "Finalizado"
```
- Para executar esse arquivo, adicionar permissão com `chmod +x criarUser.sh`
    - Depois só executar com `./criarUser.sh`
- Para verificar os grupos de usuários, acessar `etc/group`
- `usermod -G g1, g2 ususario` para adicionar em grupos, sai de grupos não mencionados.
- `cat /etc/passwd` listará todos os usuários no sistema.
- usuário root é diferença de sudo.
- `groupadd nome` para criar um grupo.
- `groupdel nome` para apagar o grupo
- `gpasswd -d usuario grupo` remove user do grupo.
- O comando `ls -l` mostra o direito de rwx (leitura, gravação e execução) para dono, grupo e outros nessa ordem.
- `chown owner:grupo destino` para trocar o dono de um arquivo.
- O comando `chmod`tem diferentes pesos:
    - 4 para leitura(r), 2 para gravação(w), 1 para execução(x) e 0 para nenhuma.
    - Para dar permissão total para o dono, rw para grupo e 0 resto seria `chmod 750 destino`
    - Para permissão total: `chmod 777 destino`
    - `chmod +x destino` para adicionar execução ao dono

---
## Gerenciamento de Pacotes Linux
- As distro Linux tem repositórios oficiais e outros.
- No Ubuntu/Debian pode ser usado o `apt-get`, que não traz muitas informações.
- O `apt` é mais amigável, permite buscar por pacotes que já estejam instalado, entre outras funções.
    - `apt update` atualiza a lista de pacotes
    - `apt upgrade` realiza a atualização dos arquivos/sistema
    - `apt list --installed` checar o que está instalado
    - `apt list --upgradeable` para ver o que pode ser atualizado.
- Nas distros FEDORA, RED HAT e CenTOS os comandos para atualização são `dnf` (mais user-friendly) ou `yum`
    - o `dnf update` já executa a instalação duma vez.
- Para instalar um `.deb` local, basta usar `apt install arquivo.deb`
- O mesmo vale para Fedora `dnf` / `yum`

---
## Gerenciamento de Discos Linux
- Sistema de arquivos é um padrão que o sistema usa para controlar como os dados são armazenados e recuperados
- Como exemplos temos HFS(macOS), Ext3,Ext4,XFS(Unix/Linux), FAT32, NTFS(Windows)
- Em relação a partição, cada uma é independente da outra(pode ter SOs diferentes sem problema)
- No linux a instalação padrão já divide partições (sda (sda1), sdab(sdb1, sdb2,sdb3))
- `lsblk` ou `fdisk -l` mostra as partições/discos respectivamente.
- `fdisk /dev/sdb` entraria no modo para criar/mudar partições no sdb.
    - n(new partition), p(primária),definir o número de partições, setores e salvar.
    - `mkfs.ext4 /dev/sdb` formataria o sdb em ext4.
- para montar um disco usa-se o diretório /mnt/ ex criar a pasta disco2 e depois:
    - `mount /dev/sdb /mnt/disco2`
    `umount /dev/sdb` para reverter
- Necessário desmontar antes de remover o diretório ou apagará o conteúdo no disco.
- Para montar os discos automaticamente é necessário alterar o fstab. ex:
    - `nano /etc/fstab`
    - adicionar: `/dev/sdb /disk2 ext4 defaults 0 0`
    - disco, onde será montado, o formato e outros parâmetros.

---
## Copiando Arquivos e Manipulando Processos
- O comando para copiar é `cp`.
    - `cp origem arquivo destino`
    - `cp origem *.txt destino` copia todos os arquivos com final .txt
- ./arquivos para copiar arquivos do diretório atual. `cp ./arq destino`
- a flag `-i` para perguntar sobre sobrepor.
- flag `-r` para copiar pastas também.
- a flag `-v` verbose para visualizar o que está sendo realizado
- Para mover arquivos é `mv`
    - `mv origem destino`
- Modo recursivo não funciona com `mv`
- Podemos usar o comando `mv` para renomear arquivos.
- `ps` mostra os processos em execução( só no terminal se for chamado assim)
    - `a` mostra todos os usuários
    - `u` usuários dos processos.
    - `x` processores fora do console. | ex: `ps aux`
- `kill numeroPid` | `killall nome` mata o processo.
- `w` mostra os usuários logados, `who -a` mostra seus pid, podendo matar seus logons.