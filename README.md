# ShortcutsVolumeBug

This project shows a bug with SiriKit/Shortcuts in iOS 13 beta 2. When a custom Intent has a parameter of type Measurement<UnitVolume>, the resolve() method is repeatedly called without ever filling in the value of the parameter specified by the user - hence, the shortcut repeats itself forever without completing.

This project has a simple structure, including:

* an unused `ShortcutsVolumeBug` iOS shell app
* a `ShortcutIntent` Intents extension
* a shared `MyKit` framework which includes the .intentdefinition file and the `DoFooIntentHandler` class conforming to `DoFooIntentHandling`.
* The custom intent is called `DoFoo`, with title "Do a Foo". with a single parameter called `amount` which is of type `Measurement<UnitVolume>`.

Steps to reproduce:

1. Run this project on a device running iOS 13 beta 2 - I used an iPhone 8.
2. On device, open the Shortcuts app and create a shortcut which uses the "Do a Foo" action.
3. Run the `ShortcutIntent` extension from Xcode targeting the Shortcuts app, then launch the "Do a Foo" shortcut - this attaches the debugger to the `ShortcutIntent` process.
4. Note in the console that "resolveAmount called" is repeatedly printed as the user attempts to enter a value for the `amount` parameter. If setting a breakpoint in the `resolveAmount` method, you can see that the `intent` object (of class `DoFooIntent`) never has the value of `amount` filled in, causing the infinite repeating.

