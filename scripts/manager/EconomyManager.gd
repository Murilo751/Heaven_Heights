extends Node

var dinheiro := 500000.0
var receita := 0.0

func calcular_receita():
	receita = IndicatorManager.satisfacao * 5000
	print("Receita calculada:", receita)

func fim_da_semana():
	calcular_receita()
	dinheiro += receita
	print("Dinheiro atual:", dinheiro)
