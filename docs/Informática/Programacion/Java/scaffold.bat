@echo off
setlocal

:: === CONFIG ===
set GROUP_ID=es.moconinja.exerciserunner
set ARTIFACT_ID=exercise-runner

:: === GENERATE PROJECT ===
mvn archetype:generate ^
  -DgroupId=%GROUP_ID% ^
  -DartifactId=%ARTIFACT_ID% ^
  -DarchetypeArtifactId=maven-archetype-quickstart ^
  -DinteractiveMode=false

echo.
echo Done! Project created in folder: %ARTIFACT_ID%

