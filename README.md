# Screenshots

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/c769e596-99df-4f26-87cb-a380e9ea85f2" width="250"></td>
    <td><img src="https://github.com/user-attachments/assets/f60be3d5-3abe-44cf-bd23-631ed2f5bb48" width="250"></td>
    <td><img src="https://github.com/user-attachments/assets/4536656e-e5f2-42bd-a5fe-fa961502cf19" width="250"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/363b7996-7b7b-4a01-a180-7abb13ebb8da" width="250"></td>
    <td><img src="https://github.com/user-attachments/assets/bede7d1d-2d93-4e6a-9b9c-1109722b62e1" width="250"></td>
    <td><img src="https://github.com/user-attachments/assets/6a92df8f-cb22-472a-9571-58b06ed309d3" width="250"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/477cedd1-c8d2-4468-8175-a126229facd3" width="250"></td>
  </tr>
</table>
link of demo  :   https://drive.google.com/drive/folders/1GJ8M6njDgaOB1xWd-1NYUjZ1mVfsNuOR?usp=sharing
---

## 🧩 Layered Architecture

### 1️⃣ Data Layer
- Manages APIs, local databases, and repositories.
- Converts raw data (JSON, DB rows) into Dart models.

### 2️⃣ Domain Layer
- Defines business rules with **entities** and **repository contracts**.
- Pure Dart → independent of UI/frameworks.

### 3️⃣ Presentation Layer
- Flutter UI + state management (Bloc, Cubit, Provider, Riverpod, etc.).
- Handles user interactions and displays data.

---

## ✅ Benefits of This Structure

| Feature | Pros | Cons |
|---------|------|------|
| **Clean Architecture** | Separation of concerns | Requires more boilerplate |
| **Feature-based modules** | Each feature is independent | Needs discipline to maintain |
| **Testability** | Easy to test domain/data layers | More setup required |
| **Reusable core** | Common utilities across app | Core can become cluttered |



