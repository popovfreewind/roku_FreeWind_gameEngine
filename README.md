# roku_FreeWind_gameEngine
## version: 2.3.6
## [changelog](./CHANGELOG.md)

fork of https://github.com/Romans-I-XVI/Roku-gameEngine
+
An object oriented game engine for the Roku

The purpose of this project is to make it easy to develop games for the Roku in an object oriented fasion. Similar to how you would with an engine such as Gamemaker or Unity (minus any visual software that is).

First start by creating the gameEngine object

##### game = new_game(canvas_width as Integer, canvas_height as Integer, canvas_as_screen_if_possible = false as Boolean) as Object
Creates the main game object, the canvas width and height create an empty bitmap of that size that the game is drawn to. If canvas_as_screen_if_possible is set the game will draw to the roScreen directly if the canvas dimensions are the same as the screen dimensions, this improves performance but makes it so you can't do various canvas manipulations (such as screen shake or taking screenshots).
