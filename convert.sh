#!/bin/bash
# Copy & Convert Weather project into something less obvious

# Step 1: Clean, Create & Copy files to 'converted' folder
echo "Cleaning up"
rm -rf ./converted

echo "Creating directories"
if [ ! -d ./converted ]; then
  mkdir -p ./converted;
fi
if [ ! -d ./converted/weather ]; then
  mkdir -p ./converted/weather;
fi

echo "Copying directories"
cp -r ./Cheat\ Engine ./DBKKernel ./dbvm ./lua ./DBVM\ UEFI ./converted

cd ./converted

mv ./Cheat\ Engine ./DBKKernel ./dbvm ./lua ./DBVM\ UEFI ./weather

cd ./weather

# Step 2: Remove files
rm Cheat\ Engine/images/celogo.png Cheat\ Engine/cheatengine.ico

# Step 3: Rename all files with variations of strings
echo "Converting file names"
find . -name "Cheat Engine Icons" -exec rename 's|Cheat Engine Icons|WeatherIcons|' {} +
find . -name "Cheat Engine*" -exec rename 's|Cheat Engine|Weather|' {} +
find . -name "CheatEngine*" -exec rename 's|CheatEngine|Weather|' {} +
find . -name "Cheat engine*" -exec rename 's|Cheat engine|weather|' {} +
find . -name "cheat engine*" -exec rename 's|cheat engine|weather|' {} +
find . -name "cheat Engine*" -exec rename 's|cheat Engine|weather|' {} +
find . -name "cheatengine*" -exec rename 's|cheatengine|weather|' {} +
find . -name "cheatEngine*" -exec rename 's|cheatEngine|weather|' {} +

# Step 4: Replace all variations of strings
echo "Converting file content"
find . -type f -print0 | xargs -0 perl -pi -e 's/CHEATENGINE/WEATHER/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/Cheat\ Engine/Weather/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/CheatEngine/Weather/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/Cheat\ engine/Weather/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/Cheatengine/Weather/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/cheat\ engine/weather/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/cheat\ Engine/weather/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/cheatengine/weather/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/cheatEngine/weather/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/celogo/weatherlogo/g'
find . -type f -print0 | xargs -0 perl -pi -e 's/Weather\ 7.1/Weather/g'

# Return to root folder
cd ../../

echo "Conversion complete!"
