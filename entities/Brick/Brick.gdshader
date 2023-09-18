shader_type canvas_item;

uniform vec3 level = vec3(1.0, 0.0, 0.0);
uniform vec2 normal = vec2(1,.0);    
uniform float time = 0 ;


float distanceToLine(vec2 point, vec2 angle, float offset) { 
	vec2 perpendicular = vec2(-angle.y, angle.x);
	vec2 lineOffset = -angle * (offset-2.); 
    vec2 pointToLine = point - (lineOffset + perpendicular * dot(point - lineOffset, perpendicular));
    return length(pointToLine);
}

void fragment() {
	COLOR.a = 1.;
	COLOR.rgb = level;
	COLOR.rgb += 1. - clamp(distanceToLine(UV, normal, time), 0, 1) ;
}


