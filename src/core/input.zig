const rl = @import("raylib");
const std = @import("std");
const math = std.math;
const game = @import("game.zig");
const keybindings = @import("keybinding.zig");

pub fn inputHandle(state: *game.GameState) void {
    handleCameraRotation(state);

    if (rl.isKeyPressed(keybindings.moveForward)) {
        std.debug.print("moveForward\n", .{});
    }
    if (rl.isKeyPressed(keybindings.moveBackward)) {
        std.debug.print("moveBackward\n", .{});
    }
    if (rl.isKeyPressed(keybindings.moveLeft)) {
        std.debug.print("moveLeft\n", .{});
    }
    if (rl.isKeyPressed(keybindings.moveRight)) {
        std.debug.print("moveRight\n", .{});
    }
    if (rl.isKeyPressed(keybindings.jump)) {
        std.debug.print("jump\n", .{});
    }
    if (rl.isKeyPressed(keybindings.sneak)) {
        std.debug.print("sneak\n", .{});
    }
    if (rl.isKeyPressed(keybindings.sprint)) {
        std.debug.print("sprint\n", .{});
    }
}

fn handleCameraRotation(state: *game.GameState) void {
    const mouse = rl.getMouseDelta();

    state.yaw += math.degreesToRadians(mouse.x);
    state.pitch += math.degreesToRadians(mouse.y);
    const maxPitch: f32 = (std.math.pi / 2.0) - 0.01;
    if (state.pitch > maxPitch) state.pitch = maxPitch;
    if (state.pitch < -maxPitch) state.pitch = -maxPitch;

    const cameraPosition = state.camera.position;

    state.camera.target = rl.Vector3{
        .x = cameraPosition.x + (math.cos(state.yaw) * math.cos(state.pitch)),
        .y = cameraPosition.y - math.sin(state.pitch),
        .z = cameraPosition.z + (math.sin(state.yaw) * math.cos(state.pitch)),
    };
}
