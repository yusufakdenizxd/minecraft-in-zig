const rl = @import("raylib");
const std = @import("std");
const p = @import("player.zig");
const input = @import("input.zig");

pub fn main() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    var gameState = initGameState();
    const mesh = rl.genMeshCube(1, 1, 1);

    const model = try rl.loadModelFromMesh(mesh);

    const mapPosition = rl.Vector3{ .x = -8.0, .y = 0.0, .z = -8.0 };

    while (!rl.windowShouldClose()) {
        rl.updateCamera(&gameState.player.camera, rl.CameraMode.orbital);
        rl.beginDrawing();

        rl.clearBackground(rl.Color.ray_white);
        rl.beginMode3D(gameState.player.camera);
        rl.drawModel(model, mapPosition, 1, rl.Color.red);
        rl.drawGrid(20, 1.0);
        rl.endMode3D();
        rl.drawFPS(10, 10);

        rl.endDrawing();

        mainLoop(gameState);
    }
    rl.unloadModel(model);

    rl.closeWindow();
}

pub const GameState = struct {
    player: p.Player,
};

pub fn initGameState() GameState {
    const player = p.initPlayer();
    return GameState{ .player = player };
}

pub fn mainLoop(state: GameState) void {
    _ = state;
    input.inputHandle();
}
