extends Spatial


var horizontal


func _ready():
    horizontal = get_node("horizontal")


func _input(event):
    if not event is InputEventMouseMotion:
        return

    if not event.button_mask and BUTTON_LEFT:
        return

    rotate_y(event.relative.x * -0.01)

    horizontal.rotate_x(event.relative.y * -0.01)
