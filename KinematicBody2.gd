extends KinematicBody

var speed = 5
var target
var velocity = Vector3()

func _ready():
 target = get_node("/root/Spatial/KinematicBody") # Получаем узел главного героя

func _process(delta):
 if target:
  var direction = (target.global_transform.origin - global_transform.origin).normalized() # Вычисляем направление к герою
  velocity = direction * speed
  global_transform.origin += velocity * delta
