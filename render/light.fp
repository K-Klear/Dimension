varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;

void main()
{
    lowp vec4 tex = texture2D(texture_sampler, var_texcoord0.xy);
    //if (tex.w < 0.1)
    //{
    //    discard;
    //}
    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    gl_FragColor = tex * tint_pm;
}
