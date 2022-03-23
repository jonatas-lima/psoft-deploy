# PSOFT Deploy

## Objetivo

- Realizar o deploy da aplicação desenvolvida no final da disciplina Projeto de Software (2021.2) em uma instância (EC2) da AWS de maneira automatizada.

## Tecnologias utilizadas

- Provisionamento da infraestrutura: Terraform + Shell Script
- Cloud Provider: AWS
- Para rodar a aplicação: Docker + Docker swarm

## Setup inicial
- A princípio, [configurei a chave e o id de acesso](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) na `aws cli`
- Após isso, armazenei os arquivos essenciais (data.sql, stack.sql, db.env e backend.env) em um bucket S3 na AWS.
  - Dá pra fazer isso via cli, com o comando 
    ```bash
    aws s3 cp --no-guess-mime-type --content-type=text/plain <arquivo> s3://<nome_do_bucket>
    ```
  - OBS: Importante colocar o content-type como text/plain, pois o terraform só lê o conteúdo de um objeto se esse campo for "human-readable" (text/* ou application/json)

- Em seguida, deve-se setar as variáveis do arquivo `vars.tf` em outro arquivo com extensão `.tfvars` (ocultei por motivos de segurança)
- Por fim, é necessário gerar o par de chaves na pasta `terraform/private` para conexão SSH com a instância
  ```shell
  mkdir terraform/private
  ssh-keygen -t rsa -f terraform/private/id_rsa
  ```

## Estrutura do projeto

### Cloud Provider
- `provider.tf`: Define o cloud provider a ser utilizado pelo projeto. Nesse caso, foi utilizada a AWS.

### Rede
- `vpc.tf`: Define a VPC (Virtual Private Cloud), sub-rede, gateway de internet e tabela de roteamento do projeto.
- `security_group.tf`: Define as regras de entrada e saída de tráfego. Para entrada, decidi abrir apenas as portas 80/tcp (para a aplicação) e 22/tcp (para conexão SSH). 
<br></br>

### Armazenamento
- `s3.tf`: Define os objetos a serem resgatados do serviço de Object Storage da AWS.
- `backend.tf`: Define onde o arquivo de estado do Terraform será armazenado. Nesse caso, será armazenado, também, em um Bucket S3.

### Segurança e Privacidade
- `keypair.tf`: Define o par de chaves a ser utilizado para conexão SSH com a instância.
- `vars.tf`: Define as variáveis utilizadas pelo projeto. Deve ser utilizada em conjunto com um arquivo `.tfvars`.

### Instância
- `ec2.tf`: Define as configurações da instância EC2 a ser provisionada. Também é passado um script de provisionamento, que é executado durante o processo de subir a instância.

## Rodando o projeto
- Ao entrar na pasta `terraform` e executar `terraform apply`, a infraestrutura descrita em HCL será totalmente provisionada e a aplicação também estará rodando no IP que será mostrado na tela após o provisionamento.

## Referências
- Documentação do [Terraform + AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- Documentação do [Docker](https://docs.docker.com/), especificamente a do [Docker Swarm](https://docs.docker.com/get-started/orchestration/#enable-docker-swarm)
