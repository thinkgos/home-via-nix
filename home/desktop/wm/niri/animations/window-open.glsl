vec4 fall_from_top_and_rotate(vec3 coords_geo, vec3 size_geo) {
    float fall_distance = 1200.0;        // 下落距离
    float rotation_amplitude = 0.5;      // 旋转幅度
    float overshoot_strength = 1.25;     // 曲线超出
    float bounce_amplitude = 0.15;       // 旋转回弹
    float bounce_frequency = 2.0;        // 震荡次数

    float c1 = overshoot_strength * 0.85;
    float c3 = c1 + 1.0;
    float progress = 1.0 + c3 * pow(niri_clamped_progress - 1.0, 3.0) + c1 * pow(niri_clamped_progress - 1.0, 2.0);

    vec2 coords = (coords_geo.xy - vec2(0.5, 1.0)) * size_geo.xy;
    coords.y += (1.0 - progress) * fall_distance;

    float random_rotate = (niri_random_seed - 0.5) / 2.0;
    random_rotate = sign(random_rotate) - random_rotate;
    float angle_factor = 1.0 - progress;
    float overshoot = 1.0 + bounce_amplitude * sin(progress * 3.14159 * bounce_frequency) * (1.0 - progress);
    float angle = angle_factor * (rotation_amplitude * random_rotate) * overshoot;

    mat2 rotate = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
    coords = rotate * coords;

    coords_geo = vec3(coords / size_geo.xy + vec2(0.5, 1.0), 1.0);
    vec3 coords_tex = niri_geo_to_tex * coords_geo;
    return texture2D(niri_tex, coords_tex.st);
}
vec4 open_color(vec3 coords_geo, vec3 size_geo) {
    return fall_from_top_and_rotate(coords_geo, size_geo);
}
