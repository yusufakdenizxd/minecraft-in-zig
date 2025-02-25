const rl = @import("raylib");
const std = @import("std");

const Player = @This();

position: rl.Vector3,

pub fn init() *Player {
    var player = Player{
        .position = rl.Vector3{ .x = 0.0, .y = 0.0, .z = 0.0 },
    };

    return &player;
}
