# Copilot Instructions: Modern Flutter Development

## 1. General Principles
* **Language:** Use Dart with strict type safety. Avoid `dynamic` unless necessary; prefer explicit types or `final`/`const`.
* **Framework:** Follow Material 3 (M3) design patterns.
* **Widget Type:** Prefer `const` constructors whenever possible to optimize rebuilds.
* **Code Style:** Follow official Dart linter rules. Use `lowerCamelCase` for variables/functions and `UpperCamelCase` for classes/enums.

## 2. UI & Styling (Material 3)
* **Theming:** Do NOT hardcode colors or text styles in individual widgets. Always use `Theme.of(context).colorScheme` and `Theme.of(context).textTheme`.
* **Layouts:** 
    * Use `Flexible` and `Expanded` inside `Row` and `Column` to handle overflow gracefully.
    * Prefer `ListView.builder` or `GridView.builder` for long/dynamic lists instead of a standard `Column` or `Row` with manual children.
* **Responsiveness:** Use `MediaQuery` or `LayoutBuilder` to handle different screen sizes. Avoid hardcoded pixel values for layout spacing where possible; use relative padding or the `gap` package if available.

## 3. State Management (Sensible Defaults)
* **Local State:** For simple, UI-only state (e.g., a toggle or an animation), use `StatefulWidget` and `setState()`.
* **Global/Business Logic State:** For complex app logic, prefer **Riverpod** or **Bloc/Cubit**. 
* **Immutability:** Treat state as immutable. When updating a list or object, create a new instance (e.g., `list = [...oldList, newItem]`) rather than mutating the existing one.

## 4. Project Structure & Architecture
* **Separation of Concerns:** Follow a "Feature-first" or "Layered" folder structure:
    * `lib/models/`: Plain old Dart objects (POJOs).
    * `lib/views/` or `lib/ui/`: UI widgets and screens.
    * `lib/providers/` or `lib/logic/`: State management/Business logic.
    * `lib/services/`: API calls, Database, and external integrations.
* **Logic vs UI:** Keep `build()` methods clean. No heavy calculations or business logic should happen inside a `build()` method; move those to a controller or provider.

## 5. Error Handling & Async
* **Async/Await:** Always use `async`/`await` instead of `.then()`.
* **Error Safety:** Wrap asynchronous calls (API, DB) in `try-catch` blocks. Handle errors explicitly in the UI (e.g., showing an `ErrorWidget` or a `SnackBar`).
* **Loading States:** Always account for a "loading" state when fetching data (e.g., using a `CircularProgressIndicator`).

## 6. Testing & Quality
* **Testing:** Write unit tests for business logic/models and widget tests for complex UI components.
* **Documentation:** Use `///` (doc comments) for all public-facing classes and methods.