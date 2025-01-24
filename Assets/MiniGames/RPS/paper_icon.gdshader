shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float frequency = 5;
uniform float depth = 0.005;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec3 canvas = textureLod(screen_texture, SCREEN_UV, 0.0).rgb;
	vec2 uv = SCREEN_UV;
	
	float displacement = (TIME * 100.) / 3600.;
	float TimeMod = mod(TIME, 100);
	
	uv.x += sin((mod(uv.y, TimeMod)) * frequency + TIME) * depth;
	uv.x = clamp(uv.x, 0.0, 1.0);
	
	vec3 c = textureLod(screen_texture, uv, 0.0).rgb;
	
	COLOR.rbg = c;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
