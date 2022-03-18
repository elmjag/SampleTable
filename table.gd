extends MeshInstance


enum {
    NONE,
    PITCH_UP,
    PITCH_DOWN,
    YAW_UP,
    YAW_DOWN,
    ROLL_UP,
    ROLL_DOWN,
    TRANSLATE_X_UP,
    TRANSLATE_X_DOWN,
    TRANSLATE_Y_UP,
    TRANSLATE_Y_DOWN,
    TRANSLATE_Z_UP,
    TRANSLATE_Z_DOWN,
}

enum { ROTATE, TRANSLATE }

var _action = NONE
var _mode = ROTATE

const SPEED = 0.015

func _input(event):
    if not event is InputEventKey:
        return

    if event.scancode == KEY_ESCAPE:
        transform = Transform.IDENTITY
        return

    if event.scancode == KEY_SHIFT:
        if event.pressed:
            _mode = TRANSLATE
        else:
            _mode = ROTATE

        return

    if not event.pressed:
        _action = NONE
        return


    if _mode == ROTATE:
        match event.scancode:
            KEY_A:
                _action = PITCH_DOWN
            KEY_D:
                _action = PITCH_UP
            KEY_W:
                _action = ROLL_DOWN
            KEY_S:
                _action = ROLL_UP
            KEY_Q:
                _action = YAW_UP
            KEY_E:
                _action = YAW_DOWN
    else:
        match event.scancode:
            KEY_A:
                _action = TRANSLATE_Z_UP
            KEY_D:
                _action = TRANSLATE_Z_DOWN
            KEY_W:
                _action = TRANSLATE_X_DOWN
            KEY_S:
                _action = TRANSLATE_X_UP
            KEY_Q:
                _action = TRANSLATE_Y_UP
            KEY_E:
                _action = TRANSLATE_Y_DOWN


func _process(time_delta):
    var spatial_delta = SPEED * time_delta

    match _action:
        PITCH_DOWN:
            rotate_object_local(Vector3(1, 0, 0), -spatial_delta)
        PITCH_UP:
            rotate_object_local(Vector3(1, 0, 0), spatial_delta)
        ROLL_DOWN:
            rotate_object_local(Vector3(0, 0, 1), -spatial_delta)
        ROLL_UP:
            rotate_object_local(Vector3(0, 0, 1), spatial_delta)
        YAW_DOWN:
            rotate_object_local(Vector3(0, 1, 0), -spatial_delta)
        YAW_UP:
            rotate_object_local(Vector3(0, 1, 0), spatial_delta)
        TRANSLATE_Z_UP:
            global_translate(Vector3(0, 0, spatial_delta))
        TRANSLATE_Z_DOWN:
            global_translate(Vector3(0, 0, -spatial_delta))
        TRANSLATE_X_UP:
            global_translate(Vector3(spatial_delta, 0, 0))
        TRANSLATE_X_DOWN:
            global_translate(Vector3(-spatial_delta, 0, 0))
        TRANSLATE_Y_UP:
            global_translate(Vector3(0, spatial_delta, 0))
        TRANSLATE_Y_DOWN:
            global_translate(Vector3(0, -spatial_delta, 0))


func set_posture(rot_x, rot_y, rot_z, x, y, z):
    transform.basis = Basis.IDENTITY
    rotate_x(rot_x)
    rotate_y(rot_y)
    rotate_z(rot_z)
    set_translation(Vector3(x, y, z))
