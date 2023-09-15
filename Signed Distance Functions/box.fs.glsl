#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 uv=(gl_FragCoord.xy*2.-u_resolution.xy)/u_resolution.y;
    
    float l=.5;
    float b=.2;
    vec2 dim=abs(uv)-vec2(l,b);
    float d=length(max(dim,0.))+min(max(dim.x,dim.y),0.);
    
    gl_FragColor=vec4(vec3(d),1.);
}