Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 18/11/2024
Var
   // Seção de Declarações das variáveis

   investimentosExteriores, investimentosBrasil: vetor[0..3] de real
   anoBase, trimestreBase, anoAux, trimestreAux, i: inteiro


   //Procedimento para preencher os vetores de investimentos no exterior e brasil
procedimento lerInvestimentos(ano, trimestre: inteiro)
var
   i: inteiro
   anoVerificado, trimestreVerificado: inteiro
inicio

   //PARA O EXTERIOR

   //Guarda os valores do trimestre e ano na variavel auxiliar
   anoVerificado <- ano
   trimestreVerificado <- trimestre
   escreval("Insira informações referentes a investimentos, em R$ milhões ")
   escreval("Digite o total de investimentos no Exterior para cada trimestre: ")

   //Solicita, para 4 trimestres a partir do informado, os investimentos no exterior
   para i de 0 ate 3 faca

      //Escreve e lê as informações
      escreval(trimestreVerificado, "T", anoVerificado, ": ")
      leia(investimentosExteriores[i])

      //Subtrai o trimestre e, se necessário, o ano para a proxima verificação
      trimestreVerificado <- trimestreVerificado - 1
      se (trimestreVerificado <= 0) entao // Se o trimestre for menor ou igual a 0...
         trimestreVerificado <- 4  //Reinicia o trimestre para 4
         anoVerificado <- anoverificado - 1 //Subtrai o ano
      fimse
   fimpara

   //PARA O BRASIL

   //Restaura as variaveis auxiliares para a próxima verificação para o Brasil
   anoVerificado <- ano
   trimestreVerificado <- trimestre
   escreval("Digite o total de investimentos no Brasil para cada trimestre: ")

   //Solicita, para 4 trimestres a partir do informado, os investimentos no Brasil
   para i de 0 ate 3 faca

      //Escreve e lê as informações
      escreval(trimestreVerificado, "T", anoVerificado, ": ")
      leia(investimentosBrasil[i])

      //Subtrai o trimestre e, se necessário, o ano para a proxima verificação
      trimestreVerificado <- trimestreVerificado - 1
      se (trimestreVerificado <= 0) entao // Se o trimestre for menor ou igual a 0...
         trimestreVerificado <- 4  //Reinicia o trimestre para 4
         anoVerificado <- anoverificado - 1 //Subtrai o ano
      fimse
   fimpara
fimprocedimento


//Função que retorna o total de investimentos de determinado trimestre
funcao totalInvestimentosTrimestre(ano, trimestre:inteiro): real
var
   posVetor: inteiro
inicio
   posVetor <- 0 //Garante que a posição é 0

   //Verifica se o ano informado é o mesmo de base
   se ano = anoBase entao
      posVetor <- trimestreBase - trimestre //Apenas subtrai o trimestre informado da base
   senao
      se ano = anoBase -1 entao
         posVetor <- trimestreBase - (trimestre - 4) // Subtrai do trimestre informado menos 4 para simular o ano na posição do vetor
      fimse
   fimse

   //Retorna a soma dos investimentos de cada local, armazenadas na posição calculada
   retorne investimentosExteriores[posVetor] + investimentosBrasil[posVetor]
fimfuncao



//Função que retorna o total de investimentos no Brasil
funcao totalInvestimentosBrasil(): real
var
   total: real
   i: inteiro
inicio
   // Para cada posição no vetor do brasil...
   para i de 0 ate 3 faca
      total <- total + investimentosBrasil[i] //Soma o valor ao total
   fimpara
   retorne total // Retorna o total
fimfuncao



//Função que retorna o total de investimentos no exterior
funcao totalInvestimentosExterior(): real
var
   total: real
   i: inteiro
inicio
   // Para cada posição no vetor do exterior...
   para i de 0 ate 3 faca
      total <- total + investimentosExteriores[i] //Soma o valor ao total
   fimpara
   retorne total //Retorna o total
fimfuncao



//Função que retorna o total de investimentos no período de 12 meses
funcao totalInvestimentos(): real
var
inicio
   retorne totalInvestimentosExterior() + totalInvestimentosBrasil() //Soma o valor de duas funções de soma de investimentos de locais
fimfuncao



//Função que retorna a porcentagem de investimentos no Brasil
funcao porcentagemInvestimentosBrasil(): real
var
inicio
   retorne (100 * totalInvestimentosBrasil()) / totalInvestimentos() //Calculo de porcentagem
fimfuncao



//Função que retorna a porcentagem de investimentos no Brasil
funcao porcentagemInvestimentosExterior(): real
var
inicio
   retorne (100 * totalInvestimentosExterior()) / totalInvestimentos() //Calculo de porcentagem
fimfuncao



//Função que retorna a porcentagem de investimentos no trimestre
funcao porcentagemInvestimentosTrimestre(ano, trimestre: inteiro): real
var
inicio
   retorne (100 * totalInvestimentosTrimestre(ano, trimestre)) / totalInvestimentos() //Calculo de porcentagem
fimfuncao




//Seção Principal do código
Inicio
   // Seção de Comandos, procedimento, funções, operadores, etc...

   //Informações iniciais para o usuário
   escreval("Bem vindo(a) ao sistema de Processamento de Investimentos da WEG")
   escreval("Todas as informações necessárias estão disponíveis no documento APRESENTAÇÃO DOS RESULTADOS em ri.weg.net/informacoes-financeiras/central-de-resultados")
   escreval("No slide do site, procure um gráfico com investimentos do Brasil e Exterior por trimestre")
   escreval("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
   escreval("Para começar, insira informações básicas referentes aos investimentos")
   escreval("Qual o ano base dos investimentos? (Considere o ano do trimestre mais recente a ser analisado e informe 2 números)")
   escreval("Ex: 2019 = 19 | 2021 = 21")
   leia(anoBase) //Lê o ano
   escreval("Qual o trimestre a ser analisado (digite apenas o número)")
   leia(trimestreBase) //Lê o trimestre

   lerInvestimentos(anoBase, trimestreBase)  //lê todos os dados de investimentos que o usuário fornecer

   //Exibe mensagem de relatório
   escreval("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
   escreval("")
   escreval("------")
   escreval("RELATÓRIO DE INVESTIMENTOS DOS ÚLTIMOS 12 MESES: ")
   escreval("UNIDADES EM MILHÕES DE REAIS")

   //Exibe o total de investimentos
   escreval("------")
   escreval("Total Investido: ", totalInvestimentos())

   escreval("")
   escreval("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
   escreval("")
   //Exibe o total de investimentos no exterior e no Brasil, separados
   escreval("Total Investido no Brasil: ", totalInvestimentosBrasil())
   escreval("Total Investido no Exterior: ", totalInvestimentosExterior())

   //Exibe a proporção de investimentos por local
   escreval("------")
   escreval("Brasil: ", porcentagemInvestimentosBrasil():3:1, "%")
   escreval("Exterior: ", porcentagemInvestimentosExterior():3:1, "%")

   //Criar Gráfico de locais
   escreval("------")
   escreval("Proporção por local: ")

   //Gráfico do Brasil
   escreva("Brasil:   ")
   // Para cada unidade de porcentagem...
   para i de 0 ate Int(porcentagemInvestimentosBrasil()) faca
      escreva("|") //Adiciona um traço ao gráfico
   fimpara
   escreval("") // Pula uma linha para sair do gráfico


   //Gráfico do Exterior
   escreva("Exterior: ")
   // Para cada unidade de porcentagem...
   para i de 0 ate Int(porcentagemInvestimentosExterior()) faca
      escreva("|") //Adiciona um traço ao gráfico
   fimpara
   escreval("") // Pula uma linha para sair do gráfico



   //Exibe todos os totais de investimentos por trimestre
   escreval("")
   escreval("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
   escreval("")
   escreval("Total de investimentos por trimestre: ")
   //Guarda o ano e trimestre em variáveis auxiliares
   anoAux <- anoBase
   trimestreAux <- trimestreBase

   //Para cada trimestre
   para i de 0 ate 3 faca
      // Informa os detalhes do trimestre (Ex: 2T21) e informa o total do mesmo
      escreval(trimestreAux, "T", anoAux, ":", totalInvestimentosTrimestre(anoAux, trimestreAux))

      //Subtração do trimestre para próxima verificação
      trimestreAux <- trimestreAux - 1
      //Caso o trimestre seja menor ou igual a 0...
      se trimestreAux <= 0 entao
         anoAux <- anoAux - 1 // Subtrai o ano
         trimestreAux <- 4 // Retorna o trimestre a 4
      fimse
   fimpara
   
   
   //Exibe a proporção de investimentos por trimestre
   escreval("Proporção por trimestre: ")
   
   //Guarda o ano e trimestre em variáveis auxiliares
   anoAux <- anoBase
   trimestreAux <- trimestreBase

   //Para cada trimestre...
   para i de 0 ate 3 faca
      escreval(trimestreAux, "T", anoAux, ": ", porcentagemInvestimentosTrimestre(anoAux, trimestreAux):3:1, "%")

      //Subtração do trimestre para próxima verificação
      trimestreAux <- trimestreAux - 1
      //Caso o trimestre seja menor ou igual a 0...
      se trimestreAux <= 0 entao
         anoAux <- anoAux - 1 // Subtrai o ano
         trimestreAux <- 4 // Retorna o trimestre a 4
      fimse
   fimpara

   //Criar Gráfico de trimestres
   escreval("------")
   escreval("Gráfico de proporção por trimestre: ")
   
   //Guarda o ano e trimestre em variáveis auxiliares
   anoAux <- anoBase
   trimestreAux <- trimestreBase
   para i de 0 ate 3 faca
      //Escreve informações do trimestre (Ex: 2T21)
      escreva(trimestreAux, "T", anoAux, ": ")
      // Para cada unidade de porcentagem...
      para i de 0 ate Int((100 * totalInvestimentosTrimestre(anoAux, trimestreAux)) / totalInvestimentos()) faca
         escreva("|") //Adiciona um traço ao gráfico
      fimpara
      escreval("")// Pula uma linha para sair do gráfico

      //Subtração do trimestre para próxima verificação
      trimestreAux <- trimestreAux - 1
      //Caso o trimestre seja menor ou igual a 0...
      se trimestreAux <= 0 entao
         anoAux <- anoAux - 1 // Subtrai o ano
         trimestreAux <- 4 // Retorna o trimestre a 4
      fimse
   fimpara

   escreval("------")
   escreval("FIM DO RELATÓRIO")
Fimalgoritmo