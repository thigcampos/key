const std = @import("std");

/// Defines a mask that identifies the set of Quartz events to be observed in an event tap.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventmask?language=objc
pub const CGEventMask = u64;

/// Constants that specify the different types of input events.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventtype?language=objc
pub const CGEventType = enum(u32) {
    /// Specifies a null event.
    null = 0,
    /// Specifies a mouse down event with the left button.
    leftMouseDown = 1,
    // Specifies a mouse up event with the left button.
    leftMouseUp = 2,
    /// Specifies a mouse down event with the right button.
    rightMouseDown = 3,
    /// Specifies a mouse up event with the right button.
    rightMouseUp = 4,
    /// Specifies a mouse moved event.
    mouseMoved = 5,
    /// Specifies a mouse drag event with the left button down.
    leftMouseDragged = 6,
    /// Specifies a mouse drag event with the right button down.
    rightMouseDragged = 7,
    /// Specifies a key down event.
    keyDown = 10,
    /// Specifies a key up event.
    keyUp = 11,
    /// Specifies a key changed event for a modifier or status key.
    flagsChanged = 12,
    /// Specifies a scroll wheel moved event.
    scrollWheel = 22,
    /// Specifies a tablet pointer event.
    tabletPointer = 23,
    /// Specifies a tablet proximity event.
    tabletProximity = 24,
    /// Specifies a mouse down event with one of buttons 2-31.
    otherMouseDown = 25,
    /// Specifies a mouse up event with one of buttons 2-31.
    otherMouseUp = 26,
    /// Specifies a mouse drag event with one of buttons 2-31 down.
    otherMouseDragged = 27,
    _, // Indicates that the enum is not exaustive.
};

/// Generates an event mask for a single type of event.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventmaskbit
pub fn CGEventMaskBit(eventType: CGEventType) CGEventMask {
    return 1 << eventType;
}

/// An event mask that specifies all event types.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/kcgeventmaskforallevents?language=objc
pub const kCGEventMaskForAllEvents: CGEventMask = ~0;
