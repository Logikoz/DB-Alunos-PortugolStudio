programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	inclua biblioteca Arquivos --> a
	inclua biblioteca Texto --> t

	
	inteiro ultimo_x = -1, ultimo_y = -1
	
	const inteiro LARGURA_DO_BOTAO = 28, ALTURA_DO_BOTAO = 28
	
	logico clicou = falso
	
	funcao inicio()
	{
		cadeia Usuario

		logico Registrado
				
		escreva("\nDigite o numero do Usuario: ")
		leia(Usuario)
		se (t.numero_caracteres(Usuario) != 6)
		{
			limpa()
			escreva("\nPor favor, verifique se o codigo informado está correto\n\n\n\n")
		
		}

			para (inteiro Aguarde = 0; Aguarde <= 3; Aguarde++)
			{
				limpa()
				escreva("\nChecando se o Aluno está Cadastrado!")
				u.aguarde(1)
			}
				limpa()
				Registrado = a.arquivo_existe("./Banco_de_Dados/Usuarios/" + Usuario + ".txt")
				se (Registrado == verdadeiro)
				{
					cadeia Caminho_Checar, Linha[5]
				
			     	Caminho_Checar = "./Banco_de_Dados/Usuarios/" + Usuario + ".txt"
							
					inteiro Checamento
							
					Checamento = a.abrir_arquivo(Caminho_Checar, 0)
			
					Linha[0] = a.ler_linha(Checamento)
					Linha[1] = a.ler_linha(Checamento) + " ANOS"
					Linha[2] = a.ler_linha(Checamento) + " PERIODO"
					Linha[3] = a.ler_linha(Checamento)
					Linha[4] = a.ler_linha(Checamento)
			
					a.fechar_arquivo(Checamento)

					limpa()
					inteiro imagem = g.carregar_imagem("./Imagens/umbrella.png")
					inteiro Imagem_Fundo = g.carregar_imagem("./Imagens/FUNDO_OFICIAL.png")
					inteiro FOTO = g.carregar_imagem("./Banco_de_Dados/Usuarios/Fotos/" + Usuario + ".png")
					g.iniciar_modo_grafico(verdadeiro)
					g.definir_dimensoes_janela(720, 450)
					g.definir_icone_janela(imagem)
					g.definir_titulo_janela("Visualizar Usuarios: " + Usuario)

					g.definir_cor(g.COR_BRANCO)
					g.limpar()
					g.desenhar_imagem(0, 0, Imagem_Fundo)
					FOTO = g.redimensionar_imagem(FOTO, 191, 191, verdadeiro)
					g.desenhar_imagem(448, 133, FOTO)
			
					
					g.definir_tamanho_texto(12.0)
					g.definir_cor(g.COR_PRETO)
					g.definir_estilo_texto(falso, verdadeiro, falso)
					g.desenhar_texto(55, 76, Linha[0])
					g.desenhar_texto(55, 133, Linha[1])
					g.desenhar_texto(55, 190, Linha[2])
					g.desenhar_texto(55, 250, Linha[3])
					g.desenhar_texto(55, 310, Linha[4])
					
					g.definir_tamanho_texto(16.0)
					g.definir_cor(g.COR_VERMELHO)
					g.desenhar_texto(485, 68, Usuario)
					
					g.renderizar()
					u.aguarde(100000)	
				}
		senao
		{
			escreva("\n\nAluno nao está em nosso Bando de Dados! Cadastre-o\n\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 285; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */