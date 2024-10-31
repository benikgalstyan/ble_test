g:
	make c
	make a
	make b
	make p
	make pod

b:
	 dart run build_runner build --delete-conflicting-outputs

a:
	fluttergen -c pubspec.yaml

p:
	 flutter pub get

c:
	 flutter clean

cg:
	 flutter clean
	 flutter pub

cr:
	 flutter pub cache repair

make icons:
	 dart run flutter_launcher_icons

make splash:
	 dart run flutter_native_splash:create
