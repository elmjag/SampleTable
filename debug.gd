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


func _calc_rx():
    var dist = 0.350
    var yd_len = _yd.scale.z

    var yi_len = _yi.scale.z
    var yo_len = _yo.scale.z

    var diff = ((yi_len + yo_len) / 2) - yd_len

    var angle = rad2deg(atan2(diff, dist))

    return angle


func _calc_ry():
    var dist = 0.750
    var zi_len = _zi.scale.z
    var zo_len = _zo.scale.z
    var diff = zi_len - zo_len

    var angle = rad2deg(atan2(diff, dist))

    return angle


func _calc_rz():
    var dist = 0.750
    var yi_len = _yi.scale.z
    var yo_len = _yo.scale.z
    var diff = yo_len - yi_len

    var angle = rad2deg(atan2(diff, dist))

    return angle


func _calc_x():
    var x_len = _x.scale.z
    return x_len - 0.45


func _calc_y():
    var yd_len = _yd.scale.z

    var yi_len = _yi.scale.z
    var yo_len = _yo.scale.z

    return ((((yi_len + yo_len)/2) + yd_len)/2) - 0.45


func _calc_z():
    var zi_len = _zi.scale.z
    var zo_len = _zo.scale.z

    return ((zi_len + zo_len) / 2) - 0.45


func _process(delta):
    text = "rx: %s\nry: %s\nrz: %s\nx: %s\ny: %s\nz: %s" % \
         [_calc_rx(), _calc_ry(), _calc_rz(), _calc_x(), _calc_y(), _calc_z()]


