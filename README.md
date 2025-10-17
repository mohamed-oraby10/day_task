# Day Task App

A powerful Flutter application for managing daily projects, tasks, and team collaborations — featuring real-time chat, project tracking, and Firebase integration.

---

## 🧠 Overview

**Day Task** helps users create and manage projects with assigned tasks, team members, and deadlines.  
The app provides a full task management system with progress tracking and a real-time chat feature for seamless team communication.

This project demonstrates:
- Clean and modular architecture (Cubit + Hive + Firebase).
- Local and cloud data synchronization.
- Scalable and responsive UI with `flutter_screenutil`.

---

## 🚀 Features

- 📋 **Projects & Tasks**
  - Create new projects with title, details, and team members.
  - Add, update, and remove tasks.
  - Track completed and ongoing tasks with progress indicators.
  - Store tasks locally using **Hive**.

- 💬 **Real-Time Chat**
  - One-to-one and group messaging.
  - “Seen” status for messages.
  - Online/offline status tracking via Firebase Realtime Database.

- 👥 **Team Collaboration**
  - Add and manage project team members.
  - Assign tasks to specific members.
  - Show active projects per user.

- 🌐 **Firebase Integration**
  - **Firebase Auth** for authentication.
  - **Cloud Firestore** for chat and data syncing.
  - **Realtime Database** for presence tracking.

- 🎨 **Responsive & Modern UI**
  - Uses `flutter_screenutil` for full responsiveness.
  - Custom reusable widgets for forms, dialogs, buttons, and lists.
  - Smooth animations and progress indicators.

---

## 🛠️ Tech Stack

- **Framework:** Flutter (v3.7+)  
- **Language:** Dart  
- **State Management:** Cubit / Bloc and Provider
- **Local Storage:** Hive  
- **Backend Services:** Firebase (Auth, Firestore, Realtime Database, Storage)  
- **UI Tools:** Flutter ScreenUtil, Modal Progress HUD NSN  
- **Icons & Assets:** SVGs, FontAwesome Icons  

---

## ⚙️ Getting Started

### Prerequisites
- Install [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Configure Firebase project
- Create required collections:
  - `users`
  - `chats`
  - `groups`

---

## 📸 Screenshots

### Run
```bash
flutter pub get
flutter run


🔮 Future Improvements

🔍 Add advanced search and filtering for projects and tasks.

🌗 Implement dark mode.

📱 Add push notifications.

💾 Cloud backup for Hive data.

🗂️ Export project reports as PDF.



👨‍💻 About the Developer

Developed by Mohamed Oraby

📫 Connect with me on:

LinkedIn: https://www.linkedin.com/in/mohamedoraby/

GitHub: https://github.com/mohamed-oraby10

