extends Node

# 24 minutos reais = 24 horas no jogo
# 1 minuto real = 60 segundos = 1 hora no jogo
# 1 segundo real = 1/60 de hora ≈ 0.01666 horas no jogo
signal dia_finalizado
signal semana_finalizada

const GAME_HOURS_PER_REAL_SECOND := 1.0 / 60.0

var game_hour: float = 0.0    # 0–24
var game_day: int = 1         # 1–7

func _process(delta: float) -> void:
	# Aumenta o tempo do jogo
	game_hour += GAME_HOURS_PER_REAL_SECOND * delta 

	# Passou das 24 horas? novo dia
	if game_hour >= 24.0:
		game_hour -= 24.0
		game_day += 1
		print("Novo dia:", game_day)
		dia_finalizado.emit()

		# Passou dos 7 dias? reinicia semana
		if game_day > 7:
			game_day = 1
			print("Semana finalizada!")
			semana_finalizada.emit()
	# (Opcional) Debug no console
	# print_time_debug()


func print_time_debug():
	print("Hora: ", get_formatted_hour(), " | Dia: ", game_day)


# Retorna hora formatada tipo "08:32"
func get_formatted_hour() -> String:
	var hour = int(game_hour)
	var minute = int((game_hour - hour) * 60)
	return "%02d:%02d" % [hour, minute]
