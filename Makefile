gen:
	@tuist generate --no-open
	@brew install swiftformat

start:
	@open BabyFoodCare.xcworkspace

clean:
	@rm -rf ~/Library/Developer/Xcode/DerivedData/BabyFoodCareSwiftUI*
