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
  - Add tasks and mark them as completed.
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

----

## 🧩 Getting Started

### Prerequisites
- Install [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Have an Android or iOS device/emulator ready

### Run the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/mohamed-oraby10/day_task.git
   
2. Navigate to the folder:
    ```bash
   cd day_task


3. Install dependencies:
    ```bash
    flutter pub get


4. Run the app:
    ```bash
   flutter run

---
## 📸 Screenshots (Example placeholders)


## 🚀 Splash Screen

<p align="center">
  <img src="assets/screens/Screenshot_1760893647.png" alt="Splash Screen" width="30%" style="margin-right: 10px;">
</p>

---

## 🔑 Login Screen

<p align="center">
  <img src="assets/screens/Screenshot_1760889310.png" alt="Login Screen" width="30%" style="margin-right: 10px;">
</p>

---

## 🧾 Register Screen
<p align="center">
  <img src="assets/screens/Screenshot_1760889322.png" alt="Register Screen" width="30%" style="margin-right: 10px;">
   <img src="assets/screens/Screenshot_1760889433.png" alt="Register Screen" width="30%" style="margin-right: 10px;">
</p>


---

## 🏠 Home Screen

<p align="center">
  <img src="assets/screens/Screenshot_1760889582.png" alt="Home Screen" width="30%" style="margin-right: 10px;">
   <img src="assets/screens/Screenshot_1760890782.png" alt="Home Screen" width="30%" style="margin-right: 10px;">
  <img src="assets/screens/Screenshot_1760890803.png" alt="Home Screen" width="30%" style="margin-right: 10px;">
    <img src="assets/screens/Screenshot_1760891245.png" alt="Home Screen" width="30%" style="margin-right: 10px;">
</p>

---


## 🧠 Projects & Tasks
### create_new_project_screen

<p align="center">
  <img src="assets/screens/Screenshot_1760889617.png" alt="create_new_project Screen" width="30%" style="margin-right: 10px;">
    <img src="assets/screens/Screenshot_1760889637.png" alt="create_new_project Screen" width="30%" style="margin-right: 10px;">
    <img src="assets/screens/Screenshot_1760890645.png" alt="create_new_project Screen" width="30%" style="margin-right: 10px;">
</p>

---

### project_details_screen

<p align="center">
  <img src="assets/screens/Screenshot_1760890770.png" alt="project_details Screen" width="30%" style="margin-right: 10px;">
</p>

---

### create_new_task_screen

<p align="center">
  <img src="assets/screens/Screenshot_1760890702.png" alt="create_new_task Screen" width="30%" style="margin-right: 10px;">
    <img src="assets/screens/Screenshot_1760890710.png" alt="create_new_task Screen" width="30%" style="margin-right: 10px;">
    <img src="assets/screens/Screenshot_1760890716.png" alt="create_new_task Screen" width="30%" style="margin-right: 10px;">
</p>

---

### task_details_screen

<p align="center">
  <img src="assets/screens/Screenshot_1760894093.png" alt="task_details Screen" width="30%" style="margin-right: 10px;">
</p>

---

## 💬 Chat & Groups
## chat_screen
<p align="center">
  <img src="assets/screens/Screenshot_1760894822.png" alt="Profile Screen" width="30%" style="margin-right: 10px;">
</p>

---

## chat_group_screen

<p align="center">
  <img src="assets/screens/Screenshot_1760894768.png" alt="chat_group Screen" width="30%" style="margin-right: 10px;">
    <img src="assets/screens/Screenshot_1760890976.png" alt="chat_group Screen" width="30%" style="margin-right: 10px;">
  
</p>

---

### groupes_messages_screen

<p align="center">
  <img src="assets/screens/Screenshot_1760890846.png" alt="groupes_messages Screen" width="30%" style="margin-right: 10px;">
</p>

---

## 📨 Messages
### masseges_screen

<p align="center">
  <img src="assets\screens\Screenshot_1760894722.png" alt="masseges Screen" width="30%" style="margin-right: 10px;">
</p>

---

### new_message_screen

<p align="center">
  <img src="assets/screens/Screenshot_1760890954.png" alt="new_message Screen" width="30%" style="margin-right: 10px;">
   <img src="assets/screens/Screenshot_1760890960.png" alt="new_message Screen" width="30%" style="margin-right: 10px;">
   <img src="assets/screens/Screenshot_1760890968.png" alt="new_message Screen" width="30%" style="margin-right: 10px;">
</p>

---

## 📅 Schedule Screen

<p align="center">
  <img src="assets/screens/Screenshot_1760893321.png" alt="Schedule Screen" width="30%" style="margin-right: 10px;">
</p>


---

## 🔔 Notifications Screen

<p align="center">
  <img src="assets/screens/Screenshot_1760891227.png" alt="Notifications Screen" width="30%" style="margin-right: 10px;">
</p>


---


## 👤 Profile Screen

<p align="center">
  <img src="assets/screens/Screenshot_1760890792.png" alt="Profile Screen" width="30%" style="margin-right: 10px;">
</p>

--- 

## 🔮 Future Improvements

- 🔍 Add advanced search and filtering for projects and tasks.  
- 🌗 Implement multi-mode (Dark / Light).  
- 📱 Add push notifications for new messages, tasks, and updates.  
- 🗣️ Add **voice, image, and video sharing** inside team/group chats.  
- 🖼️ Allow team members to **change group icons** and manage group settings.  
- 🚪 Add the ability for users to **leave or delete groups**.  
- 🧩 Apply **MVVM architecture** throughout the entire project for better scalability and separation of concerns.  


---

## 👨‍💻 About the Developer

Developed by Mohamed Oraby
📫 Connect with me:

LinkedIn: https://www.linkedin.com/in/mohamedoraby/

GitHub: https://github.com/mohamed-oraby10
