# Change Log
All notable changes to this project will be documented in this file.

## [2.3.6] - 12-03-2025
### changes
- update label type form text to label
- Update alignment of text in empty game object to left
- Refactor atlas loading functions to improve error handling and ensure proper data types
- Refactor media functions to streamline music playback and remove unused sound toggle
- Refactor sound management functions to simplify sound playback and improve channel handling
- standardize naming conventions for music playback and control methods
- Add mathematical utility functions for min, max, ceil, floor, and round
- Refactor game_defineMainLoopFunction to simplify movement calculations by removing multiplication by 60
- Add Math_NewVector function with methods for vector manipulation and operations
- Enhance game_defineMainLoopFunction to skip disabled instances during drawing
- Update region sorting in game_defineResourcesFunctions to use index and assign index to texture items in utils
- Add FPS averaging functionality to game_defineMainLoopFunction and initialize FPS settings in game_getMainObject

## [2.2.5] - 11-03-2025
### changes
- add support for texture parker frames array and AA format
- add buttonCodes

## [2.2.4] - 11-03-2025
### changes
- rename artsConfig to resourcesConfig, add function setResourcesConfig

## [2.1.3] - 11-03-2025
### changes
- add default font loader

## [2.1.2] - 11-03-2025
### changes
- move image render to separate files
- split engine code on files for better navigation
- add label to game object
- make fonts and images bitmaps auto load to memory

## [1.1.1] - 10-03-2025
### Forked from https://github.com/Romans-I-XVI/Roku-gameEngine