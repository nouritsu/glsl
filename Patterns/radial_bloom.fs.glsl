/* Main function, uniforms & utils */
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

#define TWOPI 6.28318530718

vec3 palette(float t){
    vec3 a=vec3(.500,.500,.500);
    vec3 b=vec3(.500,.500,.500);
    vec3 c=vec3(1.,1.,1.);
    vec3 d=vec3(3.438,3.012,4.025);
    
    return a+b*cos(TWOPI*(c*t+d));
}

void main(){
    // Setup Coordinate Space
    vec2 uv=(gl_FragCoord.xy*2.-u_resolution.xy)/u_resolution.y;
    vec2 uv0=uv;
    vec3 final_col=vec3(0.);
    
    for(float i=0.;i<4.;i++){
        uv=fract(uv*1.5)-.5;
        float d=length(uv)*exp(-length(uv0));
        vec3 col=palette(length(uv0)+(i*.4)+(u_time*.4));
        
        d=sin(d*8.+u_time)/8.;
        d=abs(d);
        d=pow(.01/d,1.2);
        
        final_col+=col*d;
    }
    
    gl_FragColor=vec4(final_col,1.);
}