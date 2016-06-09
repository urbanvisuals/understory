uniform float time;
uniform vec2 screen;
uniform vec2 norm;
uniform float fader1;
uniform float fader2;
uniform float fader3;

int countX = 10;
int countY = 3;

float doDot(int x, int y) {
	float px = float(x) / float(countX);
	float py = float(y) / float(countY);
	vec2 p = vec2(px, py);
	
	vec2 d = gl_FragCoord.xy - p*screen;
	float r = length(d);
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
	b = abs(b);
	gl_FragColor = vec4(b, b, b, 1.0);
}

