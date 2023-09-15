#ifdef GL_ES
precision highp float;
#endif

uniform vec2 u_resolution;

#define ITER_MAX 256.
#define THRESHOLD 4.

void main(){
    vec2 uv=gl_FragCoord.xy/u_resolution.xy*4.-2.;
    vec2 z=vec2(0),c=uv;
    
    float iter=0.;
    for(float i=0.;i<ITER_MAX;i+=1.){
        z=mat2(z,-z.y,z.x)*z+c;
        if(dot(z,z)>THRESHOLD*THRESHOLD){
            iter=i;
            break;
        }
    }
    
    // Set colour based on number of iterations
    if(iter==ITER_MAX){
        iter=0.;
    }else{
        iter=iter/ITER_MAX;
    }
    
    gl_FragColor=vec4(vec3(iter),1.);
}