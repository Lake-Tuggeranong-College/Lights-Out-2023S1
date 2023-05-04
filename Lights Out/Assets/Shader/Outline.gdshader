shader_type spatial;
render_mode unshaded;

uniform vec4 outline_color: hint_color;
uniform float outline_strength = 100.0;
uniform float fade_offset = 0.1;
uniform float clip_height = 0;

void fragment() {
    ALBEDO = outline_color.rgb;
    ALPHA = dot(NORMAL, vec3(0,1,0)) * outline_strength;
	vec4 world_vertex = inverse(INV_CAMERA_MATRIX) * vec4(VERTEX,1.0);
	ALPHA = smoothstep(1, 0, (world_vertex.y - clip_height)/fade_offset);
}