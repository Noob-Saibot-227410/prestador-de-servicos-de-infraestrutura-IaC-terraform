# TerraFlow
<p>Este repositório contém meus conhecimentos em Terraform para criar e gerenciar recursos na AWS, projetados para demonstrar meu conhecimento em Terraform para fins de recrutamento.</p>

<p>Minha experiência em desenvolvimento de infraestrutura IAC com Terraform inclui a criação de diversas funções de código, como Amazon API Gateway para AWS Lambda, transmissões do Amazon DynamoDB para AWS Lambda, função e camadas Lambda, invocação de fluxos de trabalho do AWS Step Functions do AWS Lambda, notificações de bucket do Amazon S3 para AWS Lambda e filas Amazon SQS para AWS Lambda, entre outros.</p>

<p>Além disso, possuo experiência em desenvolvimento de API HTTP do Amazon API Gateway para AWS Lambda para RDS Proxy, API Gateway para Lambda para DynamoDB, WebSocket API do API Gateway para SQS para AWS Lambda, S3 para Lambda para SES, SNS para SQS para Lambda para Firehose, e também em criação de regras EventBridge agendadas para Lambda, funções Lambda usando camadas Lambda, funções de passo do Lambda, acionamento de fluxo de trabalho do AWS Step Functions do AWS Lambda com log ativado, invocação direta de funções Lambda entre contas por meio do Step Functions, gatilhos de balde S3 que acionam funções Lambda e inscrição de funções Lambda em filas SQS, todos desenvolvidos utilizando o Terraform.</p>

<img src="https://img.icons8.com/color/48/000000/terraform.png"/>

<h1>Padrões sem servidor</h1>

<h2>API HTTP do Amazon API Gateway para AWS Lambda para RDS Proxy</h2>
<p>Endpoint de API HTTP que chama uma função do Lambda para o RDS Proxy.</p>
<img src="padroes-sem-servidor\1.PNG">
---
<h2>API HTTP do Amazon API Gateway para AWS Lambda</h2>
<p>Cria uma API HTTP do Amazon API Gateway e uma função AWS Lambda</p>
<img src="padroes-sem-servidor\2.PNG">
---
<h2>API Gateway para Lambda para DynamoDB</h2>
<p>Faça uma solicitação ao API Gateway que salva os dados no DynamoDB.</p>
<img src="padroes-sem-servidor\3.PNG">
---
<h2>Regra EventBridge agendada para Lambda</h2>
<p>Crie uma regra EventBridge agendada que invoque uma função Lambda</p>
<img src="padroes-sem-servidor\4.PNG">
---
<h2>S3 para Lambda para SES</h2>
<p>Crie uma função Lambda que envie e-mails via SES para eventos S3.</p>
<img src="padroes-sem-servidor\5.PNG">
---
<h2>AWS S3 Trigger para fluxo de trabalho AWS Lambda para AWS Glue</h2>
<p>Esse padrão cria um gatilho de balde s3 que aciona uma função Lambda (sempre que o arquivo chega). A função Lambda é usada para acionar um fluxo de trabalho do Glue com parâmetros de entrada, como chave de arquivo e nomes de balde. Todos os elementos abordados neste padrão são construídos usando o Terraform.</p>
<img src="padroes-sem-servidor\6.PNG">
---
<h2>Invocar a função Lambda entre contas diretamente por meio do Step Functions</h2>
<p>Crie um fluxo de trabalho do Step Functions que invoque a função Lambda entre contas</p>
<img src="padroes-sem-servidor\7.PNG">
---
<h2>SQS para Lambda</h2>
<p>Crie uma função Lambda que se inscreve em uma fila SQS</p>
<img src="padroes-sem-servidor\8.PNG">

<h1>Padrões com servidor</h1>

<h2>Amazon API Gateway (HTTP) para AWS Lambda</h2>
<p>Esse padrão cria um Amazon API Gateway (HTTP) e uma função do AWS Lambda.</p>
<img src="padroes-com-servidor\1.PNG">
---
<h2>Transmissões do Amazon DynamoDB para AWS Lambda</h2>
<p>Esse padrão cria uma tabela Amazon DynamoDB com streaming habilitado, função AWS Lambda e configuração de fonte de eventos do DynamoDB para a função Lambda.</p>
<img src="padroes-com-servidor\2.PNG">
---
<h2>Regra EventBridge agendada para Lambda</h2>
<p>Crie uma regra EventBridge agendada que invoque uma função Lambda</p>
<img src="padroes-com-servidor\3.PNG">
---
<h2>Função Lambda e Camadas Lambda</h2>
<p>Crie uma Função Lambda que tenha uma Camada Lambda adicionada a ela</p>
<img src="padroes-com-servidor\4.PNG">
---
<h2>Notificações de bucket do Amazon S3 para AWS Lambda</h2>
<p>Esse padrão cria um bucket do Amazon S3, função do AWS Lambda e configura notificações de eventos do bucket do S3 para acionar a função do Lambda.</p>
<img src="padroes-com-servidor\5.PNG">
---
<h2>Amazon S3 com S3 Object Lambda (retorna miniaturas de imagens do S3)</h2>
<p>Esse padrão cria um bucket S3, um S3 Access Point, um S3 Object Lambda Access Point e uma função Lambda.</p>
<img src="padroes-com-servidor\6.PNG">
---
<h2>Fila Amazon SQS para AWS Lambda</h2>
<p>Esse padrão cria uma fila do Amazon SQS, uma função do AWS Lambda e um fornecimento de eventos de configuração da fila para a função do Lambda.</p>
<img src="padroes-com-servidor\7.PNG">