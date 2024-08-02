# Products app

The project is following the Clean Architecture pattern. The project is divided into 3 layers: data, domain, and presentation.
The different layers are separated by folders and each layer has its own dependencies.
They are grouped by modules (the different features of the app).

**Data Layer**: contains entities, the data sources (remote and local), and repository implementations.
**Domain Layer**: contains the use cases and repositoriy definitions.
**Presentation Layer**: contains the UI (pages and pages-specific widgets) and state.

The project is using flutter build_runner to generate the code for the services (using chopper) and the json_serializable to generate the code for the JSON parsing.

To generate the code for the services and the json_serializable, run the following command:

```bash
flutter pub run build_runner build
```

## How to run the app

1. Download the project or clone the repository.
2. Open the project in the IDE.
3. Restore the packages by running:
```bash
flutter pub get
```
4. Select a device.
5. Run the app by executing:
```bash
flutter run
```
