# Changelog

All notable changes to this project will be documented in this file.

## [1.0.2] - 2026-02-13

### ⚠️ Temporary Technical Adjustments
- **Route Page**: Temporarily replaced with a Loading Indicator due to AGP 9.0+ incompatibility with the `mapbox_maps_flutter` package.
- **Location Services**: Disabled temporarily pending plugin updates for Android Gradle Plugin 9 compatibility.
- **Sport Mode (Motor Rev)**: Feature currently unavailable due to build-system conflicts affecting sensor readouts.

### Added
- Confirmation Page after successful booking.
- Functional logic for "Favorite Cars" (previously UI-only).

### Changed
- **UI Refresh**: Redesigned Car Details and Booking pages.
- **UX Update**: Moved date and time selection from Car Details Page to the Booking Page.
- Updated UI for Car History items and vector imagery for Car Specs.
- Improved **AuthFlow**: Users are now navigated immediately upon successful sign-in.

## [1.0.0] - 2025-12-01
- Initial release.