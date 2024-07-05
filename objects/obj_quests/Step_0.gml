mouseScroll += (mouse_wheel_down() - mouse_wheel_up())*45

mouseScroll = clamp(mouseScroll, -mouseScrollMax, mouseScroolMin)