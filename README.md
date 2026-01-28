# ToastSDK

A simple SwiftUI toast SDK for iOS. Show pill-style notifications at the top of the screen with success, error, or warning styling.

| Success | Warning | Error |
|--------|---------|-------|
| <img src="https://github.com/user-attachments/assets/8f478db6-1981-4a73-bdef-b7d32cadcdf7" width="280"/> | <img src="https://github.com/user-attachments/assets/90960414-a2fd-4da0-9233-b7637b824fb8" width="280"/> | <img src="https://github.com/user-attachments/assets/e3eda48c-95b4-4dc6-b009-90ecd1389ac1" width="280"/> |

## Requirements

- iOS 15+
- SwiftUI

## Installation

Add ToastSDK as a Swift Package dependency:

1. In Xcode: **File → Add Package Dependencies…**
2. Enter the package URL.
3. Select the ToastSDK library.

## Usage

### 1. Add the toast presenter

Apply `.toastPresenter()` to the root of the screen where you want toasts to appear (usually your main content or app root):

```swift
import SwiftUI
import ToastSDK

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .toastPresenter()
        }
    }
}
```

### 2. Show toasts from any view

Use the `toast` environment value and call `show(_:type:)`:

```swift
import SwiftUI
import ToastSDK

struct MyView: View {
    @Environment(\.toast) private var toast

    var body: some View {
        VStack {
            Button("Show Success") {
                toast.show("Success!", .success)
            }
            Button("Show Error") {
                toast.show("Error!", .error)
            }
            Button("Show Warning") {
                toast.show("Warning!", .warning)
            }
        }
    }
}
```

### Toast types

- **`.success`** — green pill, checkmark icon  
- **`.error`** — red pill, X icon  
- **`.warning`** — yellow pill, exclamation icon  

### Behavior

- Only one toast is shown at a time; showing another replaces the current one and resets the timer.
- Toasts auto-dismiss after 3 seconds.
- Tapping a toast dismisses it immediately.

