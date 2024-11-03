# 🎬 Movies List App

A mobile application that allows users to explore and search for top-rated movies from a JSON data source. Users can view detailed information about each movie and search by title.

## 🎯 Project Overview

This project is a practical exercise in handling and displaying JSON data within a mobile application. Users can discover popular movies, view additional details, and search for specific titles using a flexible search bar.

## ✨ Features

- ⭐ Display top-rated movies on the home screen, sorted by rating in descending order
- 📄 View detailed information about each movie by tapping on it
- 🔍 Search bar to find movies by name, with flexible matching (e.g., searching "vatar" returns "Avatar")

## 🛠️ Technologies Used

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=Dart&logoColor=white)

### 📦 Key Packages

- **http**: For loading JSON data (if fetching from a server)

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^latest_version
