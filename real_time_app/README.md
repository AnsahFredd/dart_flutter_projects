# World Time App

A Flutter application that displays the current time for different locations around the world in real time, fetched from the [World Time API](https://worldtimeapi.org/).

## Features

- Fetches live time data from the World Time API
- Supports multiple world locations with flag icons
- Multi-screen navigation (Loading → Home → Choose Location)
- Clean, minimal UI

## Project Structure

```
lib/
├── main.dart                  # App entry point and route configuration
├── pages/
│   ├── loading.dart           # Loading screen — initializes the WorldTime service
│   ├── home.dart              # Home screen — displays time and navigation
│   └── choose_location.dart   # Location picker screen
└── services/
    └── world_time.dart        # WorldTime service — handles API calls and time parsing
```

## How It Works

1. On launch, the **Loading** screen initializes a `WorldTime` instance and calls `getTime()`.
2. `getTime()` makes a GET request to `https://worldtimeapi.org/api/timezone/{location}`, parses the response, and calculates the local time using the returned UTC offset.
3. The **Home** screen displays the fetched time and provides a button to navigate to the location picker.
4. The **Choose Location** screen (work in progress) will allow users to select from a list of supported locations.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/get-started/) SDK installed
- A device or emulator to run the app

### Installation

1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   cd my_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

| Package | Purpose |
|---|---|
| `http` | Making HTTP requests to the World Time API |

## API Reference

This app uses the **World Time API** (free, no key required).

- **Endpoint:** `GET https://worldtimeapi.org/api/timezone/{timezone}`
- **Example:** `https://worldtimeapi.org/api/timezone/Africa/Accra`
- **Key fields returned:** `datetime`, `utc_offset`

## Roadmap

- [ ] Complete the Choose Location screen with a selectable list of locations
- [ ] Persist the selected location across app sessions
- [ ] Display flag icons for each location
- [ ] Add error handling for failed or slow API requests
- [ ] Auto-refresh the displayed time at regular intervals

## License

This project is licensed under the MIT License.
