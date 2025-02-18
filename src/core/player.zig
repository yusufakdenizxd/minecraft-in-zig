const rl = @import("raylib");

pub const Player = struct {
    camera: rl.Camera,
    position: rl.Vector3,
};

pub fn initPlayer() Player {
    const cameraPosition: rl.Vector3 = .{ .x = 18, .y = 21, .z = 18 };
    const cameraTarget: rl.Vector3 = .{ .x = 0, .y = 0, .z = 0 };
    const cameraUp: rl.Vector3 = .{ .x = 0, .y = 1, .z = 0 };
    const cameraProjection = rl.CameraProjection.perspective;
    const camera = rl.Camera{ .fovy = 45.0, .position = cameraPosition, .up = cameraUp, .projection = cameraProjection, .target = cameraTarget };

    return Player{
        .camera = camera,
        .position = rl.Vector3{ .x = 0.0, .y = 0.0, .z = 0.0 },
    };
}
