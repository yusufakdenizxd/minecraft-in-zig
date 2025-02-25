const rl = @import("raylib");
const std = @import("std");
pub const GameState = @import("game_state.zig");
const input = @import("input.zig");

pub fn main() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "Minecraft In Zig");
    defer rl.closeWindow();

    const allocator = std.heap.page_allocator;

    rl.setTargetFPS(60);

    rl.hideCursor();

    const gameState = try GameState.init(allocator);
    defer gameState.deinit(allocator);

    while (!rl.windowShouldClose()) {
        mainLoop(gameState);
    }
    // rl.unloadModel(model);
    rl.closeWindow();
}

pub fn mainLoop(state: *GameState) void {
    input.inputHandle(state);
    rl.beginDrawing();

    rl.clearBackground(rl.Color.ray_white);

    rl.beginMode3D(state.camera.*);

    rl.drawCube(rl.Vector3.init(0, 0, 0), 2, 2, 2, rl.Color.red);
    rl.drawCube(rl.Vector3.init(10, 0, 0), 2, 2, 2, rl.Color.blue);
    rl.drawCube(rl.Vector3.init(10, 0, 10), 2, 2, 2, rl.Color.orange);
    rl.drawCube(rl.Vector3.init(10, 10, 10), 2, 2, 2, rl.Color.green);
    rl.drawCube(rl.Vector3.init(-10, 10, 10), 2, 2, 2, rl.Color.yellow);
    rl.drawGrid(10, 1);

    rl.endMode3D();

    rl.endDrawing();
}
