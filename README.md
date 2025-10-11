# 🗂️ Flutter GetX Folder Structure Template

This project provides a **recommended folder architecture** for Flutter apps using **GetX** for state management, navigation, and dependency injection.

The structure is modular, scalable, and clean — following best practices for medium to large-scale projects.

---

```bash
mkdir -p lib/app/modules/home/{bindings,controllers,views,widgets} \
lib/app/modules/auth/{bindings,controllers,views,widgets} \
lib/app/data/{models,providers,services,repositories} \
lib/app/routes \
lib/app/themes \
lib/app/utils

```

## 📁 Folder Structure

```text
lib/
├── app/
│   ├── modules/
│   │   ├── home/
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   ├── views/
│   │   │   └── widgets/
│   │   ├── auth/
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   ├── views/
│   │   │   └── widgets/
│   ├── data/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── services/
│   │   └── repositories/
│   ├── routes/
│   ├── themes/
│   └── utils/
├── main.dart
└── generated_plugin_registrant.dart
