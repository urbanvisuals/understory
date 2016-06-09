uniform float time;
uniform vec2 screen;
uniform vec2 norm;
uniform float fader1;
uniform float fader2;
uniform float fader3;
uniform float fader4;
uniform float fader5;

int countX = 10;
int countY = 3;

float doDot(int x, int y) {
	float px = float(x) / float(countX);
	float py = float(y) / float(countY);
	vec2 p = vec2(px, py);
	
	vec2 d = gl_FragCoord.xy - p*screen;
	float r = length(d)*fader1;
	return sin(r/100.0 + time/2000.0);
	//if (sin(r/100.0 + time/2000.0) > 0.0) {

	//}
}

void main() {

	float b = 1.0;
	for (int x = 0; x < countX; x++) {
		for (int y = 0; y < countY; y++) {
			b+=doDot(x,y);
		}
	}
	//b = abs(b);
	//b*= fader4/255.0;
	float bneg = b<0.0?-b:0.0;
	float bpos = b>0.0?b:0.0;
	vec4 colourVersion =  vec4(bneg, bpos, abs(b), 1.0);
	float bb = clamp(abs(b), 0.0, 1.0);
	if (fader5 > 128.0) bb = 1.0 - bb;
	vec4 bwVersion = vec4(bb, bb, bb, 1.0);

	float colourInterp = fader4/255.0;
	gl_FragColor = colourInterp*colourVersion + (1.0 - colourInterp)*bwVersion;
	
}


