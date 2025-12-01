# 🚗 T-Rent - Car Rental Mobile Application

T-Rent is a modern, minimalistic car rental application built with Flutter and Supabase, focused on clean design, realistic rental logic, and a smooth user experience.

## 📱 Preview
<h3 align="center" >Light Theme ☀️</h3>
<p align="center">
  <img src="screenshots\light_home_screenshot_portrait.png" width="20%"/>
  <img src="screenshots\light_map_screenshot_portrait.png" width="20%"/>
  <img src="screenshots\light_details_screenshot_portrait.png" width="20%"/>
  <img src="screenshots\light_settings_screenshot_portrait.png" width="20%"/>
</p>
<h3 align="center" >Dark Theme 🌙</h3>
<p align="center">
  <img src="screenshots\dark_home_screenshot_portrait.png" width="20%"/>
  <img src="screenshots\light_map_screenshot_portrait.png" width="20%"/>
  <img src="screenshots\dark_details_screenshot_portrait.png" width="20%"/>
  <img src="screenshots\dark_settings_screenshot_portrait.png" width="20%"/>
</p>

## 🧠 About the Project

**T-Rent** allows users to browse available cars, select rental plans, choose dates, and manage their rental history.

It was developed to demonstrate:
<ul>
  <li>Clean and scalable architecture</li>
  <li>Real-world logic for date blocking and availability</li>
  <li>Smooth, modern UI/UX</li>
  <li>Backend integration with Supabase</li>
  <li>Interactive features</li>
</ul>

The main focus of the project is **simplicity, realism, and clarity** - both in the user experience and in the codebase.

## 🚀 Features

<ul>
  <li>🚘 Browse cars with full specifications</li>
  <li>🕐 Hourly / Daily / Weekly rental plans</li>
  <li>📆 Date range picker with blocked booked days</li>
  <li>🔊 Realistic engine rev sound for sports cars</li>
  <li>💰 Automatic total price & duration calculation</li>
  <li>📜 Rental history per user</li>
  <li>🔐 Supabase authentication</li>
  <li>🧱 Clean Architecture</li>
  <li>⚡ State management with Cubit</li>
  <li>🌙 Light & Dark theme support</li>
  <li>🌍 Multi-language ready</li>
</ul>

## 🛠 Tech Stack
<ul>
  <li>Flutter - UI Framework</li>
  <li>Supabase - Authentication, Database, Storage</li>
  <li>Cubit - State management</li>
  <li>Just Audio - Engine sound feature</li>
  <li>Cached Network Image - Image caching</li>
  <li>Clean Architecture / MVVM principles</li>
</ul>

## 🏗 Architecture
T-Rent follows a **Modular + Clean Architecture** approach with strict separation of concerns:

<ul>
  <li><code>core/</code> → All data & domain logic</li>
  <li><code>features/</code> → All UI and state management divided by feature</li>
  <li><code>common/</code> → Shared app-wide tools & components</li>
</ul>

Each feature is self-contained, scalable, and connected to the main business logic through well-defined interfaces.

## 📁 Folder Structure
<pre><code>
lib/
 ├── src/
 │   ├── common/
 │   │   ├── constants/          # App constants
 │   │   ├── cubit_scope/        # Scope
 │   │   ├── di/                 # Dependency injection
 │   │   ├── localization/       # l10n, translations
 │   │   ├── navigation/         # App router & navigation logic
 │   │   ├── shared_cubits/      # Global cubits
 │   │   ├── theme/              # Light & Dark theme configs
 │   │   ├── utils/              # Helpers / extensions
 │   │   └── widgets/            # Reusable UI components
 │
 │   ├── core/                   # Data + Domain
 │   │   ├── data/
 │   │   │   ├── data_source/
 │   │   │   │   ├── i_data_source/   # Data source interfaces
 │   │   │   │   └── data_source.dart # Supabase / API / network sources
 │   │   │   ├── mappers/             # Model mappers
 │   │   │   └── repositories/        # Repository implementations
 │   │   │
 │   │   └── domain/
 │   │       ├── entities/       # Business models
 │   │       ├── interactors/    # Use-cases / business logic
 │   │       ├── interfaces/     # Repository contracts
 │   │       └── utils/          # Domain helpers
 │
 │   └── features/               # UI + State Management
 │       └── each_feature/
 │           ├── cubit/
 │           ├── pages/
 │           └── widgets/
 │
 └── main.dart                   # Application entry point
</code></pre>

## 📌 Current Status

✅ Core features completed

🔧 Minor refinements in progress

🚧 Improvements planned

## 🔮 Planned Features
<ul>
  <li>🌎 Multi-currency support</li>
  <li>🧑‍💼 Admin dashboard</li>
  <li>⭐ User review & rating system</li>
  <li>📊 Advanced analytics</li>
  <li>🔔 Push notifications</li>
  <li>🚘 Car comparison feature</li>
</ul>

## 👨‍💻 About the Developer
<p>Developed by Tash</p>
<p>Flutter Developer & Tech Enthusiast</p>

<p>📩 Email: tasm86688@gmail.com</p>
<p>💼 LinkedIn: <a href="https://linkedin.com/in/muhammed-taş-00a01619b/" target="_blank">click</a></p>

## ⚠️ Disclaimer

This application was created for **demonstration and portfolio purposes only**.

All cars, brands, prices, locations, addresses, and data displayed in the app are **fictional or used as examples**.  
Any resemblance to real companies or services is purely coincidental.
