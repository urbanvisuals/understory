uniform float time;
uniform vec2 screen;
uniform vec2 norm;
uniform float fader1;
uniform float fader2;
uniform float fader3;
uniform float fader4;
varying vec4 vertTexCoord;


void main() {
	vec2 tomid = vertTexCoord.xy;
	float r = length(tomid);
	float s = sin(r*fader1/255.0*2.0 + time/10000.0 * fader2);
	//float b = (1.0 + pow(s, 3.0))/2.0;
	float b = pow(s, 2.0);

	gl_FragColor = vec4(b, b - fader4/255.0, b - fader4/64.0, 1.0);
}

