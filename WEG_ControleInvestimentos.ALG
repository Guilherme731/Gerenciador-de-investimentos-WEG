Algoritmo "semnome"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Nome do(a) aluno(a)
// Data atual  : 18/11/2024
Var
   // Seção de Declarações das variáveis

   investimentosExteriores, investimentosBrasil: vetor[0..3] de real
   anoBase, trimestreBase: inteiro

procedimento lerInvestimentos(ano, trimestre: inteiro)
var
   i: inteiro
   anoVerificado, trimestreVerificado: inteiro
inicio
   anoVerificado <- ano
   trimestreVerificado <- trimestre
   escreval("Insira informações referentes a investimentos, em R$ milhões ")

   escreval("Digite o total de investimentos no Exterior para cada trimestre: ")
   para i de 0 ate 3 faca
      escreval(trimestreVerificado, "T", anoVerificado, ": ")
      leia(investimentosExteriores[i])

      //Subtrai o trimestre para a proxima verificação
      trimestreVerificado <- trimestreVerificado - 1
      se (trimestreVerificado <= 0) entao
         trimestreVerificado <- 4
         anoVerificado <- anoverificado - 1
      fimse
   fimpara

   anoVerificado <- ano
   trimestreVerificado <- trimestre
   escreval("Digite o total de investimentos no Brasil para cada trimestre: ")
   para i de 0 ate 3 faca
      escreval(trimestreVerificado, "T", anoVerificado, ": ")
      leia(investimentosBrasil[i])

      //Subtrai o trimestre para a proxima verificação
      trimestreVerificado <- trimestreVerificado - 1
      se (trimestreVerificado <= 0) entao
         trimestreVerificado <- 4
         anoVerificado <- anoverificado - 1
      fimse
   fimpara
fimprocedimento


funcao totalInvestimentosTrimestre(ano, trimestre:inteiro): real
var
trimestreVerificado: inteiro
inicio
   se ano = anoBase entao
      trimestreVerificado <- trimestreBase - trimestre
      senao
      se ano = anoBase -1 entao
         trimestreVerificado <- trimestreBase - (trimestre - 4)
      fimse
   fimse
   retorne investimentosExteriores[trimestreVerificado] + investimentosBrasil[trimestreVerificado]
fimfuncao

Inicio
   // Seção de Comandos, procedimento, funções, operadores, etc...
   escreval("Bem vindo ao sistema de Processamento de Investimentos da WEG")
   escreval("Todas as informações necessárias estão disponíveis no documento APRESENTAÇÃO DOS RESULTADOS em ri.weg.net/informacoes-financeiras/central-de-resultados")
   escreval("Para começar, insira informações básicas referentes aos investimentos")
   escreval("Qual o ano base dos investimentos? (Considere o ano do trimestre mais recente a ser analisado)")
   leia(anoBase)
   escreval("Qual o trimestre a ser analisado (digite apenas o número)")
   leia(trimestreBase)
   lerInvestimentos(anoBase, trimestreBase)
   escreval(totalInvestimentosTrimestre(23, 4))


Fimalgoritmo