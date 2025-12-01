extends Node

func _ready():
	TimeManager.semana_finalizada.connect(_on_semana_finalizada)

func _on_semana_finalizada():
	EconomyManager.fim_da_semana()
	IndicatorManager.aplicar_impactos()
	checar_fim_de_jogo()

func checar_fim_de_jogo():
	if IndicatorManager.satisfacao <= 0:
		print("Derrota!")
	elif IndicatorManager.satisfacao >= 80:
		print("Vitória!")
