const rl = @import("raylib");
const game = @import("core/game.zig");

pub fn main() anyerror!void {
    try game.main();
}
