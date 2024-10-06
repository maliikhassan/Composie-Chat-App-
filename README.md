# Chat App

This is a **basic real-time chat application** built using **Flutter** and **Firebase** for user authentication and data storage. The app ensures secure, private conversations between users.

## Features

- **Splash Screen**: Displays an initial loading screen when the app starts.
- **Login Page**: Allows users to log in using their credentials.
- **Signup Page**: Enables new users to create an account.
- **Users Display Page**: Shows a list of all registered users available for chatting.
- **Chat Page**: Facilitates real-time communication between users. Each chat is private, with messages stored securely in Firestore.
- **Account Info Page**: Displays user account information.

  ![Chat App](https://github.com/user-attachments/assets/1e399577-91f5-407b-a039-6ccafb5125ff)


## Security

- Each chat room has a **unique, secure, and protected ID**.
- Messages are stored only in the Firestore database and are only accessible between the two users involved in the conversation.
- **Firebase Authentication** is used to ensure secure sign-up and log-in processes.

## Tech Stack

- **Flutter**: A cross-platform framework for building natively compiled applications for mobile.
- **Firebase Authentication**: Manages user sign-in and sign-up securely.
- **Firebase Firestore**: A NoSQL cloud database for storing chat messages and user information.

## Installation

To run this project locally, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/chat-app.git
    ```

2. Navigate to the project directory:

    ```bash
    cd chat-app
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Set up Firebase for the project:

    - Create a new project in Firebase.
    - Add Firebase to your Flutter app following the [official Firebase documentation](https://firebase.flutter.dev/docs/overview/).
    - Enable **Authentication** and **Firestore** in the Firebase console.
    - Download the `google-services.json` file and place it in the `android/app` directory.

5. Run the app:

    ```bash
    flutter run
    ```

## Firebase Setup

Make sure to set up Firebase correctly with:

- **Firebase Authentication**: Enable Email/Password sign-in method.
- **Firebase Firestore**: Create collections for users and chats.

## Folder Structure

Here is a simplified folder structure of the project:

```

lib/
│
├── screens/
│   ├── splash_screen.dart
│   ├── login_page.dart
│   ├── signup_page.dart
│   ├── users_display_page.dart
│   ├── chat_page.dart
│   ├── account_info_page.dart
│
├── services/
│   ├── firebase_auth_service.dart
│   ├── firestore_service.dart
│
├── models/
│   ├── user_model.dart
│   ├── chat_model.dart
│
└── main.dart
```
