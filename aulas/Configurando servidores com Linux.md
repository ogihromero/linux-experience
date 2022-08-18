# Configurando servidores com Linux
## Servidores de Arquivos 
- O Samba permite o gerenciamento e compartilhamento de arquivos através do protocolo SMB(da MS)
- Instala o sampa por `apt install samba -y` 
- Não é aconselhável que o disco do SO seja o mesmo do servidor de arquivos.
- `/etc/samba/smb.conf` é o arquivo de configuração do servidor de arquivos.
- Exemplo de arquivo de configuração para a pasta destino, pública e gravável.
```bash
[destino] 
path= /disco/destino
writable = yes
guest ok = yes
guest only = yes
```
- O samba está em segundo plano ouvindo requisições, aka `daemon`, para reiniciar o Samba o comando é `systemctl restart smbd`
- Geralmente daemons terminan o nome com d.
- Para ver o status: `systemctl status smbd`
- Para manter o serviço ativo após reinicializações: `sytemctl enable smbd`
- Apesar do servidor ser público, ainda será necessário um usuário do sistema como credencial no acesso externo.
- É possível mapear uma unidade de rede como unidade no Windows.

---
## Servidores Web
- Quem ouve e retorna as requisições ao acessar um site é o servidor Web.
- Instale o `apt install apache2 -y` e cheque se ela já está ouvindo requisições.
- Diretório padrão do index é `/var/www/html/index.html`
- No EC2, necessário liberar protocolo http além do ssh nos grupos de segurança se quiser acessar via html.

---
## Servidores de banco de dados
- Vários informações, como login/user são armazenadas no banco de dados.
- As consultas são usadas para exibir informações de acordo.
- `apt search mysql-server` para verificar qual versão do mysql instalar.
- `mysql -u root -p` para usar o mysql como usuario root.

- Sempre ao trabalhar com scripts, o ideal é usar o `apt-get` e `-y`