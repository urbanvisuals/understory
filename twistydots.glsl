uniform float time;
uniform vec2 screen;
uniform vec2 norm;
uniform float fader1;
uniform float fader2;
uniform float fader3;

mat2 rotate(float angle)
{
  return mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
}


void main() {
	float circR = fader1 / 255.0 * 0.8;
	float scale = ((fader2 / 255.0) - 0.5) * 100.0;

	vec2 scaledCoord = (gl_FragCoord.xy - screen * norm)/scale;
	vec2 shift = rotate(time/9351.0) * vec2(sin(scaledCoord.x * 0.5), cos(scaledCoord.y * 0.3));

	// Rotate
	float theta = time * fader3 / 500000.0;

	scaledCoord = rotate(theta) * scaledCoord + shift;
	
	vec2 internalCoord = mod(scaledCoord, 1.0);
	vec2 externalCoord = floor(scaledCoord);

	float r = length(internalCoord-0.5);
	float b = (r-circR)*scale; // for aliasing
	b = 1.0 - clamp(b, 0.0, 1.0);
	gl_FragColor = vec4(b, b, b, 1.0);
}
