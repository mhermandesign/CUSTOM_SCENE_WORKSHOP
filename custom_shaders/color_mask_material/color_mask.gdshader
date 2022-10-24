shader_type canvas_item;

uniform float r_threshold = 0.8;
uniform float g_threshold = 0.8;
uniform float b_threshold = 0.8;

void fragment(){
	COLOR = texture(TEXTURE, UV); // read from texture
	if (COLOR.r < r_threshold && COLOR.g < g_threshold && COLOR.b < b_threshold) {
		COLOR.a = 0.0;
	}
}