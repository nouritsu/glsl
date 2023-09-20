/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main(){
    vec2 uv=(gl_FragCoord.xy*2.-u_resolution.xy)/u_resolution.y;
    
    float s=.3;
    vec2 dim=abs(uv)-vec2(s);
    float d=length(max(dim,0.))+min(max(dim.x,dim.y),0.);
    d=step(.00001,d);
    d=abs(sin(d+u_time));
    
    gl_FragColor=vec4(vec3(d),1.);
}