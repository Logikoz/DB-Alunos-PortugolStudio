programa
{
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u

	inteiro ultimo_x = 0
	inteiro ultimo_y = 0
	inteiro LARGURA_DO_BOTAO = 0
	inteiro ALTURA_DO_BOTAO = 0
	logico clicou
	
	
	funcao inicio()
	{
		faca
		{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(400, 300)
		g.definir_cor(g.COR_BRANCO)
		g.limpar()


		g.definir_tamanho_texto(20.0)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.desenhar_texto(10, 10, "X")

		g.renderizar()
		}
		enquanto(nao m.algum_botao_pressionado())
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) == verdadeiro)
			{
				g.iniciar_modo_grafico(verdadeiro)
				g.definir_dimensoes_janela(400, 300)
				g.definir_cor(g.COR_BRANCO)
				g.limpar()
		
		
				g.definir_tamanho_texto(20.0)
				g.definir_cor(g.COR_PRETO)
				g.definir_estilo_texto(falso, verdadeiro, falso)
				g.desenhar_texto(10, 10, "teteeeeee")
		
				g.renderizar()
				u.aguarde(100000000)
			}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 968; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */