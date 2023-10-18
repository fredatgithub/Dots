cd ../src/
echo "Building Dots for macOS x64"
dotnet msbuild -t:BundleApp -property:Configuration=Release -p:UseAppHost=true -p:RuntimeIdentifier=osx-x64
echo "Building Dots for macOS arm64"
dotnet msbuild -t:BundleApp -property:Configuration=Release -p:UseAppHost=true -p:RuntimeIdentifier=osx-arm64

echo "Prepare App Bundle for arm64"
rm bin/Release/net8.0-macos/osx-arm64/publish/Dots.app/Contents/MacOS/*.pkg
cp Assets/AppIcon.icns bin/Release/net8.0-macos/osx-arm64/publish/Dots.app/Contents/Resources/
cp -Rf bin/Release/net8.0-macos/osx-arm64/Dots.app/Contents/MacOS bin/Release/net8.0-macos/osx-arm64/publish/Dots.app/Contents
cp -Rf bin/Release/net8.0-macos/osx-arm64/Dots.app/Contents/MonoBundle bin/Release/net8.0-macos/osx-arm64/publish/Dots.app/Contents
cp bin/Release/net8.0-macos/osx-arm64/Dots.app/Contents/PkgInfo bin/Release/net8.0-macos/osx-arm64/publish/Dots.app/Contents/

echo "Prepare App Bundle for x64"
rm bin/Release/net8.0-macos/osx-x64/publish/Dots.app/Contents/MacOS/*.pkg
cp Assets/AppIcon.icns bin/Release/net8.0-macos/osx-x64/publish/Dots.app/Contents/Resources/
cp -Rf bin/Release/net8.0-macos/osx-x64/Dots.app/Contents/MacOS bin/Release/net8.0-macos/osx-x64/publish/Dots.app/Contents
cp -Rf bin/Release/net8.0-macos/osx-x64/Dots.app/Contents/MonoBundle bin/Release/net8.0-macos/osx-x64/publish/Dots.app/Contents
cp bin/Release/net8.0-macos/osx-x64/Dots.app/Contents/PkgInfo bin/Release/net8.0-macos/osx-x64/publish/Dots.app/Contents/
