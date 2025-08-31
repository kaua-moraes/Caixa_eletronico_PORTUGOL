programa
{
   	real saldo = 150.00, saque, deposito, valor // Float
   	inteiro opcao, senha = 1010, passw, tentativas = 0, transfere
   	cadeia nome
   	logico acesso1 = verdadeiro

	funcao inicio() {

          //exibir a mensagem para informar somente o nome de acesso 
		se (acesso1 == verdadeiro){
		escreva("SEJA BEM-VINDO(A) AO CAIXA ELETRÔNICO!\n")
		escreva("Antes de tudo informe suas credenciais: ")
		leia(nome)

		limpa()
		
		escreva("Olá, " , nome , "! É um prazer telo conosco\n")}

		//senão já cai no falso, não permitindo o loop
		acesso1 = falso

		escreva("Escolha uma opção:\n")
		escreva("1. Ver saldo\n")
		escreva("2. Ver extrato \n")
		escreva("3. Fazer saque\n")
		escreva("4. Fazer depósito \n")
		escreva("5. Fazer transferência \n")
		escreva("6. Sair\n")
		leia(opcao)

		escreva("A opção selecionada foi: " + opcao + "\n")

		//escolha/caso invés de se/senão
		escolha (opcao) {
    		caso 1:
        		verSaldo()
       	pare
    		caso 2:
        		verExtrato()
        	pare
    		caso 3:
        		fazerSaque()
        	pare
    		caso 4:
        		fazerDeposito()
        	pare
        	caso 5:
        		fazerT()
        	pare
        	caso 6:
        		sair()
        	pare
    		caso contrario:
        	erro()
        	inicio()
		}
	}


	funcao verSaldo(){
	 limpa()
	 escreva("Para acessar ao SALDO. Digite sua senha: ")
	 leia(passw)
	 
	 	se (passw == 1010){
	   	escreva("Seu saldo atual é: ", saldo, "\n")
	   	tentativas = 0
	   	inicio()
	   	} senao {
	   	tentativas = tentativas +1
	   	se (tentativas < 3){
		escreva("Senha incorreta. Você tem ", 3 - tentativas, " tentativas.\n")
		verSaldo() 
		} senao {
		escreva("Tentivas esgotadas, senha BLOQUEADA!\n")
		sair()
		}
		}
	}

				
	funcao verExtrato() {

	escreva("Para acessar EXTRATO. Digite sua senha: ")
	leia(passw)
	limpa()
		
		se (passw == 3589){
			
		escreva("SEU EXTRATO \n")
		escreva("Data		Descrição					Valor (R$) \n")
		escreva("05/04		Compra - Supermercado 	  	- 150,00 \n")
		escreva("08/05		Compra - Loja de Roupas    	- 85,00 \n")
		escreva("12/05		Transferência - Roberto	  	+ 200,00 \n")
		escreva("15/05		Compra - Farmâcia	       	- 45,00 \n")
		escreva("18/06		Compra - Perfumaria           - 25,00 \n")
		escreva("20/06 	Compra - Padaria           	- 25,00 \n")
		escreva("23/07	  	Transferência - Maria	  	+ 50,00 \n")
		escreva("\n")

	   	tentativas = 0
	   	inicio()
	   	
	   	} senao {
	   	tentativas = tentativas +1
	   	se (tentativas < 3){
		escreva("Senha incorreta. Você tem ", 3 - tentativas, " tentativas.\n")
		verExtrato() 
		} senao {
		escreva("Tentivas esgotadas. \n")
		sair()
	     }
	   }
	}


	funcao fazerSaque(){
	limpa()
	escreva("Para acessar SAQUE. Digite sua senha: ")
	leia(passw)

		se (passw == 1010){
			
	   	escreva("Digite o valor que deseja sacar: ")
		leia(saque)
	
		se (saque <= 0){
	        escreva("Operação não autorizada. Informe um valor válido! \n")
	        fazerSaque()
		   } senao se(saque > saldo){
		   escreva("Operação não realizada. Saldo insuficiente! \n")
	        fazerSaque()
		   }senao {
		   saldo = saldo - saque
		   escreva("Saldo atual R$ ",saldo, "\n")
		   inicio()
		   }
	
	   	} senao {
	   	tentativas = tentativas +1
	   	se (tentativas < 3){
		escreva("Senha incorreta. Você tem ", 3 - tentativas, " tentativas.\n")
		fazerSaque() 
		} senao {
		escreva("Tentivas esgotadas, senha BLOQUEADA! \n")
		sair()
		}
	     }
	}
 

	funcao fazerDeposito() {
		limpa()
		escreva("Qual o valor para depósito? ")
		leia(deposito)
		
		se (deposito <= 0){
		escreva("Operação inválida!!!\n")
		fazerDeposito()
		} senao {
		saldo = saldo + deposito
		verSaldo()
		}
	}
	
	
	funcao fazerT() {
	limpa()
	escreva("Para acessar TRANSFERÊNCIA. Digite sua senha: ")
	leia(passw)

		se (passw == 1010){
		escreva("SEU SALDO ATUAL É DE R$ ", saldo, "\n")
		
		escreva("Número da agência? (Somente números)")
		leia(transfere)
		escreva("\n")

		escreva("Valor da transferência? ")
		leia(valor)
		escreva("\n")		
	
		se (valor <= 0){
	        escreva("Operação não autorizada. Informe um valor válido! \n")
	        fazerT()
		} senao se(valor > saldo){
			escreva("Operação não autorizada. Saldo insuficiente! \n")
	        fazerT()
		} senao {
			saldo = saldo - valor

			escreva("\n")
           	escreva("Transferência realizada com sucesso!\n")
        		escreva("Agência de destino: ", transfere, " e Valor transferido: R$ " , valor, "\n")
		} 
		inicio()}

		senao {
	   	tentativas = tentativas +1
	   	se (tentativas < 3){
		escreva("Senha incorreta. Você tem ", 3 - tentativas, " tentativas.\n")
		fazerT() 
		} senao {
		escreva("Tentivas esgotadas. \n")
		sair()
		}
		}
	}

 
	funcao erro() {
		limpa()
		escreva("Programa encerrado")
		inicio()
	}

	funcao sair(){
		limpa()
		escreva( nome,"Obrigado por confiar em nossos serviços, foi um prazer ter você por aqui!")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4833; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */