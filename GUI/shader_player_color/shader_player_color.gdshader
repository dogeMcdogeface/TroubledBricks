shader_type canvas_item;

uniform float saturation: hint_range(0.0, 1.0) = 0.0;
uniform float coloration: hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    vec3 grayscale = vec3(dot(tex.rgb, vec3(0.299, 0.587, 0.114)));

    // Hue rotation
    float hue = atan(tex.rgb.y, tex.rgb.x);
    float hueShift = 2.0 * PI * coloration;
    hue += hueShift;

    float chroma = length(tex.rgb);
    vec3 colorized = vec3(
        chroma * cos(hue),
        chroma * sin(hue),
        0.0
    );

    // Combine hue-rotated color and saturation
    COLOR.rgb = mix(grayscale, colorized, saturation);
    COLOR.a = tex.a;
}