programa 
{
     inclua biblioteca Util --> U
     inclua biblioteca Tipos --> T
     real media_aluno = 0.0
     real media_turma = 0.0
     real somaMedia_aluno = 0.0

     cadeia matriz[4][9]
     caracter opcao
     inteiro Num_linhas = U.numero_linhas(matriz)
     inteiro Num_colunas = U.numero_colunas(matriz)
     inteiro ultimo_cadastro = 0
     inteiro t = 1

     funcao inicio() // Menu
     {
          faca {
               U.aguarde(500)
			escreva("\n\nEscolha uma das opções abaixo com o digito numérico correspondente: ")
	          escreva("\n1 - Cadastro de aluno: ")
	          escreva("\n2 - Exibir a lista de alunos: ")
	          escreva("\n3 - Editar um aluno:")
	          escreva("\n4 - Calcular a média de aluno: ")
	          escreva("\n5 - Calcular a média da turma: ")
	          escreva("\n6 - Mural de Aniversários: ")
	          escreva("\n7 - Finalizar o programa? \n\nQual sua opção?		")
	          leia(opcao)
	          limpa()

               escolha (opcao) {
                    caso '1':
                    	cadastramento()
                         pare
                    caso '2':
                    	escreva("Segue lista de alunos: \n")
                    	exibirAlunos()   				
					pare	
                    caso '3':
                    	inteiro alunoEdit
	                    escreva("Escolha qual aluno gostaria de remover: \t")
	                    para(inteiro i = 0; i < Num_linhas; i++){
	                    	se(matriz[i][0] != ""){
	                    		escreva((i+1), ": ", matriz[i][0], "\n")
	                    	}		
	                    }
	                    leia(alunoEdit)
	                    inteiro result = alunoEdit - 1
	                    
	 				U.aguarde(500)
	                    cadeia alu, mesN, tur, not1, not2, not3
	                    escreva("Insira os dados do novo aluno? \n")
	 				U.aguarde(500)
	                    escreva("Qual o novo Aluno: ")
	                    leia(alu)
	                    matriz[result][0] = alu
	 				escreva("Qual o mes de aniversário: ")
	                    leia(mesN)
	                   	matriz[result][1] = mesN
	                   	escreva("Qual a turma: ")
	                    leia(tur)
	 				matriz[result][2] = tur
	 				escreva("Qual a 1ª nota: ")
	                    leia(not1)
	 				matriz[result][3] = not1
	 				escreva("Qual a 2ª nota: ")
	                    leia(not2)
	 				matriz[result][4] = not2
	 				escreva("Qual a 3ª nota: ")
	                    leia(not3)
	 				matriz[result][5] = not3
	 				escreva("Novo aluno cadastrado com sucesso")
	 				U.aguarde(1000)
	 				
	 				pare		
                    caso '4':
                         inteiro aluno    
					para(inteiro i = 0; i < Num_linhas; i++){
						escreva("\n",(i+1)," - ", matriz[i][0],"\n") //Para com a qtd de elementos da matriz
					}
					escreva("Qual aluno gostaria de verificar a média? \n")
					
					leia(aluno)
					inteiro pos = aluno - 1
					situacaoAluno(pos)
	                    pare
                    caso '5':
                         inteiro cod_turma
                         para(inteiro i = 0; i < Num_linhas; i++){
                         	se(matriz[i][2] != ""){
						escreva("\nTurma - ", matriz[i][2],"\n") //Para com a qtd de elementos da matriz
                         	}
					}
                    	escreva("Informe a turma para calcular a média: ")
                    	leia(cod_turma)
                    	calcularMediaTurma(matriz, T.inteiro_para_cadeia(cod_turma, 10)) // Chama a função com os parâmetros corretos
                         pare
                    caso '6':
                    	muralAniversario()
                         pare
                    caso '7':
                    	limpa()
                    	pare
                    caso contrario:
                    	limpa()
                    	inicio()
                    }
               }
          enquanto (opcao < '7')
     }

     funcao vazio cadastramento() { //Cadastrar alunos
     	
    	caracter novo_cadastro = 'i'
    	inteiro mes_nasc
    	real z
    	logico teste 

    	para (inteiro i = ultimo_cadastro; i < Num_linhas; i++) {
        para (inteiro j = 0; j < (Num_colunas-2); j++) {
            se (j == 0) {
                escreva("\nInforme o nome do aluno " + (i+1) + ": ")
                leia(matriz[i][j])
            }
            se (j == 1) {
                faca {
                    escreva("\nInforme o Mês de nascimento (ex.: 06) do aluno " + (i+1) + ":  ")
                    leia(mes_nasc)
                    //mes_nasc = T.cadeia_para_inteiro(matriz[i][j], 10)
                    se (mes_nasc < 1 ou mes_nasc > 12) {
                        escreva("Digite um mês válido!")
                    }
                } enquanto (mes_nasc < 1 ou mes_nasc > 12)
                
                matriz[i][j] = T.inteiro_para_cadeia(mes_nasc, 10)
            }
            se (j == 2) {
                escreva("\nInforme a turma:  ")
                leia(matriz[i][j])
            }
            se (j >= 3 e j <= 5) {
                t = j - 2
                
                faca {
                    escreva("\nDigite a ", t , "ª nota, entre 0 e 10, do aluno ", (i+1), " :  ")
                    leia(matriz[i][j])
                    z = T.cadeia_para_real(matriz[i][j])
                    
                    se (z < 0 ou z > 10) {
                        escreva("\nDado inválido! Digite a ", t , "ª nota, entre 0 e 10, do aluno: ", (i+1)) 
                    }
                } enquanto (z < 0 ou z > 10)
            }
        }
        
        // Verifica se o usuário deseja fazer um novo cadastro
 
       faca{
	      escreva("\nNovo cadastro? (S/N)\t")
	      leia(novo_cadastro)   

		teste = novo_cadastro != 'S' e novo_cadastro != 's' e novo_cadastro != 'N' e novo_cadastro != 'n'
		
	      se (teste){
	         escreva("\nOpção inválida!")
	         U.aguarde(500)
	       }
	       
       }enquanto(teste)

       se (novo_cadastro == 'N' ou novo_cadastro == 'n') {
	          ultimo_cadastro = i + 1  
	          pare                              
	  }
       }
     }

	funcao vazio exibirAlunos() // SE VAZIO error - devemos realizar a verificação se todos os pontos estão preenchidos
	{
	escreva("Exibindo Lista de Alunos:\n")
    	escreva("\n-----------------------------\n")

    		para (inteiro i = 0; i < Num_linhas; i = i + 1) {

    		se(matriz[i][0] != "" ){
        	escreva("Aluno: ", matriz[i][0], "\n")
        	escreva("Mês de Nascimento: ", matriz[i][1], "\n")
        	escreva("Turma: ", matriz[i][2], "\n")
        	escreva("Primeira Nota: ", matriz[i][3], "\n")
        	escreva("Segunda Nota: ", matriz[i][4], "\n")
        	escreva("Terceira Nota: ", matriz[i][5], "\n")

          situacaoAluno(i)
    		} senao {
    			pare
    		}
        
        	escreva("\n-----------------------------\n")
    		}
    		U.aguarde(1500)
	}

	funcao vazio situacaoAluno (inteiro i)
	{   
		
		real n1, n2, n3
	    	   
		//converte de cadeia para real
		n1 = T.cadeia_para_real(matriz[i][3])
		n2 = T.cadeia_para_real(matriz[i][4])
		n3 = T.cadeia_para_real(matriz[i][5])
		media_aluno = (n1 + n2 + n3) / 3
		matriz[i][6]= T.real_para_cadeia(media_aluno)
		
		
	
		se(media_aluno >= 6){
			escreva("A média deste aluno foi: ", media_aluno)
			escreva("\nAprovado!")
			//matriz[i][7]= "Aprovado"
			U.aguarde(1000)
			gravaSituacaoPos(i, media_aluno)
		}
		senao {
			escreva("A média deste aluno foi: ", media_aluno)
			escreva("\nReprovado!")
			//matriz[i][7]= "Reprovado"
			U.aguarde(1000)
			gravaSituacaoNeg(i, media_aluno)
		}
	}

     funcao vazio calcularMediaTurma(cadeia alunos[][], cadeia cod_Turma){
        real soma = 0.0, media1
        inteiro turma = 0
        
        para(inteiro i = 0; i < U.numero_linhas(alunos); i++){
            se(alunos[i][2] == cod_Turma){ // Verifica se a turma do aluno é igual à turma informada
                real n1 = T.cadeia_para_real(alunos[i][3])
                real n2 = T.cadeia_para_real(alunos[i][4])
                real n3 = T.cadeia_para_real(alunos[i][5])
                
                soma += (n1 + n2 + n3) / 3 // Calcula a média e soma à variável
                turma++
            }    
        }
        
        limpa()
        se (turma > 0) {
            escreva("A média da turma ", cod_Turma, " é: ", soma / turma, "\n")
            se(soma < 6){
			
			escreva("\nO conceito da turma é: Ruim!")
			U.aguarde(1000)
		}
		senao se(soma >= 6 ou soma < 8 ) {
			
			escreva("\nconceito da turma é: Médio!")
			U.aguarde(1000)
		}
		senao se(soma >= 8 ou soma < 10) {
			
			escreva("conceito da turma é: Bom!")
			U.aguarde(1000)
		}
		senao{
			
			escreva("conceito da turma é: Excelente!")
			U.aguarde(1000)
		}
            U.aguarde(1500)
        } senao {
            escreva("Turma não encontrada ou sem alunos cadastrados.\n")
            U.aguarde(1500)
        }
    }

	funcao vazio gravaSituacaoPos(inteiro i,real argumento){

		matriz[i][7]= "Aprovado"
		
	}
	
	funcao vazio gravaSituacaoNeg(inteiro i,real argumento){

		matriz[i][7]= "Reprovado"
		
	}

     funcao vazio muralAniversario() 
	{
	    
		escreva("Mural de Aniversários:\n")   

		para (inteiro mes = 1; mes <= 12; mes++) 
		{
			para(inteiro i = 0; i< Num_linhas; i++)
			{	
				se(matriz[i][1] != ""){
				inteiro mes_aniversario = T.cadeia_para_inteiro(matriz[i][1], 10)
				
				se(mes_aniversario == mes)
				{	
					escreva("\nAniversariantes do mês ", mes, ":\n")
					escreva("Nome: ", matriz[i][0], "\n")	
				}
				}	
			}
		}
	} 
	
}
