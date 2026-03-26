# Session 3 – Proyecto Base Flutter: Clean Architecture

> **Formación Flutter · Entregable 1**  
> Este repositorio es el proyecto de referencia para la formación de Flutter con Clean Architecture. Los estudiantes deben usar esta estructura como base para desarrollar sus propios proyectos.

---

## Tabla de contenidos

1. [¿Qué es Clean Architecture?](#1-qué-es-clean-architecture)
2. [Clean Architecture en Flutter](#2-clean-architecture-en-flutter)
3. [Manejo de estado: Provider y la analogía con BLoC](#3-manejo-de-estado-provider-y-la-analogía-con-bloc)
4. [Estructura del proyecto](#4-estructura-del-proyecto)
5. [Instrucciones de ejecución](#5-instrucciones-de-ejecución)
6. [Flavors (Entornos)](#6-flavors-entornos)
7. [Historias de usuario y entregables](#7-historias-de-usuario-y-entregables)
8. [Autoestudio requerido](#8-autoestudio-requerido)
9. [Dependencias](#9-dependencias)

---

## 1. ¿Qué es Clean Architecture?

Clean Architecture (Arquitectura Limpia) es un conjunto de principios de diseño propuestos por Robert C. Martin ("Uncle Bob") que busca separar las responsabilidades del software en capas bien definidas, de forma que:

- Las **reglas de negocio** no dependan de frameworks, bases de datos ni interfaces de usuario.
- El código sea **testeable**, **mantenible** y **escalable**.
- Los detalles de implementación (UI, red, almacenamiento) puedan cambiar sin afectar al núcleo de la aplicación.

> **Regla de dependencia:** las capas externas pueden depender de las internas, pero **nunca** al revés.

Las capas principales son:

| Capa | Responsabilidad |
|---|---|
| **Domain** | Entidades y casos de uso (reglas de negocio puras) |
| **Data** | Repositorios, modelos, fuentes de datos (APIs, BD) |
| **Presentation** | UI, widgets, manejo de estado |

---

## 2. Clean Architecture en Flutter

La siguiente imagen muestra cómo se aplica Clean Architecture en un proyecto Flutter:

![Clean Architecture en Flutter](https://media2.dev.to/cdn-cgi/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Ff4oglwstonjhbjlpb03x.png)

### Cómo se mapea al proyecto

```
feature/
├── data/                  ← Capa de Datos
│   ├── data_sources/      │   Fuentes remotas o locales (API, BD)
│   ├── models/            │   DTOs / modelos de serialización JSON
│   └── repositories/      │   Implementaciones concretas del repositorio
│
├── domain/                ← Capa de Dominio (núcleo de negocio)
│   ├── entities/          │   Objetos de dominio puros (sin JSON, sin Flutter)
│   ├── repositories/      │   Contratos (interfaces/abstract classes)
│   └── use_cases/         │   Lógica de negocio (un use case = una acción)
│
└── presentation/          ← Capa de Presentación
    ├── state/             │   Provider / Notifier (manejo de estado)
    ├── views/             │   Pantallas completas
    └── widgets/           │   Widgets reutilizables de la feature
```

### Flujo de datos

```
Vista (View)
  │  llama a
  ▼
Provider (State)
  │  ejecuta
  ▼
Use Case (Domain)
  │  usa contrato de
  ▼
Repository (Domain – interfaz)
  │  implementado por
  ▼
Repository Impl (Data)
  │  consume
  ▼
Data Source (Data)  →  API / Base de datos
```

---

## 3. Manejo de estado: Provider y la analogía con BLoC

En este proyecto usamos **Provider** como manejador de estado. Sin embargo, es importante conocer el patrón **BLoC (Business Logic Component)** porque ayuda a entender los conceptos subyacentes que usamos con Provider.

La siguiente imagen muestra la arquitectura BLoC completa:

![Arquitectura BLoC](https://bloclibrary.dev/_astro/bloc_architecture_full.CYn-T9Ox_1BHcjU.webp)

### Analogía entre BLoC y Provider

| Concepto BLoC | Equivalente con Provider | Descripción |
|---|---|---|
| `Event` | Llamada a método del Provider | Acción del usuario que dispara un cambio |
| `Bloc / Cubit` | `ChangeNotifier` (Provider) | Contiene la lógica y el estado |
| `State` | Propiedades del `ChangeNotifier` | Estado actual expuesto a la UI |
| `BlocBuilder` | `Consumer` / `context.watch()` | Widget que se reconstruye al cambiar el estado |
| `BlocProvider` | `ChangeNotifierProvider` | Inyección del manejador de estado en el árbol |

> **¿Por qué estudiar BLoC si usamos Provider?**  
> BLoC define explícitamente tres conceptos: *Events*, *Business Logic* y *States*. Aunque Provider no los separa de forma tan estricta, cuando diseñamos nuestros `ChangeNotifier` correctamente estamos aplicando exactamente esa misma filosofía. Entender BLoC hace que tu Provider sea más limpio y predecible.

---

## 4. Estructura del proyecto

```
session_3/
├── lib/
│   ├── main.dart               # Bootstrap común (configuración Material 3 + localización)
│   ├── main_dev.dart           # Entry point: entorno Development
│   ├── main_prod.dart          # Entry point: entorno Production
│   ├── app_colors.dart         # Paleta de colores de la aplicación
│   │
│   ├── core/                   # Núcleo transversal (no pertenece a ninguna feature)
│   │   ├── assets.dart         # Constantes de rutas de assets
│   │   ├── api/                # Cliente HTTP centralizado (Dio + interceptores)
│   │   ├── environment/        # Configuración de flavors (dev / prod)
│   │   │   └── env.dart
│   │   └── widgets/            # Widgets globales reutilizables
│   │
│   ├── features/               # Funcionalidades de negocio
│   │   ├── login/              # Feature: Autenticación
│   │   │   ├── data/
│   │   │   │   ├── data_sources/
│   │   │   │   │   └── remote_authetication_data_source.dart
│   │   │   │   ├── models/
│   │   │   │   │   ├── user_model.dart
│   │   │   │   │   └── user_password_model.dart
│   │   │   │   └── repositories/
│   │   │   │       └── authentication_repository_impl.dart
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   └── user.dart
│   │   │   │   ├── repositories/
│   │   │   │   │   └── authentication_repository.dart  ← contrato/interfaz
│   │   │   │   └── use_cases/
│   │   │   │       ├── login_use_case.dart
│   │   │   │       └── log_out_use_case.dart
│   │   │   └── presentation/
│   │   │       ├── state/
│   │   │       │   └── login_provider.dart
│   │   │       ├── views/
│   │   │       │   ├── login_view.dart
│   │   │       │   ├── login_view_provider.dart
│   │   │       │   ├── welcome_view.dart
│   │   │       │   ├── register_view.dart
│   │   │       │   └── password_recovery_view.dart
│   │   │       └── widgets/
│   │   │
│   │   ├── accounts/           # Feature: Cuentas bancarias
│   │   │   ├── domain/
│   │   │   │   └── entities/
│   │   │   └── presentation/
│   │   │       └── widgets/
│   │   │
│   │   └── shared/             # Widgets y utilidades compartidos entre features
│   │
│   ├── l10n/                   # Internacionalización (i18n)
│   └── system_design/          # Sistema de diseño / design tokens
│
├── assets/                     # Recursos estáticos (imágenes, fuentes, iconos)
├── env_dev.json                # Variables de entorno: Development
├── env_prod.json               # Variables de entorno: Production
├── analysis_options.yaml       # Reglas de linting
└── pubspec.yaml
```

---

## 5. Instrucciones de ejecución

### Requisitos previos

- Flutter SDK `^3.10.7` o superior  
- Dart SDK incluido en Flutter  
- Un emulador o dispositivo físico conectado

Verificar la instalación:

```bash
flutter doctor
```

### Clonar e instalar dependencias

```bash
git clone <url-del-repositorio>
cd session_3
flutter pub get
```

### Ejecutar la aplicación

El proyecto tiene dos entornos. **Siempre se debe especificar el entry point**; nunca se ejecuta `lib/main.dart` directamente.

**Entorno de desarrollo:**

```bash
flutter run -t lib/main_dev.dart
```

**Entorno de producción:**

```bash
flutter run -t lib/main_prod.dart
```

### Compilar para release

```bash
# Android
flutter build apk -t lib/main_prod.dart --release

# iOS
flutter build ios -t lib/main_prod.dart --release
```

### Ejecutar el linter

```bash
flutter analyze
```

---

## 6. Flavors (Entornos)

La configuración de entornos se maneja mediante archivos JSON en la raíz del proyecto:

| Archivo | Entorno |
|---|---|
| `env_dev.json` | Development |
| `env_prod.json` | Production |

Cada archivo contiene variables como `apiUrl`, `apiKey` y `appName`. La clase `Env` en `lib/core/environment/env.dart` carga el archivo correspondiente al iniciar la aplicación según el entry point usado.

```json
// Ejemplo de env_dev.json
{
  "appName": "Session 3 Dev",
  "apiUrl": "https://api.dev.example.com",
  "apiKey": "dev-key-123"
}
```

> **Importante:** Los archivos de entorno **no deben subirse al repositorio** en proyectos reales (agregar al `.gitignore`). En esta formación se incluyen como referencia.

---

## 7. Historias de usuario y entregables

### HU 1.1 – Configuración profesional del proyecto

> *Como desarrollador, quiero configurar un proyecto Flutter con estándares profesionales para asegurar calidad y mantenibilidad desde el inicio.*

**Criterios de aceptación**
- [x] Proyecto Flutter inicializado correctamente
- [x] Uso de Material 3 (`ThemeData` configurado en `main.dart`)
- [x] Linter configurado (`analysis_options.yaml` con `flutter_lints`)
- [x] Estructura base de carpetas definida (`core/`, `features/`, `l10n/`, `system_design/`)
- [x] Internacionalización (i18n) con `flutter_localizations`
- [x] Flavors de entorno (`env_dev.json` / `env_prod.json`) con clase `Env`

**Entregables**
- [x] Repositorio inicial en Git
- [x] README con instrucciones de ejecución *(este documento)*

---

### HU 1.2 – Navegación base de la aplicación

> *Como usuario, quiero navegar entre las principales secciones de la app bancaria.*

**Criterios de aceptación**
- [ ] Sistema de navegación configurado con `Navigator`
- [ ] Pantallas base creadas:
  - [x] Login (`login_view.dart`)
  - [x] Bienvenida (`welcome_view.dart`)
  - [x] Registro (`register_view.dart`)
  - [x] Recuperación de contraseña (`password_recovery_view.dart`)
  - [ ] Dashboard
  - [ ] Transferencias
  - [ ] Historial
  - [ ] Configuración

**Entregables**
- [ ] Sistema de navegación entre todas las pantallas implementado
- [ ] Pantallas base completas

---

### HU 1.3 – Cliente HTTP y manejo de errores

> *Como desarrollador, quiero un cliente HTTP reutilizable para consumir APIs externas.*

**Criterios de aceptación**
- [ ] Cliente HTTP implementado en `lib/core/api/` usando **Dio**
- [ ] Interceptores configurados (headers, logging, manejo de tokens)
- [ ] Modelo de errores centralizado con excepciones personalizadas
- [ ] Data sources usan el cliente HTTP centralizado (actualmente usan lógica simulada)

**Entregables**
- [ ] Cliente HTTP con interceptores en `core/api/`
- [ ] Clases de excepción personalizadas (e.g., `NetworkException`, `UnauthorizedException`)

---

## 8. Autoestudio requerido

Los siguientes temas **no se cubrirán en clase** pero son necesarios para completar las historias de usuario. Cada estudiante debe investigarlos de forma independiente:

### Navegación con Navigator

Flutter usa `Navigator` para gestionar la pila de pantallas. Los conceptos clave que debes dominar son:

- `Navigator.push()` y `Navigator.pop()` — navegar hacia adelante y hacia atrás
- `Navigator.pushReplacement()` — reemplazar la pantalla actual (útil tras login)
- `Navigator.pushNamedAndRemoveUntil()` — limpiar toda la pila (útil al cerrar sesión)
- Uso de `routes` nombradas vs. navegación directa con `MaterialPageRoute`

**Recurso oficial:** https://docs.flutter.dev/ui/navigation

---

### HTTP con Dio y excepciones personalizadas

**Dio** es la librería HTTP recomendada para Flutter en proyectos profesionales. El flujo esperado en este proyecto es:

```
Data Source
  └── usa DioClient (core/api/)
        └── Dio con Interceptores
              └── lanza excepciones personalizadas si falla
                    └── capturadas en el Repository Impl
                          └── propagadas como errores de dominio al Use Case
```

Temas a investigar:

1. Instalar Dio: `flutter pub add dio`
2. Crear una instancia base de Dio con `BaseOptions` (baseUrl, headers, timeout)
3. Implementar `Interceptor` para agregar headers de autorización o loggear requests
4. Crear clases de excepción personalizadas:

```dart
// Ejemplo de excepción personalizada
class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  const NetworkException({required this.message, this.statusCode});
}

class UnauthorizedException extends NetworkException {
  const UnauthorizedException() : super(message: 'No autorizado', statusCode: 401);
}
```

5. Capturar `DioException` y convertirla a tu excepción personalizada

**Recurso oficial Dio:** https://pub.dev/packages/dio

---

## 9. Dependencias

| Paquete | Versión | Propósito |
|---|---|---|
| `flutter` | SDK | Framework principal |
| `flutter_localizations` | SDK | Internacionalización |
| `intl` | `^0.20.2` | Formato de fechas y números |
| `provider` | `^6.0.5` | Manejo de estado reactivo |
| `flutter_lints` | `^6.0.0` | Reglas de linting |

> **Pendiente por los estudiantes:** agregar `dio` para el cliente HTTP (HU 1.3).

---

## Créditos

Proyecto de formación desarrollado como material de ejemplo para la sesión 3 del curso de Flutter con Clean Architecture.
