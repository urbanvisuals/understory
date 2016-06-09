uniform float time;
uniform vec2 screen;
uniform vec2 norm;
uniform float fader1;
uniform float fader2;
uniform float fader3;
uniform float fader4;

mat2 rotate(float angle)
{
  return mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
}

float calcDot(vec2 coord, float circR, float scale) {
	vec2 internalCoord = mod(coord, 1.0);
	vec2 externalCoord = floor(coord);

	float r = length(internalCoord-0.5);
	float b = (r-circR)*scale; // for aliasing
	return 1.0 - clamp(b, 0.0, 1.0);
}


void main() {
	float circR = fader1 / 255.0 * 0.8;
	float scale = ((fader2 / 255.0) - 0.5) * 100.0;

	vec2 scaledCoord = (gl_FragCoord.xy - screen * norm)/scale;
	vec2 shift = rotate(time/9351.0) * vec2(sin(scaledCoord.x * 0.5), cos(scaledCoord.y * 0.3));

	float shiftScale = fader4/255.0;
	vec2 shift2 = rotate(time/9300.0) * (shiftScale*vec2(sin(scaledCoord.x * 0.2), cos(scaledCoord.y * 0.1)));

	// Rotate
	float theta = time * fader3 / 500000.0;

	scaledCoord = rotate(theta) * scaledCoord + shift;
	
	float b = calcDot(scaledCoord, circR, scale);
	b *= calcDot(scaledCoord+shift2, circR, scale);
	gl_FragColor = vec4(b, b, b, 1.0);
}

