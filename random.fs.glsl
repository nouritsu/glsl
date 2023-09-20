#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

#define PI 3.14159265359

float plot(vec2 st,float pct){
    return smoothstep(pct-.02,pct,st.y)-
    smoothstep(pct,pct+.02,st.y);
}

float r(float x){
    return max(cos(x*2.*PI),0.);
}

float g(float x){
    return max(sin(x*1.325*PI),0.);
}

float b(float x){
    return max(sin(x*4.-.8),0.);
}

void main(){
    vec2 uv=gl_FragCoord.xy/u_resolution;
    vec3 col=vec3(uv.x,0.,0.);
    
    col.r=r(uv.x);
    col.g=g(uv.x);
    col.b=b(uv.x);
    
    // col=mix(col,vec3(1.,0.,0.),plot(uv,r(uv.x)));
    // col=mix(col,vec3(0.,1.,0.),plot(uv,g(uv.x)));
    // col=mix(col,vec3(0.,0.,1.),plot(uv,b(uv.x)));
    
    gl_FragColor=vec4(col,1.);
}
