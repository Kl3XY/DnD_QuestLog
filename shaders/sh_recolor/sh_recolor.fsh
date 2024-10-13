//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 c_cBase;
uniform vec3 c_cSoftLight;
uniform vec3 c_cHardLight;
uniform vec3 c_cShadow;
uniform vec3 c_cOutline;

void main()
{
    vec4 tex = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (tex == vec4(0.0, 0.0, 1.0, 1.0)) {
		tex = vec4(c_cBase, 1.0);
	}
	if (tex == vec4(0.0, 1.0, 1.0, 1.0)) {
		tex = vec4(c_cSoftLight, 1.0);
	}
	if (tex == vec4(1.0, 1.0, 0.0, 1.0)) {
		tex = vec4(c_cHardLight, 1.0);
	}
	if (tex == vec4(0.0, 1.0, 0.0, 1.0)) {
		tex = vec4(c_cShadow, 1.0);
	}
	if (tex == vec4(1.0, 0.0, 1.0, 1.0)) {
		tex = vec4(c_cOutline, 1.0);
	}
	
	
	
	gl_FragColor = tex;
}
