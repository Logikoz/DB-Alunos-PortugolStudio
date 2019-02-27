/*
	Name: Banco de Dados - Alunos
	Copyright:Discord: Logikoz#9821     facebook: www.facebook.com/RuanCarlosCS
	Author: Logikoz
	Date: 13/09/18 02:13
	Description: Um pequeno programa que cadastra alunos e faz checagens dos mesmos, e com um acesso ao modo administrador!
*/

programa
{
	inclua biblioteca Arquivos --> a
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> t
	inclua biblioteca Calendario --> c
	inclua biblioteca Graficos --> g
	inclua biblioteca Mouse --> m
	inclua biblioteca Teclado --> te

	//VARIAVEIS GLOBAIS
	//======================================

	inteiro Confirm = 0
	inteiro UsuarioG = 0

	cadeia LoginG = "0"
	cadeia SenhaG = "0"
	cadeia UserG = "0"

	const inteiro TamanhoTelaPC = 1300
	const inteiro AlturaTelaPC = 750
	
	inteiro larguraImg = 0
	inteiro alturaImg = 0

	//======================================
	
	funcao Retorno_Negados()
	{
			cadeia NegadosNomeDIRETORIO = c.dia_mes_atual() + "-" + c.mes_atual() + "-" + c.ano_atual() + "-" + ".log" + "(" +  u.sorteia(0, 15) + ")"

			logico Check = a.arquivo_existe(NegadosNomeDIRETORIO)
				enquanto (Check == verdadeiro)
					{
						cadeia NomeArquivo = c.dia_mes_atual() + "-" + c.mes_atual() + "-" + c.ano_atual() + "-" + ".log" + "(" +  u.sorteia(0, 15) + ")"

						NegadosNomeDIRETORIO = NomeArquivo
					}
	
			cadeia Caminho_AcessoNegado = "./Banco_de_Dados/Admin/Acessos/Negados/" + NegadosNomeDIRETORIO + ".txt"
								
			inteiro ArquivoCaminho = a.abrir_arquivo(Caminho_AcessoNegado, 1)
			
			cadeia diretorio = u.obter_diretorio_usuario()
			a.escrever_linha("Tipo: Negado", ArquivoCaminho)
			a.escrever_linha("Diretorio do Usuario: " + diretorio , ArquivoCaminho)
			a.escrever_linha("Data: " + c.dia_mes_atual() + "/" + c.mes_atual() + "/" + c.ano_atual(), ArquivoCaminho)
			a.escrever_linha("Horario " + c.hora_atual(falso) + ":" + c.minuto_atual() + ":" + c.segundo_atual() + ":" + c.milisegundo_atual(), ArquivoCaminho)
	
			inteiro negados a.fechar_arquivo(ArquivoCaminho)
		retorne
	}
	
	funcao ConfirmarADMIN(inteiro &Confirmar)
	{
		escreva("\nInforme Seus Dados de Acesso.\n\n")
		cadeia Usuario, senha
		escreva("Usuario: ")
		leia(Usuario)
		escreva("\nSenha: ")
		leia (senha)
		
		logico UsuarioAcesso
				
		UsuarioAcesso = a.arquivo_existe("./Banco_de_Dados/Admin/Contas/" + Usuario + ".txt")

			se (UsuarioAcesso == verdadeiro)
			{
				cadeia CaminhoSenha = "./Banco_de_Dados/Admin/Contas/" + Usuario + ".txt"
				inteiro AbrirA_SenhasADM = a.abrir_arquivo(CaminhoSenha, 0)
				cadeia UserName = a.ler_linha(AbrirA_SenhasADM)
				cadeia SenhaAcesso = a.ler_linha(AbrirA_SenhasADM)
				
				se (senha == SenhaAcesso)
				{
					limpa()
					escreva("\n\nEntrando, Aguarde...")
					u.aguarde(3000)

					Confirmar = 1
					LoginG = Usuario
					SenhaG = senha
					UserG = UserName
					
					//-----------------------------------------------------

					cadeia PermitidosNomeDIRETORIO = c.dia_mes_atual() + "-" + c.mes_atual() + "-" + c.ano_atual() + "-" + ".log" + "(" +  u.sorteia(0, 15) + ")"

					logico Check = a.arquivo_existe(PermitidosNomeDIRETORIO)
						enquanto (Check == verdadeiro)
						{
							cadeia NomeArquivo = c.dia_mes_atual() + "-" + c.mes_atual() + "-" + c.ano_atual() + "-" + ".log" + "(" +  u.sorteia(0, 15) + ")"
				
							PermitidosNomeDIRETORIO = NomeArquivo
						}

					cadeia Caminho_AcessoPermitido = "./Banco_de_Dados/Admin/Acessos/Permitidos/" + PermitidosNomeDIRETORIO + ".txt"
												
					inteiro ArquivoCaminho = a.abrir_arquivo(Caminho_AcessoPermitido, 1)
							
					cadeia diretorio = u.obter_diretorio_usuario()
											
					a.escrever_linha("Tipo: Permitido", ArquivoCaminho)
					a.escrever_linha("Nome do Usuario: " + UserName, ArquivoCaminho)
					a.escrever_linha("Diretorio do Usuario: " + diretorio , ArquivoCaminho)
					a.escrever_linha("Data: " + c.dia_mes_atual() + "/" + c.mes_atual() + "/" + c.ano_atual(), ArquivoCaminho)
					a.escrever_linha("Horario " + c.hora_atual(falso) + ":" + c.minuto_atual() + ":" + c.segundo_atual() + ":" + c.milisegundo_atual(), ArquivoCaminho)
					
					inteiro negados a.fechar_arquivo(ArquivoCaminho)

					//-----------------------------------------------------

					a.fechar_arquivo(AbrirA_SenhasADM)
				}
				senao se (senha != SenhaAcesso)
				{
					limpa()
					escreva("\nSenha Inválida!\n\n")

					Retorno_Negados()
					a.fechar_arquivo(AbrirA_SenhasADM)
				}
			}

			senao
			{
				limpa()
				escreva("\nUsuario Inválido!\n\n")

				Retorno_Negados()
				
			}
	}

	funcao Listar(inteiro Q)
	{
		cadeia caminho = "./Banco_de_Dados/Usuarios/"
		cadeia usuarios[999]
		a.listar_arquivos(caminho, usuarios)
							
		para (inteiro arq = 0; arq < Q; arq++)
		{
			cadeia listar = t.extrair_subtexto(usuarios[arq], 0, 6)

			cadeia C_listar = "./Banco_de_Dados/Usuarios/" + listar + ".txt"

			inteiro listar1 = a.abrir_arquivo(C_listar, 0)

			escreva(listar, "\t", a.ler_linha(listar1), "\n")
		
		}
	}

	funcao Cadastro()
	{
		cadeia Nn_Alunos, Nascimento, Periodo, Dia_Nas, Mes_Nas, Ano_Nas, Diretorio, Id_Alunos, cursoEscolhido = "0"
		inteiro Dados, Curso 
		
		faca
		{
			escreva("\nQual o nome do Aluno: ")
			escreva("\n\nPor favor, digite seu nome Completo!\n")
			escreva("EX: Maria Joana Soares Silva\n\n")
			leia(Nn_Alunos)
			Nn_Alunos = t.caixa_alta(Nn_Alunos)
			limpa()
		}
			enquanto (t.numero_caracteres(Nn_Alunos) < 15)

		faca
		{
			escreva("\nQuantos Anos tem ", Nn_Alunos," : ")
			escreva("\n\nDigite apenas a sua IDADE (em Numeros)!\n")
			escreva("EX: 18 , 51, 26...\n\n")
			leia(Id_Alunos)
			limpa()
		}
			enquanto (t.numero_caracteres(Id_Alunos) != 2)

		faca
		{
			escreva("Qual o Curso de ", Nn_Alunos," : ")
			escreva("\n\nEscolha um CURSO.\n")
			escreva("(0) Direito\n")
			escreva("(1) Engenharia Civil\n")
			escreva("(2) Engenharia Elétrica\n")
			escreva("(3) Odontologia\n")
			escreva("(4) Enfermagem\n")
			escreva("(5) Medicina\n")
			escreva("(6) Sistemas de Informaçao\n\n")
			leia(Curso)
			limpa()

			escolha(Curso)
			{
				caso 0:
				{
					cursoEscolhido = "DIREITO%%"
				pare
				}
				caso 1:
				{
					cursoEscolhido = "ENGENHARIA CIVIL"
				pare
				}
				caso 2:
				{
					cursoEscolhido = "ENGENHARIA ELÉTRICA"
				pare
				}
				caso 3:
				{
					cursoEscolhido = "ODONTOLOGIA"
				pare
				}
				caso 4:
				{
					cursoEscolhido = "ENFERMAGEM"
				pare
				}
				caso 5:
				{
					cursoEscolhido = "MEDICINA"
				pare
				}
				caso 6:
				{
					cursoEscolhido = "SISTEMAS DE INFORMAÇAO"
				pare
				}
			}
		}
			enquanto(cursoEscolhido == "0")
		
		faca
		{
			escreva("\nQual o Periodo que está ", Nn_Alunos," : ")
			escreva("\n\nDigite apneas o PERIODO (em Numeros)!\n")
			escreva("EX: 1 , 12, 7...\n\n")
			leia(Periodo)
			limpa()
		}
			enquanto (t.numero_caracteres(Periodo) != 2)
						 
				
			faca
			{
				escreva("\nQual o dia (DD) de nascimento de ", Nn_Alunos," : ")
				escreva("\n\nPor favor, digite no formato (DD)!\n")
				escreva("EX: 02 , 12, 31...\n\n")
				leia(Dia_Nas)
				limpa()
			}
				enquanto (t.numero_caracteres(Dia_Nas) != 2)
			faca
			{
				escreva("\nQual o mes (MM) de nascimento de ", Nn_Alunos," : ")
				escreva("\n\nPor favor, digite no formato (MM)\n")
				escreva("EX: 01 , 12, 07...\n\n")
				leia(Mes_Nas)
				limpa()
			}
				enquanto (t.numero_caracteres(Mes_Nas) != 2)

			faca
			{
				escreva("\nQual o ano (AAAA) de nascimento de ", Nn_Alunos," : ")
				escreva("\n\nPor favor, digite no formato (AAAA)\n")
				escreva("EX: 1997 , 2000, 1990...\n\n")
				leia(Ano_Nas)
				se(t.numero_caracteres(Ano_Nas) == 2)
				{
				Ano_Nas = "19" + Ano_Nas
				}
				limpa()
			}
				enquanto (t.numero_caracteres(Ano_Nas) != 4)

		cadeia Sexo
		cadeia Sexo1 = "0"
				
		faca
		{
			escreva("\nQual o sexo (M ou F) de ", Nn_Alunos," : ")
			leia(Sexo)
			Sexo = t.caixa_alta(Sexo)
			limpa()
			se (Sexo == "M")
			{
				Sexo1 = "MASCULINO"
			}
			senao se (Sexo == "F")
			{
				Sexo1 = "FEMININO"
			pare
			}
		}
			enquanto(Sexo1 == "0")

		Gerar_nUsuario(UsuarioG)

		//Escolher uma imagem para o aluno.
		cadeia tipos_de_arquivo[] = {"Selecione uma imagem nitida do USUARIO|png"}
		cadeia c = "./Banco_de_Dados/Usuarios/Fotos/" + UsuarioG + ".png"
				
		escreva("Selecione uma imagem nitida do USUARIO.")
		u.aguarde(4000)
		limpa()
		g.salvar_imagem(g.carregar_imagem(a.selecionar_arquivo(tipos_de_arquivo, falso)), c)

		//FIM_Imagem

		escreva("\nCadastro Concluido!.")
		u.aguarde(3000)
		limpa()
		
		Nascimento = (Dia_Nas + "/" + Mes_Nas + "/" + Ano_Nas)
				
		Dados = a.abrir_arquivo("./Banco_de_Dados/Usuarios/" + UsuarioG + ".txt", 2)
		
		a.escrever_linha(Nn_Alunos, Dados)
		a.escrever_linha(Id_Alunos, Dados)
		a.escrever_linha(Periodo, Dados)
		a.escrever_linha(Nascimento , Dados)
		a.escrever_linha(Sexo1 , Dados)
		a.escrever_linha(cursoEscolhido , Dados)
				
		escreva("------------------------")
		escreva("\n    Usuário: " + UsuarioG)
		escreva("\n------------------------")
		escreva("\n\n Por favor\n Anote seu codigo para poder checar o aluno futuramente.\n\n\n\n")
				
		a.fechar_arquivo(Dados)

		//Fim do Cadastro
	}

	funcao Checar()
	{
		cadeia Usuario

		logico Registrado
				
		faca
		{
			limpa()
			escreva("\nDigite o numero do Usuario: ")
			leia(Usuario)
			se(t.numero_caracteres(Usuario) != 6)
			{
				limpa()
				escreva("\nPor favor, verifique se o codigo informado está correto\n\n\n\n")
				u.aguarde(3000)
			}
		}
			enquanto(t.numero_caracteres(Usuario) != 6)

			para (inteiro Aguarde = 0; Aguarde < 3; Aguarde++)
			{
				limpa()
				escreva("\nChecando se o Aluno está Cadastrado!")
				u.aguarde(1000)
			}
				limpa()
				Registrado = a.arquivo_existe("./Banco_de_Dados/Usuarios/" + Usuario + ".txt")
				se (Registrado == verdadeiro)
				{
					cadeia Caminho_Checar, Linha[6]
				
			     	Caminho_Checar = "./Banco_de_Dados/Usuarios/" + Usuario + ".txt"
							
					inteiro Checamento
							
					Checamento = a.abrir_arquivo(Caminho_Checar, 0)
			
					Linha[0] = a.ler_linha(Checamento)
					Linha[1] = a.ler_linha(Checamento) + " ANOS"
					Linha[3] = a.ler_linha(Checamento) + " PERÍODO"
					Linha[2] = a.ler_linha(Checamento)
					Linha[4] = a.ler_linha(Checamento)
					Linha[5] = a.ler_linha(Checamento)
			
					a.fechar_arquivo(Checamento)
					
					inteiro imagem = g.carregar_imagem("./Imagens/umbrella.png")
					inteiro Imagem_Fundo = g.carregar_imagem("./Imagens/FUNDO_OFICIAL.png")
					inteiro fOriginal = g.carregar_imagem("./Banco_de_Dados/Usuarios/Fotos/" + Usuario + ".png")

					g.iniciar_modo_grafico(verdadeiro)
					g.definir_dimensoes_janela(720, 450)
					g.definir_icone_janela(imagem)
					g.definir_titulo_janela("Checando Aluno: " + Usuario)
					
					AbrirFichaUser(Usuario, imagem, Imagem_Fundo, fOriginal, Linha[0], Linha[1], Linha[2], Linha[3], Linha[4], Linha[5])
					
					enquanto(nao te.tecla_pressionada(te.TECLA_ESC))
					{
						se(m.botao_pressionado(m.BOTAO_ESQUERDO))
						{
							se((m.posicao_x() >= 448 e m.posicao_y() >= 133)  e (m.posicao_x() <= 639 e m.posicao_y() <= 324))
							{
								AbrirFoto(fOriginal, Usuario)
							}
						}
					}
				}
				senao
				{
					escreva("\n\nAluno nao está em nosso Bando de Dados! Cadastre-o\n\n")
				}
	}

	funcao AbrirFoto(inteiro fOriginal, cadeia Usuario)
	{
		larguraImg = g.largura_imagem(fOriginal)
		alturaImg = g.altura_imagem(fOriginal)
		
		se(larguraImg >= TamanhoTelaPC)
		{
			larguraImg = 1300
		}
		
		se(alturaImg >= AlturaTelaPC)
		{
			alturaImg = 700
		}
		
		g.definir_dimensoes_janela(larguraImg, alturaImg)
		g.definir_titulo_janela("Foto do aluno: " + Usuario)
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0, 0, fOriginal)
		g.renderizar()
	}

	funcao AbrirFichaUser(cadeia Usuario, inteiro imagem, inteiro Imagem_Fundo, inteiro fOriginal, cadeia lNome, cadeia lIdade, cadeia lDataNas, cadeia lPeriodo, cadeia lSexo, cadeia lCurso)
	{
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0, 0, Imagem_Fundo)
		inteiro FOTO = g.redimensionar_imagem(fOriginal, 191, 191, falso)
		g.desenhar_imagem(448, 133, FOTO)
					
		g.definir_tamanho_texto(14.0)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.desenhar_texto(55, 76, lNome)
		g.desenhar_texto(55, 133, lIdade)
		g.desenhar_texto(175, 133, lDataNas)
		g.desenhar_texto(55, 190, lPeriodo)
		g.desenhar_texto(200, 190, lCurso)
		g.desenhar_texto(55, 240, lSexo)
					
		g.definir_tamanho_texto(18.0)
		g.definir_cor(g.COR_VERMELHO)
		g.definir_estilo_texto(falso, falso, verdadeiro)
		g.desenhar_texto(485, 68, Usuario)

		g.renderizar()
		
	}

	funcao inteiro Gerar_nUsuario(inteiro Numero_Usuario)
	{
	//Essa parte gera o numero do usuario para aplica-lo no nome do arquivo
	Numero_Usuario = u.sorteia(100000, 999999)
	
		UsuarioG = Numero_Usuario

	//Caso o numero gerado ja exista, será gerado outro.

	logico Gerar_Existente = a.arquivo_existe("./Banco_de_Dados/Usuarios/" + Numero_Usuario + ".txt")
				
		enquanto (Gerar_Existente == verdadeiro)
		{
			inteiro Gerar_Outro = u.sorteia(100000, 999999)

			Numero_Usuario = Gerar_Outro
			UsuarioG = Numero_Usuario
		}
	retorne Numero_Usuario
	}
	
	funcao inicio()
	{
		inteiro Escolha, Ler_Arquivo
		inteiro RepetirT = 0

		faca
		{
			escreva("\nEscolha uma Opçoes:\n\n")
			escreva("(1) Cadastrar um Aluno \n")
			escreva("(2) Checar Aluno \n\n")
			escreva("(9) Acessar MODO Administrador\n\n")
			leia(Escolha)
			limpa()
			
			escolha (Escolha)
		{
			caso 1:
			{
				Cadastro()
				RepetirT = 1
			pare
			}

			caso 2:
			{
				Checar()
				RepetirT = 1
			pare
			}

			caso 9:
			{
				cadeia LoginPrincipal, SenhaPrincipal
				
				ConfirmarADMIN(Confirm)

				se (Confirm == 1)
				{
					inteiro EscolhaADM
							
				limpa()
				escreva("\nOla, " , UserG, ". Escolha oque deseja fazer\n\n")
				escreva("(1) Corrigir erros dos arquivos \n(2) Mostrar todos Alunos Cadrastrados \n(3) Apagar Dados \n\n")
				escreva("(9) Trocar Usuario ou Senha\n\n")
				leia(EscolhaADM)
				limpa()
							
						escolha(EscolhaADM)
							{
								caso 1: 
								{
									cadeia UsuarioADM

									logico RegistradoADM

									inteiro EscolhaADM1
									
									escreva("\n\nDigite o Codigo do Aluno que deseja Corrigir erros. ")
									leia(UsuarioADM)

									se (t.numero_caracteres(UsuarioADM) != 6)
									{
										limpa()
										escreva("\nPor favor, verifique se o codigo informado está correto\n\n\n\n")
					
										pare
									}
					
										para (inteiro Aguarde = 0; Aguarde <= 3; Aguarde++)
										{
											limpa()
											escreva("\nChecando se o Aluno está Cadastrado!")
											u.aguarde(1000)
										}
					
										limpa()
										
									//-------------------------------------------------------
									
									RegistradoADM = a.arquivo_existe("./Banco_de_Dados/Usuarios/" + UsuarioADM + ".txt")
									se (RegistradoADM == verdadeiro)
									{
										cadeia Caminho_ChecarADM, LinhaADM[5]
							
						                    Caminho_ChecarADM = "./Banco_de_Dados/Usuarios/" + UsuarioADM + ".txt"
										
										inteiro ChecamentoADM
										
										ChecamentoADM = a.abrir_arquivo(Caminho_ChecarADM, a.MODO_LEITURA)
						
										LinhaADM[0] = a.ler_linha(ChecamentoADM)
										LinhaADM[1] = a.ler_linha(ChecamentoADM)
										LinhaADM[2] = a.ler_linha(ChecamentoADM)
										LinhaADM[3] = a.ler_linha(ChecamentoADM)
										LinhaADM[4] = a.ler_linha(ChecamentoADM)
						
										a.fechar_arquivo(ChecamentoADM)
						
										escreva("Dados do Usuario: ", UsuarioADM, "\n\n")
										escreva("Nome:         ", LinhaADM[0],"\n")
										escreva("Idade:        ", LinhaADM[1]," Anos", "\n")
										escreva("Periodo:      ", LinhaADM[2]," Periodo", "\n")
										escreva("Nascimento:   ", LinhaADM[3],"\n")
										escreva("Sexo:         ", LinhaADM[4],"\n")

										//Apos achar o erro desse usuario, devera digitar uma tecla para continuar

										caracter Digitado

										escreva("\nDigite (0) para Continuar, e corrigir os erros. ")
										leia(Digitado)
											se (Digitado != '0')
											{
												limpa()
												escreva("\nVoce deve digitar o numero correto, para identificarmos que voce está\nPronto para continuar.\n\n")
											pare
											}	
									
									// Agora vem a parte de editar os dados desse aluno selecionado.

									limpa()
									escreva("Escolha uma opçao que deseja alterar: \n\n")
									escreva("(1) Nome\n")
									escreva("(2) Idade\n")
									escreva("(3) Periodo\n")
									escreva("(4) Data Nascimento\n")
									escreva("(5) Sexo\n")
									escreva("(6) Fotografia\n\n")
									leia(EscolhaADM1)
									limpa()
									
									escolha (EscolhaADM1)
									{
										caso 1: 
										{
											escreva("Nome Antigo: ", LinhaADM[0])

											cadeia NomeNovo, Pesquisa
											inteiro Caminho_Subs_Nome
											
											escreva("\n\nDigite qual paravra/texto voce quer mudar: ")
											leia(Pesquisa)
											Pesquisa = t.caixa_alta(Pesquisa)

											escreva("\nEscreva a nova palavra/Nome: ")
											leia(NomeNovo)
											NomeNovo = t.caixa_alta(NomeNovo)

											a.substituir_texto(Caminho_ChecarADM, Pesquisa, NomeNovo, verdadeiro)
											
													escreva("\n\nAguarde...")
													u.aguarde(3000)
													limpa()
													
													escreva("\n\nConcluido!\n\n\n")
										pare
										}

										caso 2:
										{
											escreva("Idade Antiga: ", LinhaADM[1], " Anos")

											cadeia IdadeNova

											escreva("\n\nInforme a nova Idade: ")
											leia(IdadeNova)

											a.substituir_texto(Caminho_ChecarADM, LinhaADM[1], IdadeNova, verdadeiro)
											
													escreva("\n\nAguarde...")
													u.aguarde(3000)
													limpa()
													
													escreva("\n\nConcluido!\n\n\n")
										pare
										}

										caso 3:
										{
											escreva("Periodo Antigo: ", LinhaADM[2], " Periodo")

											cadeia PeriodoNovo

											escreva("\n\nInforme o novo Periodo: ")
											leia(PeriodoNovo)

											a.substituir_texto(Caminho_ChecarADM, LinhaADM[2], PeriodoNovo, verdadeiro)
											
													escreva("\n\nAguarde...")
													u.aguarde(3000)
													limpa()
													
													escreva("\n\nConcluido!\n\n\n")
										pare
										}

										caso 4:
										{
											escreva("Data de Nascimento Antiga: ", LinhaADM[3])

											cadeia NascimentoNovo, Dia_NasNovo, Mes_NasNovo, Ano_NasNovo

											escreva("\n\n", "Qual o dia (DD) de nascimento: ")
											leia(Dia_NasNovo)
												 se (t.numero_caracteres(Dia_NasNovo) != 2)
												 {
												 	escreva("\n\nDia Informado está Incorreto! Por favor, digite no formato (DD)!\n")
												 	escreva("EX: 02 , 12, 31...\n\n")
								
												 	pare
												 }
											
											escreva("\n\n", "Qual o mes (MM) de nascimento: ")
											leia(Mes_NasNovo)
												 se (t.numero_caracteres(Mes_NasNovo) != 2)
												 {
												 	escreva("\n\nMes Informado está Incorreto! Por favor, digite no formato (MM)\n")
												 	escreva("EX: 01 , 12, 07...\n\n")
								
												 	pare
												 }
											
											escreva("\n\n", "Qual o ano (AAAA) de nascimento: ")
											leia(Ano_NasNovo)
												 se (t.numero_caracteres(Ano_NasNovo) != 4)
												 {
												 	escreva("\n\nAno Informado está Incorreto! Por favor, digite no formato (AAAA)\n")
												 	escreva("EX: 1997 , 2000, 1990...\n\n")
								
												 	pare
												 }

											NascimentoNovo = Dia_NasNovo + "/" + Mes_NasNovo + "/" + Ano_NasNovo

											a.substituir_texto(Caminho_ChecarADM, LinhaADM[3], NascimentoNovo, verdadeiro)
											
													escreva("\n\nAguarde...")
													u.aguarde(3000)
													limpa()
													
													escreva("\n\nConcluido!\n\n\n")
										pare
										}

										caso 5:
										{
											escreva("Sexo Antigo: ", LinhaADM[4])
											
											cadeia SexoNovo
											cadeia SexoNovo1
											
											escreva("\n\nQual o sexo (M ou F): ")
											leia(SexoNovo)
											SexoNovo = t.caixa_alta(SexoNovo)
											limpa()
												se (SexoNovo == "M")
												{
													SexoNovo1 = "MASCULINO"
												}
												senao se (SexoNovo == "F")
												{
													SexoNovo1 = "FEMININO"
												}
												senao
												{
													escreva("\n\nSexo Inválido. Confirme se digitou corretamento (M) ou (F)\n\n")
													pare
												}

												a.substituir_texto(Caminho_ChecarADM, LinhaADM[4], SexoNovo1, verdadeiro)
											
													escreva("\n\nAguarde...")
													u.aguarde(3000)
													limpa()

													escreva("\n\nConcluido!\n\n\n")
										pare
										}

										caso 6:
										{
											escreva("Escolha um nova foto no seu computador.")
											u.aguarde(3000)
											limpa()

											cadeia UsuarioC = ("./Banco_de_Dados/Usuarios/Fotos/" + UsuarioADM + ".png")
											
											//Escolher uma nova imagem para o aluno.
											cadeia tipos_de_arquivo[] = {"Selecione uma imagem nitida do USUARIO|png"}

											cadeia nFOTO = a.selecionar_arquivo(tipos_de_arquivo, falso)
											se (a.arquivo_existe(nFOTO) == verdadeiro)
											{
												a.apagar_arquivo(UsuarioC)
												g.salvar_imagem(g.carregar_imagem(nFOTO), UsuarioC)
												
												escreva("Concluido!")
												u.aguarde(3000)
												limpa()
											pare
											}
											
											escreva("CANCELADO!")
											u.aguarde(3000)
											limpa()
										pare
										}
										
										caso contrario: 
										{
											limpa()
											escreva("\n\nEscolha uma opçao Válida!\n\n")
										pare
										}
										
									}
									
									pare
									}

									senao 
									{
										limpa()
										escreva("\n\nEste aluno nao está no nosso Banco de Dados\n\n")
									pare
									}
								}
								
								caso 2: 
								{
									inteiro Q_cadastrados
									escreva("\n Informe a quantidade de usuarios que quer mostrar: ")
									leia(Q_cadastrados)
									limpa()
									Listar(Q_cadastrados)
									RepetirT = 1
								pare
								}
								
								caso 3: 
								{
									cadeia SimNAO, UsuarioADMIN, SenhaADMIN
									escreva("\nConfirme seu Usuario e Senha.\n\n")
									
									escreva("Usuario: ")
									leia(UsuarioADMIN)
									escreva("\nSenha: ")
									leia (SenhaADMIN)
									
									ConfirmarADMIN(Confirm)
									
									limpa()	
									escreva("\n\nTome Cuidado Com oque voce irá apagar!\n\n")
									u.aguarde(3000)
									limpa()

									inteiro EscolhaApagar
									
									cadeia UsuarioADM_Checar

									logico ChecarSeExiste

									escreva("Escolha oque deseja remover\n\n")
									escreva("(1) Apenas um Usuario\n")
									escreva("(2) Todos os Usuarios(INCOMPLETO)	\n\n")
									escreva("(3) Dados de Acessos Permitidos(INCOMPLETO)\n")
									escreva("(4) Dados de Acessos Negados(INCOMPLETO)\n")
									escreva("(5) Todos os Dados de Acessos(INCOMPLETO)\n\n")
									escreva("(9) APAGAR TUDO (INCOMPLETO)\n")
									leia(EscolhaApagar)

									escolha (EscolhaApagar)
									{
										caso 1: 
										{	
											limpa()
											escreva("\nDigite o Numero do usuario a qual quer remover: ")
											leia(UsuarioADM_Checar)

											se (t.numero_caracteres(UsuarioADM_Checar) != 6)
											{
												limpa()
												escreva("\nPor favor, verifique se o codigo informado está correto\n\n\n\n")
							
												pare
											}
							
												para (inteiro Aguarde = 0; Aguarde <= 3; Aguarde++)
												{
													limpa()
													escreva("\nChecando se o Aluno está Cadastrado!")
													u.aguarde(1000)
												}
							
												limpa()
											
											cadeia CaminhoADM = "./Banco_de_Dados/Usuarios/" + UsuarioADM_Checar + ".txt"
											cadeia CaminhoFOTO_ADM = "./Banco_de_Dados/Usuarios/Fotos/" + UsuarioADM_Checar + ".png"

											ChecarSeExiste = a.arquivo_existe(CaminhoADM)

											caracter SimOuNao

											inteiro Repetir = 0

											se (ChecarSeExiste == verdadeiro)
											{
												faca
												{
													limpa()
													escreva("Voce tem certeza que deseja excluir o usuario: ", UsuarioADM_Checar, " do nosso Banco de Dados?")
													escreva("\n\nDigite (S) para Sim e (N) para Nao: ")
													leia (SimOuNao)

												se (SimOuNao == 'S' ou SimOuNao == 's')
												{
													limpa()
													a.apagar_arquivo(CaminhoADM)
													a.apagar_arquivo(CaminhoFOTO_ADM)

													Repetir = 1

													escreva("\n\nApagando Usuario...\n\n\n")

													u.aguarde(3000)

													limpa()
													escreva("\nUsuario: ", UsuarioADM_Checar, " Removido com Sucesso!\n\n\n")
												pare
												}

													senao se (SimOuNao == 'N' ou SimOuNao == 'n')
													{
														limpa()
														escreva("\n\nOperaçao Cancelada\n\n\n") 
														Repetir = 2
													pare
													}
												}
												enquanto(Repetir == 0)
											}

												senao
												{
													limpa()
													escreva("\nO codigo ", UsuarioADM_Checar, ". Nao costa no nosso Banco de Dados\n\n\n")
												}
										pare
										}

										caso 2:
										{
											inteiro SIMNAO1 = 0
											faca
											{
												limpa()
												escreva("\nVoce tem certeza que deseja apagar TODOS os usuarios? (SIM / NAO): ")
												leia(SimNAO)
												se (SimNAO == "SIM")
												{
													limpa()
													SIMNAO1 = 1
													se (Confirm == 1)
													{
														limpa()
														a.apagar_arquivo("/Banco_de_Dados/Usuarios/")
													pare
													}
												}
												senao se(SimNAO == "NAO")
												{
													limpa()
													escreva("\nOperação Cancelada\n\n")
													SIMNAO1 = 1
												pare
												}
											}
											enquanto(SIMNAO1 == 0)
										pare
										}

										caso 3: 
										{
											
										}
									}
								pare
								}

								caso 9:
								{
									inteiro EscolhaADM_Contas_Opcoes
									
									escreva("Escolha oque deseja Alterar.")
									escreva("\n\n(1) Nome")
									escreva("\n(2) Usuario")
									escreva("\n(3) Senha")
									escreva("\n\n(0) Sair, e cancelar.\n")
									leia(EscolhaADM_Contas_Opcoes)

									escolha (EscolhaADM_Contas_Opcoes)
									{
										caso 1:
										{
												cadeia CaminhoLoginADM1 = "./Banco_de_Dados/Admin/Contas/" + LoginG + ".txt"

												limpa()
												cadeia NomeNEW
												escreva("\nDigite o novo Nome: ")
												leia(NomeNEW)
												limpa()

												a.substituir_texto(CaminhoLoginADM1, UserG, NomeNEW, verdadeiro)

												escreva("\n\n\t\tProcessando...\n\n\n\n")

											 	u.aguarde(3000)
											 	
												limpa()
											 	escreva("\n\nConcluído!\n\n\n")
											
										pare
										}
											
										caso 2: 
										{
											cadeia CaminhoLoginADM2 = "./Banco_de_Dados/Admin/Contas/" + LoginG + ".txt"
											
											inteiro testeU = 0
											
												faca
												{
												limpa()
												cadeia UsuarioNEW
												escreva("\nDigite o novo Usuario: ")
												leia(UsuarioNEW)
												limpa()
												
												cadeia caminhoN = "./Banco_de_Dados/Admin/Contas/" + UsuarioNEW + ".txt"
												logico ch = a.arquivo_existe(caminhoN)
												
													se(ch == falso)
													{
													
														inteiro Us_novoC = a.abrir_arquivo(caminhoN , 1)
													
														a.escrever_linha(UserG, Us_novoC)
														a.escrever_linha(SenhaG, Us_novoC)

														a.fechar_arquivo(Us_novoC)
	
														escreva("\n\n\t\tProcessando...\n\n\n\n")
														a.apagar_arquivo(CaminhoLoginADM2)
	
												 		u.aguarde(3000)
												 	
														limpa()
												 		escreva("\n\nConcluído!\n\n\n")
												 		testeU = 1
												 	pare
													}
												}
												enquanto(testeU == 0)
										pare
										}

										caso 3: 
										{
											cadeia CaminhoSenhaNEW = "./Banco_de_Dados/Admin/Contas/" + LoginG + ".txt"

												limpa()
												cadeia SenhaNEW
												escreva("\nDigite a nova senha: ")
												leia(SenhaNEW)
												limpa()

												a.substituir_texto(CaminhoSenhaNEW, SenhaG, SenhaNEW, verdadeiro)

												escreva("\n\n\t\tProcessando...\n\n\n\n")

											 	u.aguarde(3000)
											 	
												limpa()
											 	escreva("\n\nConcluído!\n\n\n")
										pare
										}

										caso 0: 
										{
											limpa()
											escreva("\nCancelado!.\n\n")
										pare
										}

										caso contrario:
										{
											escreva("\n\nVoce deve escolher uma das opçoes!\n\n")
										}
									}
								pare
								}
		
								caso contrario:
								{
									escreva("\n\nVoce deve escolher uma das opçoes!\n\n")
								}
							}
				pare
				}
				
				RepetirT = 1
			pare
			}
			caso contrario:
			{
				escreva("\n\nVoce deve escolher uma das opçoes!\n\n")
				u.aguarde(3000)
				
				RepetirT = 0
			}
		}
		}
		enquanto(RepetirT == 0)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 110; 
 * @DOBRAMENTO-CODIGO = [36, 82, 143, 167, 178, 254, 263, 273, 290, 162, 352, 366, 346, 421, 444, 471, 603, 625, 650, 669, 688, 736, 541, 820];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */