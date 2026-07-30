vec4 fall_and_rotate(vec3 coords_geo, vec3 size_geo) {
    float fall_distance = 1200.0;       // 下落像素距离
    float rotation_amplitude = 0.5;     // 旋转幅度系数
    float fade_speed = 0.5;             // 淡出速度 (0.5-2.0)
    float progress_curve = 2.0;         // 进度曲线指数 (1.0=线性, 2.0=二次)

    // 进度曲线: 调整下落和旋转的加速度
    float progress = pow(niri_clamped_progress, progress_curve);

    vec2 coords = (coords_geo.xy - vec2(0.5, 1.0)) * size_geo.xy;

    // 垂直下落
    coords.y -= progress * fall_distance;

    float random_rotate = (niri_random_seed - 0.5) / 2.0;
    random_rotate = sign(random_rotate) - random_rotate;
    float max_angle = rotation_amplitude * random_rotate;
    float angle = progress * max_angle;

    mat2 rotate = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
    coords = rotate * coords;

    coords_geo = vec3(coords / size_geo.xy + vec2(0.5, 1.0), 1.0);
    vec3 coords_tex = niri_geo_to_tex * coords_geo;
    vec4 color = texture2D(niri_tex, coords_tex.st);

    // 淡出效果
    color.a *= (1.0 - progress * fade_speed);
    color.a = max(color.a, 0.0);

    return color;
}
vec4 close_color(vec3 coords_geo, vec3 size_geo) {
    return fall_and_rotate(coords_geo, size_geo);
}
