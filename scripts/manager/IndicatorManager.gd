extends Node

var saude := 40
var educacao := 30
var infraestrutura := 25
var satisfacao := 35

func aplicar_impactos():
	if saude < 20:
		satisfacao -= 5
