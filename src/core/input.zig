const rl = @import("raylib");
const std = @import("std");
const game = @import("game.zig");
const keybindings = @import("keybinding.zig");

pub fn inputHandle(state: *game.GameState) void {
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
