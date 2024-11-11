if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi
 
git diff --diff-filter=d --name-only $(git merge-base --fork-point origin/master) \
| grep "\.swift$" \
| grep -v "Flag\.swift$" \
| grep -v "Tests\|/Example\|/Generated\|/Resources\|/Pods" | while read filename; \
do
    swiftformat --config ../BabyFoodCareSwiftUI/SwiftFormat/rules.swiftformat "$filename";
done

PROJ=$(pwd)

for d in Pods/DevPodsLink/* ; do
    if [ -d "$d" ]; then
        cd "$d" || continue
        git diff --diff-filter=d --name-only $(git merge-base --fork-point origin/master) \
        | grep "\.swift$" \
        | grep -v "Flag\.swift$" \
        | grep -v "Tests\|/Example\|/Generated\|/Resources\|/Pods" | while read filename; \
        do
            swiftformat --config ../investment/raif.swiftformat "$PROJ/$d/$filename"; #
        done
        cd "$PROJ" || exit
    fi
done
