extends CanvasLayer

@onready var timer_label: Label = $MarginContainer/TimerLabel
@onready var time_starter_label: Label = $MarginContainer2/TimeStarter
@onready var start_timer := $StartTimer


var time := 0.0
var timeStarter := 3
var started := false

func _ready() -> void:
	time_starter_label.text = str(timeStarter)
	start_timer.wait_time = 1.0  # 1 second per tick
	start_timer.start()

func _process(delta: float) -> void:
	if started:
		time += delta
		update_label()

func update_label() -> void:
	var minutes := int(time) / 60
	var seconds := int(time) % 60
	var milliseconds := int((time - int(time)) * 100)  # two digits for centiseconds

	# Format with leading zeros
	timer_label.text = str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2) + ":" + str(milliseconds).pad_zeros(2)

func _on_start_timer_timeout() -> void:
	if timeStarter > 1:
		timeStarter -= 1
		time_starter_label.text = str(timeStarter)
	elif timeStarter == 1:
		timeStarter = 0
		time_starter_label.text = "GO!"
		started = true
		start_timer.stop()
		$GoTimer.start()

func _on_go_timer_timeout() -> void:
	time_starter_label.text = ""
