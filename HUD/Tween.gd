extends ColorRect

var c = 0
var colors = [
	Color8(255, 0, 0)	
	,Color8(240, 0, 0)
	,Color8(220, 0, 0)	
	,Color8(200, 0, 0)	
	,Color8(180, 0, 0)		
	,Color8(160, 0, 0)	
	,Color8(140, 0, 0)	
	,Color8(120, 0, 0)
	,Color8(140, 0, 0)
	,Color8(160, 0, 0)	
	,Color8(180, 0, 0)
	,Color8(200, 0, 0)
	,Color8(220, 0, 0)
	,Color8(240, 0, 0)
	,Color8(255, 0, 0)	   
]

func _ready():
	update_color()
	
func update_color():
	$Tween.interpolate_property(self, "color", color, colors[c], $Timer.wait_time-0.01, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Timer_timeout():
	c += 1
	c %= colors.size()
	update_color()
