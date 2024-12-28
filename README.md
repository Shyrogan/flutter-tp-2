# Flutter TP 2

Ce projet Flutter propose trois fonctionnalités principales accessibles depuis l'écran d'accueil :

1. **QCM avec Provider** – Une implémentation du QCM en utilisant le package **Provider**.
2. **QCM avec Bloc** – Une implémentation alternative du QCM en utilisant le package **Bloc**.
3. **Météo avec OpenWeatherMap** – Une fonctionnalité affichant la météo en utilisant l'API **OpenWeatherMap**.

---

## 🛠️ Getting Started

### 📌 Prérequis

1. Installez **Flutter** en suivant les [instructions officielles](https://docs.flutter.dev/get-started/install).
2. Assurez-vous d'avoir **un appareil physique** ou **un émulateur** configuré.
3. Récupérez une **clé API OpenWeatherMap** depuis [openweathermap.org](https://home.openweathermap.org/api_keys).

### 📥 Installation

Clonez le projet depuis GitHub :

```bash
git clone https://github.com/Shyrogan/flutter-tp-2.git
cd flutter-tp-2
```

Installez les dépendances :

```bash
flutter pub get
```

Ajoutez votre **clé API OpenWeatherMap** dans les variables d'environnement ou directement dans le code si nécessaire.

### 🚀 Exécution du projet

Lancez l'application sur un simulateur ou un appareil physique :

```bash
flutter run
```

Si plusieurs appareils sont connectés, sélectionnez-en un avec :

```bash
flutter devices
flutter run -d <device_id>
```

### 🧪 Tests

Exécutez les tests unitaires avec :

```bash
flutter test
```

---

## 📱 Navigation

- **Page d'accueil** : Affiche **trois boutons** permettant d'accéder aux différentes sections.
- **QCM Provider** : Implémentation du QCM avec **Provider**.
- **QCM Bloc** : Implémentation du QCM avec **Bloc**.
- **Météo** : Affichage de la météo en utilisant **OpenWeatherMap**.

---

## 🌤️ OpenWeatherMap API

Pour que la fonctionnalité météo fonctionne correctement, assurez-vous d’avoir une **clé API valide**.
