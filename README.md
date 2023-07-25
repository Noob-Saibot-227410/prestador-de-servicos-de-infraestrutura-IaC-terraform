**Bem-vindo à TerraFlow Soluções!**

## Sobre Nós
Na TerraFlow, somos especializados em fornecer soluções avançadas de Infraestrutura como Código (IaC) usando o Terraform para criar e gerenciar recursos na AWS. Nossa equipe é especializada em projetar e desenvolver diversos padrões sem servidor e com servidor para atender às necessidades específicas de negócios. Com ampla experiência em tecnologias nativas da nuvem, garantimos integração e automação perfeitas para sua infraestrutura em nuvem.

![main-tf-tips](https://github.com/Noob-Saibot-227410/website-a-venda-template-loja-sapatos-roupas/assets/115899706/94cc5887-09af-4f12-8b51-b2c3c65a4d25)

## Serviços
Nossa expertise abrange uma ampla gama de serviços projetados para potencializar o seu negócio com soluções escaláveis, eficientes e econômicas.

### Padrões Sem Servidor

#### API HTTP com Amazon API Gateway e AWS Lambda para RDS Proxy
Crie um endpoint de API HTTP que invoca uma função AWS Lambda para o RDS Proxy, garantindo acesso seguro e confiável ao banco de dados.

![API Gateway para AWS Lambda para RDS Proxy](imgs/1.PNG)

#### API HTTP com Amazon API Gateway e AWS Lambda
Crie uma API HTTP com Amazon API Gateway e uma função AWS Lambda para disponibilizar serviços para seus clientes.

![API Gateway para AWS Lambda](imgs/2.PNG)

#### API Gateway para Lambda para DynamoDB
Realize uma solicitação ao API Gateway que salva os dados no DynamoDB.

![API Gateway para Lambda para DynamoDB](imgs/3.PNG)

#### Regra Agendada do EventBridge para Lambda
Crie uma regra agendada no EventBridge para invocar uma função Lambda.

![Regra Agendada do EventBridge para Lambda](imgs/4.PNG)

#### S3 para Lambda para SES
Crie uma função Lambda que envie e-mails via SES para eventos do S3.

![S3 para Lambda para SES](imgs/5.PNG)

#### AWS S3 Trigger para AWS Lambda para AWS Glue
Esse padrão cria um gatilho de balde S3 que aciona uma função Lambda sempre que um arquivo chega. A função Lambda é usada para acionar um fluxo de trabalho do Glue com parâmetros de entrada, como chave de arquivo e nomes de balde. Todos os elementos abordados neste padrão são construídos usando o Terraform.

![AWS S3 Trigger para AWS Lambda para AWS Glue](imgs/6.PNG)

#### Invocar a função Lambda entre contas diretamente por meio do Step Functions
Crie um fluxo de trabalho do Step Functions que invoque a função Lambda entre contas.

![Invocar a função Lambda entre contas diretamente por meio do Step Functions](imgs/7.PNG)

#### SQS para Lambda
Crie uma função Lambda que se inscreve em uma fila SQS.

![SQS para Lambda](imgs/8.PNG)

### Padrões com Servidor

#### Amazon API Gateway (HTTP) para AWS Lambda
Este padrão cria um Amazon API Gateway (HTTP) e uma função AWS Lambda.

![Amazon API Gateway (HTTP) para AWS Lambda](imgs-servidor/1.PNG)

#### Transmissões do Amazon DynamoDB para AWS Lambda
Este padrão cria uma tabela Amazon DynamoDB com streaming habilitado, uma função AWS Lambda e configuração de fonte de eventos do DynamoDB para a função Lambda.

![Transmissões do Amazon DynamoDB para AWS Lambda](imgs-servidor/2.PNG)

#### Regra Agendada do EventBridge para Lambda
Crie uma regra agendada no EventBridge para invocar uma função Lambda.

![Regra Agendada do EventBridge para Lambda](imgs-servidor/3.PNG)

#### Função Lambda e Camadas Lambda
Crie uma Função Lambda que tenha uma Camada Lambda adicionada a ela.

![Função Lambda e Camadas Lambda](imgs-servidor/4.PNG)

#### Notificações de bucket do Amazon S3 para AWS Lambda
Este padrão cria um bucket do Amazon S3, uma função AWS Lambda e configura notificações de eventos do bucket do S3 para acionar a função Lambda.

![Notificações de bucket do Amazon S3 para AWS Lambda](imgs-servidor/5.PNG)

#### Amazon S3 com S3 Object Lambda (retorna miniaturas de imagens do S3)
Este padrão cria um bucket S3, um S3 Access Point, um S3 Object Lambda Access Point e uma função AWS Lambda.

![Amazon S3 com S3 Object Lambda](imgs-servidor/6.PNG)

#### Fila Amazon SQS para AWS Lambda
Este padrão cria uma fila do Amazon SQS, uma função AWS Lambda e configura um fornecimento de eventos da fila para a função Lambda.

![Fila Amazon SQS para AWS Lambda](imgs-servidor/7.PNG)

Se você estiver interessado em soluções personalizadas para o seu negócio, não hesite em entrar em contato conosco! Nossa equipe de especialistas está pronta para ajudar a impulsionar o seu sucesso com a nuvem AWS e o poder do Terraform.
