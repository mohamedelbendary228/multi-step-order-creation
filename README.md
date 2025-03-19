# Order Creation

 A Flutter app that guides users through a multi-step order
creation process. allow users to enter customer information,
specify package details, review their submissions before completing the order, 
And view a list of orders when entering the app.

<br/>
<div>
  &emsp;&emsp;
  <img src="https://github.com/user-attachments/assets/208a2b6a-ce0a-4eec-b5d8-daf3e8b9a16a" alt="Light theme" width="220">
  &emsp;&emsp;&emsp;
  <img src="https://github.com/user-attachments/assets/8489da44-d701-48e5-941e-5e8bfdab5318" alt="Dark theme" width="220">  
  &emsp;&emsp;&emsp;
  <img src="https://github.com/user-attachments/assets/ca81f82a-d962-4911-a9fb-75b6fb0b6183" alt="Dark theme" width="220">  
</div>
<br/>

<br/>
<div>
  &emsp;&emsp;
  <img src="https://github.com/user-attachments/assets/66639ab9-2247-4847-ad9e-83ad192d931e" alt="Light theme" width="220">
  &emsp;&emsp;&emsp;
  <img src="https://github.com/user-attachments/assets/cf8766f5-4e8d-453d-b87c-b9c923d135bd" alt="Dark theme" width="220">  
  &emsp;&emsp;&emsp;
  <img src="https://github.com/user-attachments/assets/5c567c70-2f8b-412c-a1f0-ace312c16e18" alt="Dark theme" width="220">  
</div>
<br/>

# Demo Url
https://drive.google.com/file/d/10KwZ--xk0AIm9U1pL4eTX8uU5bNFoxlX/view?usp=sharing


# Set up

```
git clone https://github.com/mohamedelbendary228/multi-step-order-creation.git
```

# Flutter version

```
3.24.5
```

# First Run

```
flutter clean
flutter pub get
```

## Feature Set ✨

* [x] Add customer information
* [x] Specify package details
* [x] Select a payment method (cash on delivery, Credit Card, Pay Later)
* [x] Review submission before completing the order
* [x] View List of created orders

## 📂 Folder Structure

This project follows the **Clean Architecture** pattern in Flutter applications, ensuring a scalable, maintainable, and testable project structure.

```
lib/
│── core/                     # Common utilities, constants, and shared logic
│   ├── errors/               # Error handling classes
│   ├── resources/            # Contains app assets, colors, theme
│   ├── usecases/             # Base use case classes
│   ├── utils/                # Helper functions and utilities
│   ├── constants/            # App-wide constants
│   ├── widgets/              # Reusable core widgets
│   ├── entities/             # shared Business entities
│   ├── models/               # shared Data models
│ 
│── features/                 # Application features (modules)
│   ├── feature_name/         # Example feature module
│   │   ├── data/             # Data layer
│   │   │   ├── models/       # Data models
│   │   │   ├── repositories/ # Repository implementations
│   │   │   ├── sources/      # Remote and local data sources
│   │   ├── domain/           # Domain layer
│   │   │   ├── entities/     # Business entities
│   │   │   ├── repositories/ # Repository abstractions
│   │   │   ├── usecases/     # Use case definitions
│   │   ├── presentation/     # Presentation layer (UI + State Management)
│   │   │   ├── cubit/        # Cubit state management
│   │   │   ├── pages/        # UI screens
│   │   │   ├── widgets/      # Reusable UI components
│
│── routes/                   # App-routes
│── main.dart                 # Application entry point
```

## 🏗️ Layers Explanation

### 1. **Data Layer**
- Responsible for fetching and storing data.
- Includes models, repositories (implementation), and data sources (API, local storage, etc.).

### 2. **Domain Layer**
- Contains business logic and rules.
- Defines **entities** (core app models) and **use cases** (application logic).
- Uses repository interfaces for dependency inversion.

### 3. **Presentation Layer**
- Manages UI components and user interactions.
- Uses state management solutions like **Cubit**.
- Contains UI screens, widgets, and state management logic.

## 🛠️ Technologies Used
- **State Management:** Cubit
- **Networking:** simulate an API using ```Future.delayed()```
- **Dependency Injection:** GetIt
- **Local Storage:** Hive

## ✅ Benefits of Clean Architecture
- **Separation of Concerns**: Divides code into independent modules.
- **Scalability**: Easy to add new features.
- **Testability**: Each layer can be unit tested independently.
- **Maintainability**: Reduces code coupling and improves readability.

---

## 📞 Contact Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/mohamed-elbendary/)
[![Email](https://img.shields.io/badge/Email-Contact%20Me-red?logo=gmail)](albendary.com@gmail.com)
[![X](https://img.shields.io/badge/Follow-black?logo=x&logoColor=white)](https://x.com/mab_228)

---


![Flutter](https://img.shields.io/badge/Flutter-3.24.5-blue?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.5.0-blue?logo=dart&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Architecture-Clean-blueviolet)
![License](https://img.shields.io/badge/License-MIT-green)
