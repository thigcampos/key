const std = @import("std");
const graphics = @import("macos/CoreGraphics.zig");
const foundations = @import("macos/CoreFoundations.zig");

fn event_logger(
    proxy: graphics.CGEventTapProxy,
    event_type: graphics.CGEventType,
    event: ?graphics.CGEventRef,
    refcon: ?*anyopaque,
) callconv(.c) ?graphics.CGEventRef {
    // Won't be used
    _ = proxy;
    _ = refcon;

    switch (event_type) {
        graphics.CGEventType.keyDown => {
            const key_code = graphics.CGEventGetIntegerValueField(event, graphics.CGEventField.kCGKeyboardEventKeycode);
            const flags = graphics.CGEventGetFlags(event);
            std.debug.print("[key]   keycode={d}  flags=0x{x}\n", .{ key_code, @intFromEnum(flags) });
        },
        graphics.CGEventType.leftMouseDown, graphics.CGEventType.rightMouseDown, graphics.CGEventType.otherMouseDown => {
            const button = graphics.CGEventGetIntegerValueField(event, graphics.CGEventField.kCGMouseEventButtonNumber);
            const loc = graphics.CGEventGetLocation(event);
            std.debug.print("[mouse] button={d}  x={d:.1}  y={d:.1}\n", .{ button, loc.x, loc.y });
        },
        else => {},
    }

    return event;
}

pub fn log_events() void {
    const event_mask: graphics.CGEventMask = graphics.kCGEventMaskForAllEvents; // A catch-all for masks
    const tap = graphics.CGEventTapCreate(
        graphics.CGEventTapLocation.kCGSessionEventTap,
        graphics.CGEventTapPlacement.kCGHeadInsertEventTap,
        graphics.CGEventTapOptions.kCGEventTapOptionListenOnly,
        event_mask,
        event_logger,
        @as(?*anyopaque, null),
    );
    defer foundations.CFRelease(tap.?);

    if (tap == null) {
        std.debug.print("Failed to create event tap. Grant Accessibility permissions.\n", .{});
        std.process.exit(1);
    }

    const src = foundations.CFMachPortCreateRunLoopSource(null, tap, 0);
    defer foundations.CFRelease(src.?);

    foundations.CFRunLoopAddSource(foundations.CFRunLoopGetCurrent(), src, foundations.kCFRunLoopCommonModes);
    graphics.CGEventTapEnable(tap, true);

    std.debug.print("Listening for key & mouse down events. Ctrl+C to stop.\n", .{});
    foundations.CFRunLoopRun();
}
