uniform float time;
uniform vec2 screen;
uniform vec2 norm;
uniform float fader1;
uniform float fader2;
uniform float fader3;

void main() {
	float circR = fader1 / 255.0 * 0.8;
	float scale = ((fader2 / 255.0) - 0.5) * 100.0;

	vec2 scaledCoord = (gl_FragCoord.xy - screen * norm)/scale;
	// Rotate
	float theta = time * fader3 / 500000.0;
	scaledCoord = vec2(scaledCoord.x*cos(theta) + scaledCoord.y*sin(theta),
			-scaledCoord.x*sin(theta) + scaledCoord.y*cos(theta));
	
	vec2 internalCoord = mod(scaledCoord, 1.0);
	vec2 externalCoord = floor(scaledCoord);

	float r = length(internalCoord-0.5);
	float b = (r-circR)*scale; // for aliasing
	b = 1.0 - clamp(b, 0.0, 1.0);
	gl_FragColor = vec4(b, b, b, 1.0);
}

