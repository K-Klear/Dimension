varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 light_direction;
uniform lowp vec4 light_col_1;
uniform lowp vec4 light_col_2;

float max_distance_divisor = 1.0 / 512.0;
lowp vec2 sprite_size = vec2(1.0 / 512.0, 1.0 / 512.0);
float alpha_threshold = 0.5;

void main()
{
    lowp vec4 frag_colour = texture2D(texture_sampler, var_texcoord0);
    lowp vec4 frag_light_colour = vec4(0.0);
    
    if (frag_colour.w > alpha_threshold)
    {
        lowp vec2 direction = light_direction.xy - gl_FragCoord.xy;
        lowp float distance = length(direction) * max_distance_divisor;
        lowp float intensity = max(light_col_1.w - distance, 0.0) * 0.5333;
        direction = normalize(direction) * sprite_size * sqrt(distance) * 3.0;
        
        if (texture2D(texture_sampler, var_texcoord0 + direction).w < alpha_threshold)
        {
            frag_light_colour = frag_light_colour + light_col_1 * intensity;
        }
        if (texture2D(texture_sampler, var_texcoord0 + direction * 2.0).w < alpha_threshold)
        {
            frag_light_colour = frag_light_colour + light_col_1 * intensity;
        }
        if (texture2D(texture_sampler, var_texcoord0 + direction * 4.0).w < alpha_threshold)
        {
            frag_light_colour = frag_light_colour + light_col_1 * intensity;
        }
        
        direction = light_direction.zw - gl_FragCoord.xy;
        distance = length(direction) * max_distance_divisor;
        intensity = max(light_col_2.w - distance, 0.0) * 0.3333;
        direction = normalize(direction) * sprite_size * sqrt(distance) * 3.0;

        if (texture2D(texture_sampler, var_texcoord0 + direction).w < alpha_threshold)
        {
            frag_light_colour = frag_light_colour + light_col_2 * intensity;
        }
        if (texture2D(texture_sampler, var_texcoord0 + direction * 2.0).w < alpha_threshold)
        {
            frag_light_colour = frag_light_colour + light_col_2 * intensity;
        }
        if (texture2D(texture_sampler, var_texcoord0 + direction * 4.0).w < alpha_threshold)
        {
            frag_light_colour = frag_light_colour + light_col_2 * intensity;
        }
        
        frag_light_colour.w = 1.00;
    }
    
    gl_FragColor = frag_colour + frag_light_colour;
}
