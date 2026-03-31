const std = @import("std");
var stdout = std.fs.File.stdout().writer(&.{});
const commands = @import("commands.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    const help_message =
        \\Log human-interface events in macOS.
        \\
        \\Commands and flags:
        \\
        \\  key log        starts human-interface device logger.
        \\  key --help     prints the help message.
        \\
    ;

    if (args.len != 2) {
        return;
    }

    if (std.mem.eql(u8, args[1], "--help")) {
        try stdout.interface.print(help_message, .{});
        return;
    }

    if (std.mem.eql(u8, args[1], "log")) {
        commands.log_events();
        return;
    }
}

