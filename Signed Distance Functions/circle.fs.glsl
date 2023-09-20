#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 uv=(gl_FragCoord.xy*2.-u_resolution.xy)/u_resolution.y;
    
    float radius=.5;
    float d=length(uv)-radius;
    
    gl_FragColor=vec4(vec3(d),1.);
}