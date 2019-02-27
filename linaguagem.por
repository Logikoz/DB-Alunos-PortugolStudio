programa
{
	inclua biblioteca Texto
	inclua biblioteca Arquivos --> a
	
	funcao inicio()
	{
		escreva("(0) Pt-Br Brasil\n")
		escreva("(1) en-us United State\n")
		escreva("(2) es-ar Argentina\n")
		escreva("(3) gr-al Germany\n\n")
		inteiro pais
		leia(pais)
		limpa()

		cadeia teste = "0"
		inteiro ar = a.abrir_arquivo("./Linguagem/pt_br.txt", 0)
		cadeia var = a.ler_linha(ar)
		cadeia Menu_Inicio = "Menu_Inicio = \'"
		inteiro test = Texto.posicao_texto(Menu_Inicio, var, 0)
		escreva(test)
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 497; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */