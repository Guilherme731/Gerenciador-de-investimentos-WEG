Algoritmo "semnome"
// Disciplina   : [Linguagem e L�gica de Programa��o]
// Professor   : Antonio Carlos Nicolodi
// Descri��o   : Aqui voc� descreve o que o programa faz! (fun��o)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 18/11/2024
Var
   // Se��o de Declara��es das vari�veis

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
   escreval("Insira informa��es referentes a investimentos, em R$ milh�es ")
   escreval("Digite o total de investimentos no Exterior para cada trimestre: ")

   //Solicita, para 4 trimestres a partir do informado, os investimentos no exterior
   para i de 0 ate 3 faca

      //Escreve e l� as informa��es
      escreval(trimestreVerificado, "T", anoVerificado, ": ")
      leia(investimentosExteriores[i])

      //Subtrai o trimestre e, se necess�rio, o ano para a proxima verifica��o
      trimestreVerificado <- trimestreVerificado - 1
      se (trimestreVerificado <= 0) entao // Se o trimestre for menor ou igual a 0...
         trimestreVerificado <- 4  //Reinicia o trimestre para 4
         anoVerificado <- anoverificado - 1 //Subtrai o ano
      fimse
   fimpara

   //PARA O BRASIL

   //Restaura as variaveis auxiliares para a pr�xima verifica��o para o Brasil
   anoVerificado <- ano
   trimestreVerificado <- trimestre
   escreval("Digite o total de investimentos no Brasil para cada trimestre: ")

   //Solicita, para 4 trimestres a partir do informado, os investimentos no Brasil
   para i de 0 ate 3 faca

      //Escreve e l� as informa��es
      escreval(trimestreVerificado, "T", anoVerificado, ": ")
      leia(investimentosBrasil[i])

      //Subtrai o trimestre e, se necess�rio, o ano para a proxima verifica��o
      trimestreVerificado <- trimestreVerificado - 1
      se (trimestreVerificado <= 0) entao // Se o trimestre for menor ou igual a 0...
         trimestreVerificado <- 4  //Reinicia o trimestre para 4
         anoVerificado <- anoverificado - 1 //Subtrai o ano
      fimse
   fimpara
fimprocedimento


//Fun��o que retorna o total de investimentos de determinado trimestre
funcao totalInvestimentosTrimestre(ano, trimestre:inteiro): real
var
   posVetor: inteiro
inicio
   posVetor <- 0 //Garante que a posi��o � 0

   //Verifica se o ano informado � o mesmo de base
   se ano = anoBase entao
      posVetor <- trimestreBase - trimestre //Apenas subtrai o trimestre informado da base
   senao
      se ano = anoBase -1 entao
         posVetor <- trimestreBase - (trimestre - 4) // Subtrai do trimestre informado menos 4 para simular o ano na posi��o do vetor
      fimse
   fimse

   //Retorna a soma dos investimentos de cada local, armazenadas na posi��o calculada
   retorne investimentosExteriores[posVetor] + investimentosBrasil[posVetor]
fimfuncao



//Fun��o que retorna o total de investimentos no Brasil
funcao totalInvestimentosBrasil(): real
var
   total: real
   i: inteiro
inicio
   // Para cada posi��o no vetor do brasil...
   para i de 0 ate 3 faca
      total <- total + investimentosBrasil[i] //Soma o valor ao total
   fimpara
   retorne total // Retorna o total
fimfuncao



//Fun��o que retorna o total de investimentos no exterior
funcao totalInvestimentosExterior(): real
var
   total: real
   i: inteiro
inicio
   // Para cada posi��o no vetor do exterior...
   para i de 0 ate 3 faca
      total <- total + investimentosExteriores[i] //Soma o valor ao total
   fimpara
   retorne total //Retorna o total
fimfuncao



//Fun��o que retorna o total de investimentos no per�odo de 12 meses
funcao totalInvestimentos(): real
var
inicio
   retorne totalInvestimentosExterior() + totalInvestimentosBrasil() //Soma o valor de duas fun��es de soma de investimentos de locais
fimfuncao



//Fun��o que retorna a porcentagem de investimentos no Brasil
funcao porcentagemInvestimentosBrasil(): real
var
inicio
   retorne (100 * totalInvestimentosBrasil()) / totalInvestimentos() //Calculo de porcentagem
fimfuncao



//Fun��o que retorna a porcentagem de investimentos no Brasil
funcao porcentagemInvestimentosExterior(): real
var
inicio
   retorne (100 * totalInvestimentosExterior()) / totalInvestimentos() //Calculo de porcentagem
fimfuncao



//Fun��o que retorna a porcentagem de investimentos no trimestre
funcao porcentagemInvestimentosTrimestre(ano, trimestre: inteiro): real
var
inicio
   retorne (100 * totalInvestimentosTrimestre(ano, trimestre)) / totalInvestimentos() //Calculo de porcentagem
fimfuncao




//Se��o Principal do c�digo
Inicio
   // Se��o de Comandos, procedimento, fun��es, operadores, etc...

   //Informa��es iniciais para o usu�rio
   escreval("Bem vindo(a) ao sistema de Processamento de Investimentos da WEG")
   escreval("Todas as informa��es necess�rias est�o dispon�veis no documento APRESENTA��O DOS RESULTADOS em ri.weg.net/informacoes-financeiras/central-de-resultados")
   escreval("No slide do site, procure um gr�fico com investimentos do Brasil e Exterior por trimestre")
   escreval("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
   escreval("Para come�ar, insira informa��es b�sicas referentes aos investimentos")
   escreval("Qual o ano base dos investimentos? (Considere o ano do trimestre mais recente a ser analisado e informe 2 n�meros)")
   escreval("Ex: 2019 = 19 | 2021 = 21")
   leia(anoBase) //L� o ano
   escreval("Qual o trimestre a ser analisado (digite apenas o n�mero)")
   leia(trimestreBase) //L� o trimestre

   lerInvestimentos(anoBase, trimestreBase)  //l� todos os dados de investimentos que o usu�rio fornecer

   //Exibe mensagem de relat�rio
   escreval("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
   escreval("")
   escreval("------")
   escreval("RELAT�RIO DE INVESTIMENTOS DOS �LTIMOS 12 MESES: ")
   escreval("UNIDADES EM MILH�ES DE REAIS")

   //Exibe o total de investimentos
   escreval("------")
   escreval("Total Investido: ", totalInvestimentos())

   escreval("")
   escreval("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
   escreval("")
   //Exibe o total de investimentos no exterior e no Brasil, separados
   escreval("Total Investido no Brasil: ", totalInvestimentosBrasil())
   escreval("Total Investido no Exterior: ", totalInvestimentosExterior())

   //Exibe a propor��o de investimentos por local
   escreval("------")
   escreval("Brasil: ", porcentagemInvestimentosBrasil():3:1, "%")
   escreval("Exterior: ", porcentagemInvestimentosExterior():3:1, "%")

   //Criar Gr�fico de locais
   escreval("------")
   escreval("Propor��o por local: ")

   //Gr�fico do Brasil
   escreva("Brasil:   ")
   // Para cada unidade de porcentagem...
   para i de 0 ate Int(porcentagemInvestimentosBrasil()) faca
      escreva("|") //Adiciona um tra�o ao gr�fico
   fimpara
   escreval("") // Pula uma linha para sair do gr�fico


   //Gr�fico do Exterior
   escreva("Exterior: ")
   // Para cada unidade de porcentagem...
   para i de 0 ate Int(porcentagemInvestimentosExterior()) faca
      escreva("|") //Adiciona um tra�o ao gr�fico
   fimpara
   escreval("") // Pula uma linha para sair do gr�fico



   //Exibe todos os totais de investimentos por trimestre
   escreval("")
   escreval("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
   escreval("")
   escreval("Total de investimentos por trimestre: ")
   //Guarda o ano e trimestre em vari�veis auxiliares
   anoAux <- anoBase
   trimestreAux <- trimestreBase

   //Para cada trimestre
   para i de 0 ate 3 faca
      // Informa os detalhes do trimestre (Ex: 2T21) e informa o total do mesmo
      escreval(trimestreAux, "T", anoAux, ":", totalInvestimentosTrimestre(anoAux, trimestreAux))

      //Subtra��o do trimestre para pr�xima verifica��o
      trimestreAux <- trimestreAux - 1
      //Caso o trimestre seja menor ou igual a 0...
      se trimestreAux <= 0 entao
         anoAux <- anoAux - 1 // Subtrai o ano
         trimestreAux <- 4 // Retorna o trimestre a 4
      fimse
   fimpara
   
   
   //Exibe a propor��o de investimentos por trimestre
   escreval("Propor��o por trimestre: ")
   
   //Guarda o ano e trimestre em vari�veis auxiliares
   anoAux <- anoBase
   trimestreAux <- trimestreBase

   //Para cada trimestre...
   para i de 0 ate 3 faca
      escreval(trimestreAux, "T", anoAux, ": ", porcentagemInvestimentosTrimestre(anoAux, trimestreAux):3:1, "%")

      //Subtra��o do trimestre para pr�xima verifica��o
      trimestreAux <- trimestreAux - 1
      //Caso o trimestre seja menor ou igual a 0...
      se trimestreAux <= 0 entao
         anoAux <- anoAux - 1 // Subtrai o ano
         trimestreAux <- 4 // Retorna o trimestre a 4
      fimse
   fimpara

   //Criar Gr�fico de trimestres
   escreval("------")
   escreval("Gr�fico de propor��o por trimestre: ")
   
   //Guarda o ano e trimestre em vari�veis auxiliares
   anoAux <- anoBase
   trimestreAux <- trimestreBase
   para i de 0 ate 3 faca
      //Escreve informa��es do trimestre (Ex: 2T21)
      escreva(trimestreAux, "T", anoAux, ": ")
      // Para cada unidade de porcentagem...
      para i de 0 ate Int((100 * totalInvestimentosTrimestre(anoAux, trimestreAux)) / totalInvestimentos()) faca
         escreva("|") //Adiciona um tra�o ao gr�fico
      fimpara
      escreval("")// Pula uma linha para sair do gr�fico

      //Subtra��o do trimestre para pr�xima verifica��o
      trimestreAux <- trimestreAux - 1
      //Caso o trimestre seja menor ou igual a 0...
      se trimestreAux <= 0 entao
         anoAux <- anoAux - 1 // Subtrai o ano
         trimestreAux <- 4 // Retorna o trimestre a 4
      fimse
   fimpara

   escreval("------")
   escreval("FIM DO RELAT�RIO")
Fimalgoritmo