const rl = @import("raylib");
const std = @import("std");
pub const Player = @import("player.zig");

const GameState = @This();

pub fn init(allocator: std.mem.Allocator) !*GameState {
    const player = Player.init();
    const gameState = try allocator.create(GameState);

    const camera = try allocator.create(rl.Camera);

    const cameraPosition: rl.Vector3 = .{ .x = 0, .y = 10, .z = 0 };
    const cameraTarget: rl.Vector3 = .{ .x = 0, .y = 2, .z = 0 };
    const cameraUp: rl.Vector3 = .{ .x = 0, .y = 1, .z = 0 };
    const cameraProjection = rl.CameraProjection.perspective;
    camera.* = rl.Camera{
        .fovy = 45.0,
        .position = cameraPosition,
        .up = cameraUp,
        .projection = cameraProjection,
        .target = cameraTarget,
    };

    gameState.* = GameState{
        .player = player,
        .camera = camera,
        .yaw = 0.0,
        .pitch = 0.0,
    };
    return gameState;
}

player: *Player,
camera: *rl.Camera,
yaw: f32,
pitch: f32,

pub fn deinit(self: *GameState, allocator: std.mem.Allocator) void {
    allocator.destroy(self);
}

pub fn updateCamera(self: *GameState, position: rl.Vector3) void {
    self.camera.position = rl.Vector3.add(self.camera.position, position);
}
