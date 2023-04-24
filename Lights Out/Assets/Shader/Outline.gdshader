shader_type spatial;
render_mode unshaded;

uniform vec4 outline_color: hint_color;
uniform float outline_strength = 1.0;

void fragment() {
    ALBEDO = outline_color.rgb;
    ALPHA = dot(NORMAL, vec3(0,0,1)) * outline_strength;
}