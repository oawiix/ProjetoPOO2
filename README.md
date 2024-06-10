# Projeto-POO

1. Felipe Fernandes
2. Julia Panaia
   
<div>​​
<img src = "https://github.com/oawiix/ProjetoPOO2/blob/main/img/grafica.jpg"  largura = "500px"/>
</div>​​

> [!NOTE]
> **Objetivo:**
> 
> O cliente que será atendido é uma gráfica onde são impressos banner, panfleto, cartões, lonas, entre outros produtos. O cliente nos procura para resolver um problema muito
> exclusão individual. O cliente deseja realizar o gerenciamento dos pedidos dele para facilitar a comunicação entre os colaboradores da empresa. Portanto, ele gostaria que você desenvolvesse uma solução elegante onde alguns requisitos fossem satisfeitos.
>
> Lembrando que nesse projeto teremos vários requisitos levantados na entrevista, porém nem todos necessariamente são relevantes ao seu sistema. Tome as decisões do analista de sistemas e construa um diagrama de classes que atenda à necessidade de gerenciar os pedidos.

**Requisitos Funcionais do Projeto**

Requisitos Funcionais

• Pedido

RF1 – O sistema deve buscar pedido

RF2 – O sistema deve adicionar pedido

RF3 – O sistema deve cancelar o pedido

RF4 – O sistema deve permitir cadastrar pedido

RF5 - O sistema deve criar código do pedido

RF6 – O sistema deve permitir a alteração da situação do pedido

• Histórico do Pedido (empresa)

RR11 - O sistema deve permitir a visualização dos pedidos conforme o filtro

• Cadastro

RF7 – O sistema deve ter página de cadastro de cliente (nome, telefone, logradouro)

RF8 – O sistema deve criar código cliente

• Execução

RF9 – O sistema deve buscar cliente por atributos (administrador)

**BÔNUS CASO CONCLUIRMOS O PRIMORDIAL:**

RF10 - O sistema deve enviar mensagens pelo telefone do cliente sobre a situação do
pedido (sistema)

RF11 - O sistema deve enviar uma mensagem de feedback após a conclusão do pedido
ao cliente

> [!WARNING]
> PÁGINAS ESSENCIAIS PARA A EXECUÇÃO DO PROJETO: PEDIDO E CADASTRO DO CLIENTE

> [!IMPORTANT]
> **Implementação:**
> A linguagem escolhida foi Java e o tomcat como servidor web java. O colaborador poderá incluir
> um novo pedido ao sistema que será enviado para produção. Por fim, o sistema deve apresentar uma
>  lista de pedidos com o status do pedido mostrando quais estão na fila para serem confeccionados.    
 


**Funcionalidades**

-  [x] Conformidade com Requisitos: Verifique se todas as funcionalidades foram inovadoras.

-  [x] Corretudo do Código: Garantir que o programa execute sem erros e bugs.

-  [ ] Robustez: Resiliência contra entradas inválidas ou inesperadas.

**Qualidade do Código**

-  [x] Legibilidade: Facilidade de leitura e compreensão do código.

-  [x] Organização: Estruturação adequada em classes, métodos e pacotes.

-  [x] Comentários: Comentários úteis e descritivos são incluídos.

**Documentação** 
-  [x] Documentação Externa: Leiame detalhado sobre como executar o projeto.

**Extras** 

-  [ ] Testes Unitários: Presença de testes que cobrem casos significativos.

-  [ ] Performance: Análise de tempo de execução e uso de memória.

-  [x] Uso do Github: Histórico de commits bem estruturado.

**Individuais**  

-  [x] Participação e Contribuição: Engajamento individual no projeto, contribuição no Github.

-  [x] Eficiência na comunicação com a equipe e apresentação do projeto.


> [!IMPORTANT]
> Banco de Dados utilizado > MySQL
> + Arquivo de configuração do Banco de Dados:
> src/java/model/conBd.java
>
> Lib necessária para execução:
> + MySQL Connector/J
> https://dev.mysql.com/downloads/connector/j/
> 
> 
> Linha de codigo para conexão:
> + "jdbc:mysql://localhost:<<porta, normalmente 3306>>/<<nome do banco>>" +
> "?user=<<usuario>>&password=<<senha, vazio caso não tenha sido definida>>";
>
> Lib necessaria para Visual Code:
> + Javax Servlet Api 4.0.1
> https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api/4.0.1
