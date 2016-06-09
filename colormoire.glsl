uniform float time;
uniform vec2 mouse;
uniform vec2 norm;
uniform vec2 screen;
uniform float fader2;
uniform float fader3;
uniform float fader4;

vec3 concentric(vec2 center, float scale) {
	vec2 screenCoord = gl_FragCoord.xy;
	vec2 delta = screenCoord - center;
	float r = length(delta) + time/10000.0 * fader4;
	//float r = length(delta);
	//float theta = atan2(delta.y, delta.x);
	float s = 0.5 * pow(sin(r/scale) + 1.0, 3.0);
	return vec3(s, s, s);
}

void main() {
	vec2 coord = vec2(sin(time * fader2 / 1000000.0), sin(time * fader3 / 1000000.0));
	coord = coord*0.5 + 0.5;
	float scale = coord.y * 10.0;

	vec3 a = concentric(screen-coord*screen, scale) * vec3(1.0, 0.0, 0.0);
	vec3 b = concentric(coord*screen, scale) * vec3(0.0, 1.0, 0.0);

	gl_FragColor = vec4(a + b, 1.0);
}

