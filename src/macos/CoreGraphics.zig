const std = @import("std");
const foundation = @import("CoreFoundations.zig");

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
pub const kCGEventMaskForAllEvents: CGEventMask = ~@as(u64, 0);

/// Defines an opaque type that represents state within the client application that’s associated with an event tap.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventtapproxy?language=objc
pub const CGEventTapProxy = *opaque {};

/// Defines an opaque type that represents a low-level hardware event.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventref?language=objc
pub const CGEventRef = *opaque {};

/// Constants used as keys to access specialized fields in low-level events.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventfield?language=objc
pub const CGEventField = enum(u32) {
    /// Key to access an integer field that contains the mouse button number. For information about the possible values, see CGMouseButton.
    kCGMouseEventButtonNumber = 3,
    /// Key to access an integer field that contains the virtual keycode of the key-down or key-up event.
    kCGKeyboardEventKeycode = 9,
    _, // Not exaustive, specially because we don't need it to be exaustive as of now.
};

/// Returns the integer value of a field in a Quartz event.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEvent.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgevent/getintegervaluefield(_:)?language=objc
pub extern "C" fn CGEventGetIntegerValueField(event: ?CGEventRef, field: CGEventField) i64;

/// Constants that indicate the modifier key state at the time an event is created, as well as other event-related states.
///
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventflags?language=objc
pub const CGEventFlags = enum(u64) {
    /// Indicates that the Caps Lock key is down for a keyboard, mouse, or flag-changed event.
    kCGEventFlagMaskAlphaShift = 0x00010000,
    /// Indicates that the Shift key is down for a keyboard, mouse, or flag-changed event.
    kCGEventFlagMaskShift = 0x00020000,
    /// Indicates that the Control key is down for a keyboard, mouse, or flag-changed event.
    kCGEventFlagMaskControl = 0x00040000,
    /// Indicates that the Alt or Option key is down for a keyboard, mouse, or flag-changed event.
    kCGEventFlagMaskAlternate = 0x00080000,
    /// Indicates that the Command key is down for a keyboard, mouse, or flag-changed event.
    kCGEventFlagMaskCommand = 0x00100000,
    /// Indicates that the Help modifier key is down for a keyboard, mouse, or flag-changed event. This key is not present on most keyboards, and is different than the Help key found in the same row as Home and Page Up.
    kCGEventFlagMaskHelp = 0x00400000,
    /// Indicates that the Fn (Function) key is down for a keyboard, mouse, or flag-changed event. This key is found primarily on laptop keyboards.
    kCGEventFlagMaskSecondaryFn = 0x00800000,
    /// Identifies key events from the numeric keypad area on extended keyboards.
    kCGEventFlagMaskNumericPad = 0x00200000,
    /// Indicates that mouse and pen movement events are not being coalesced.
    kCGEventFlagMaskNonCoalesced = 0x00000100,
};

/// Sets the event flags of a Quartz event.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEvent.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventsetflags
pub extern "C" fn CGEventGetFlags(event: ?CGEventRef) CGEventFlags;

/// The basic type for all floating-point values.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGBase.h
/// Documented at: https://developer.apple.com/documentation/corefoundation/cgfloat-c.typealias?language=objc
pub const CGFloat = f64;

/// A structure that contains a two-dimensional vector.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEvent.h
/// Documented at: https://developer.apple.com/documentation/corefoundation/cgpoint?language=objc
pub const CGPoint = extern struct {
    x: CGFloat,
    y: CGFloat,
};

/// Returns the location of a Quartz mouse event.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEvent.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgevent/location?language=objc
pub extern "C" fn CGEventGetLocation(event: ?CGEventRef) CGPoint;

/// Constants that specify possible tapping points for events.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventtaplocation?language=objc
pub const CGEventTapLocation = enum(u32) {
    kCGHIDEventTap = 0,
    kCGSessionEventTap,
    kCGAnnotatedSessionEventTap,
};

/// Constants that specify where a new event tap is inserted into the list of active event taps.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventtapplacement?language=objc
pub const CGEventTapPlacement = enum(u32) {
    kCGHeadInsertEventTap = 0,
    kCGTailAppendEventTap,
};

/// Constants that specify whether a new event tap is an active filter or a passive listener.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventtapoptions?language=objc
pub const CGEventTapOptions = enum(u32) {
    kCGEventTapOptionDefault = 0x00000000,
    kCGEventTapOptionListenOnly = 0x00000001,
};

/// A client-supplied callback function that’s invoked whenever an associated event tap receives a Quartz event.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEventTypes.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgeventtapcallback?language=objc
pub const CGEventTapCallBack = *const fn (tapProxy: CGEventTapProxy, eventType: CGEventType, event: ?CGEventRef, userinfo: ?*anyopaque) callconv(.c) ?CGEventRef;

/// Creates an event tap.
///
/// Defined at: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.2.sdk/System/Library/Frameworks/CoreGraphics.framework/CGEvent.h
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgevent/tapcreate(tap:place:options:eventsofinterest:callback:userinfo:)?language=objc
pub extern "C" fn CGEventTapCreate(tap: CGEventTapLocation, place: CGEventTapPlacement, options: CGEventTapOptions, eventOfInterest: CGEventMask, callback: CGEventTapCallBack, userinfo: ?*anyopaque) foundation.CFMachPortRef;

/// Enables or disables an event tap.
///
/// Defined at:
/// Documented at: https://developer.apple.com/documentation/coregraphics/cgevent/tapenable(tap:enable:)?language=objc
pub extern "C" fn CGEventTapEnable(tap: foundation.CFMachPortRef, enable: bool) void;
