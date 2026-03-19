const std = @import("std");

/// An untyped “generic” reference to any Core Foundation object.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreFoundation.framework/Headers/CFBase.h
/// Documented at: https://developer.apple.com/documentation/corefoundation/cftyperef?language=objc
pub const CFTypeRef = *const anyopaque;

/// Releases a Core Foundation object.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreFoundation.framework/Headers/CFBase.h
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfrelease
pub extern fn CFRelease(cf: CFTypeRef) callconv(.c) void;

/// A CFMachPort object is a wrapper for a native Mach port (mach_port_t). Mach ports are the native communication channel for the macOS kernel.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreFoundation.framework/Headers/CFMachPort.h
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfmachport?language=objc
pub const CFMachPortRef = ?*anyopaque;

/// A CFRunLoopSource object is an abstraction of an input source that can be put into a run loop. Input sources typically generate asynchronous events, such as messages arriving on a network port or actions performed by the user.
///
/// Defined at: ?
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfrunloopsource?language=objc
pub const CFRunLoopSourceRef = ?*anyopaque;

/// CFAllocator is an opaque type that allocates and deallocates memory for you. You never have to allocate, reallocate, or deallocate memory directly for Core Foundation objects—and rarely should you.
///
/// Defined at: ?
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfallocator?language=objc
pub const CFAllocatorRef = ?*anyopaque;

/// Priority values used for kAXPriorityKey
///
/// Defined at: ?
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfindex?language=objc
pub const CFIndex = i64; // It's long in Obj-C

/// Creates a CFRunLoopSource object for a CFMachPort object.
///
/// Defined at: ?
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfmachportcreaterunloopsource(_:_:_:)?language=objc
pub extern "C" fn CFMachPortCreateRunLoopSource(allocator: CFAllocatorRef, port: CFMachPortRef, index: CFIndex) CFRunLoopSourceRef;

/// A CFRunLoop object monitors sources of input to a task and dispatches control when they become ready for processing.
///
/// Defined at: ?
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfrunloop?language=objc
pub const CFRunLoopRef = *const anyopaque;

/// Returns the CFRunLoop object for the current thread.
///
/// Defined at: ?
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfrunloopgetcurrent()?language=objc
pub extern "C" fn CFRunLoopGetCurrent() CFRunLoopRef;

///
///
///
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfrunloopmode?language=objc
pub const CFRunLoopMode = *const anyopaque;

/// Adds a CFRunLoopSource object to a run loop mode.
///
/// Defined at: ?
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfrunloopaddsource(_:_:_:)?language=objc
pub extern "C" fn CFRunLoopAddSource(rl: CFRunLoopRef, source: CFRunLoopSourceRef, mode: CFRunLoopMode) void;

/// A pseudomode that includes all run loop modes that have been declared as members of the set of "common" modes with CFRunLoopAddCommonMode.
///
/// Documented at: https://developer.apple.com/documentation/corefoundation/kcfrunloopcommonmodes?language=objc
pub extern "C" var kCFRunLoopCommonModes: CFRunLoopMode;

/// Runs the current thread’s CFRunLoop object in its default mode indefinitely.
///
/// Defined at: ?
/// Documented at: https://developer.apple.com/documentation/corefoundation/cfrunlooprun()?language=objc
pub extern "C" fn CFRunLoopRun() void;
