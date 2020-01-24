# kobe_tmdb_viewer

This app depends on code generation libraries (Json code generation and MobX)
In order to build you must run and keep running the build_runner
flutter packages pub run build_runner watch --delete-conflicting-outputs

The app uses MobX for state management.

The App uses the following libraries:
	intl: // Datetime formatting
	connectivity: // check if internet is available
	json_annotation: // json code generation and annotation
	dio: // advanced http client for Dart
	dio_retry: // implements automatic retry for Dio library
	get_it: // Service Locator service, alternative for dependency injection for flutter
	font_awesome_flutter: // Icons library
	mobx: // State management library
	flutter_mobx: 
	mobx_codegen: 
	pedantic: // Dart lints for coding and static analysis
	flutter_native_splash: // Generator for splash screen
