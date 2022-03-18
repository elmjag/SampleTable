extends MeshInstance


var table_pos
var base_pos


func _update_posture():
    var table_orig = table_pos.global_transform.origin
    var base_orig = base_pos.global_transform.origin
    var vect = table_orig - base_orig

    var pos = base_orig + (vect * 0.5)

    if vect.cross(Vector3.UP).is_equal_approx(Vector3.ZERO):
        # handle special case of when the motor is parallel to
        # the 'UP' vector
        translation = pos
        rotation = Vector3(PI/2, 0, 0)

    else:
        look_at_from_position(pos, table_orig, Vector3.UP)

    scale.z = vect.length()


func _ready():
    table_pos = get_node("/root/main/tableOrigo/%sM" % name)
    base_pos = get_node("/root/main/base/%sF" % name)
    _update_posture()
    show()


func _process(_delta):
    _update_posture()
