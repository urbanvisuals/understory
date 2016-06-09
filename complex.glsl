uniform float time;
uniform vec2 mouse;
uniform vec2 screen;
uniform vec2 norm;
uniform float fader1;
uniform float fader3;

void main() {
	vec2 z = gl_FragCoord.xy - screen*norm;
	z /= 100.0;

	float r = length(z);
	float t = atan(z.y, z.x);

	t += time/10000.0;

	//float change = (mouse.x - screen.x/2.0)*0.01;
	float change = (fader3 - 127.0)*time*0.00001;
	//r += change;

	float rinv = 1.0/r;
	float tinv = -t;
	
	vec2 zinv = rinv*vec2(cos(tinv), sin(tinv));
	zinv.y += change;
	zinv.x += change*0.33;

	vec2 modded = mod(zinv, 1.0);


	gl_FragColor = vec4(modded.x, modded.y, 0.0, 1.0);

}

