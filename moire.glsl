uniform float time;
uniform vec2 mouse;
uniform vec2 screen;
uniform float fader1;
uniform vec2 norm;

vec3 concentric(vec2 center, float scale) {
	vec2 screenCoord = gl_FragCoord.xy;
	vec2 delta = screenCoord - center;
	float r = length(delta);
	//float theta = atan2(delta.y, delta.x);
	float s = 0.5 * pow((sin(r/scale) + 1.0), 3.0);
	return vec3(s, s, s);
}

void main() {
	//gl_FragColor = vec4(mouse.x / screen.x, mouse.y / screen.y, mod(time/1000.0, 1.0), 1.0);
	//vec3 a = concentric(screen/2.0, 1.0);
	float r = time/1000.0;
	float theta = time/2000.0;
	float scale = fader1/255.0 * 10.0;
	//float scale = 2.0;

	vec2 off = vec2(sin(theta), 0.9*cos(theta)) * r * scale;
	vec2 center = norm*screen;
	//vec2 pt = center + off;
	vec3 a = concentric(center + off, scale);
	vec3 b = concentric(center - off, scale);

	gl_FragColor = vec4(a*b, 1.0);
}

