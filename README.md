# TerraFlow
<p>Este repositório contém meus conhecimentos em Terraform para criar e gerenciar recursos na AWS, projetados para demonstrar meu conhecimento em Terraform para fins de recrutamento.</p>

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

<html>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>

<div class="slider">
  <div><img src="padroes-sem-servidor\1.PNG"></div>
  <div><img src="padroes-sem-servidor\2.PNG"></div>
  <div><img src="padroes-sem-servidor\3.PNG"></div>
  <div><img src="padroes-sem-servidor\4.PNG"></div>
  <div><img src="padroes-sem-servidor\5.PNG"></div>
  <div><img src="padroes-sem-servidor\6.PNG"></div>
  <div><img src="padroes-sem-servidor\7.PNG"></div>
  <div><img src="padroes-sem-servidor\8.PNG"></div>
</div>

<style>
  .slider {
    width: 100%;
  }
  .slick-slide {
    margin: 0px 20px;
  }
  .slick-slide img {
    width: 100%;
  }
  .slick-prev:before,
  .slick-next:before {
    color: black;
  }
</style>

<script type="text/javascript">
  $(document).ready(function(){
    $('.slider').slick({
      dots: true,
      infinite: true,
      speed: 500,
      autoplay: true,
      autoplaySpeed: 2000
    });
  });
</script>

</html>
