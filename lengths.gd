extends Label

var _x
var _yd
var _yi
var _yo
var _zi
var _zo

func _ready():
    _x = get_node("/root/main/motors/X")
    _yd = get_node("/root/main/motors/YD")
    _yi = get_node("/root/main/motors/YI")
    _yo = get_node("/root/main/motors/YO")
    _zi = get_node("/root/main/motors/ZI")
    _zo = get_node("/root/main/motors/ZO")


func _process(delta):
    text = "X: %s\nYD: %s\nYI: %s\nYO: %s\nZI: %s\nZO: %s" % \
         [_x.scale.z, _yd.scale.z, _yi.scale.z,  _yo.scale.z, _zi.scale.z, _zo.scale.z ]
