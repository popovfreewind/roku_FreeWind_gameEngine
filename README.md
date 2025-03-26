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

Game
------
###### ---General Methods---
##### Play() as Void
After setting up your game, call this method to execute it.
##### End() as Void
This will end your game. All existing instances will be destroyed before exiting (meaning onDestroy() will be called).
##### Pause() as Void
This will pause your game. Note: all instances that have _pauseable = false_ will continue to execute. Also keep in mind that onDrawBegin, onDrawEnd, and onDrawGui are _always_ executed even when the game is paused.
##### Resume() as Dynamic
This will resume your paused game. Returns how long the game was paused in milliseconds if the game was paused, otherwise returns invalid if the game wasn't paused.
##### isPaused()
Returns true if the game is paused.
##### getCanvas() as Object
Returns the canvas bitmap object.

###### ---Game Object Methods---
##### defineObject(object_name as String, object_creation_function as Function) as Void
Define a new game object. The function provided will be called when an instance of the object is created, the function provided receives an empty object and modifies it as necessary.
##### createInstance(object_name as String, [args as AssociativeArray]) as Dynamic
Creates a new instance of an object that has been defined using defineObject(). The args AssociativeArray is optional, it will be passed to the onCreate() method.

If the instance is created successfully, the instance is returned. Otherwise returns invalid.
##### getInstanceByID(instance_id as String) as Object
Returns the instance associated with the provided ID.
##### getInstanceByName(object_name as String) as Object
Returns the first instance of an object of the specified name. (note: If more than one instance exists, only the first one will be returned)
##### getAllInstances(object_name as String) as Array
Returns array containing all instances of the specified name.
##### destroyInstance(instance as Object) as Void
Destroys the provided instance.
##### destroyAllInstances(object_name as String) as Void
Destroys all instances of the specified name.
##### instanceCount(object_name as String) as Integer
Returns the number of instances of the specified name.

##### defineRoom(room_name as String, room_creation_function as Function) as Void
Define a new room. The function provided will be called when the room is switched to, the function provided receives an empty object and modifies it as necessary. This is the same as defineObject() except it is used for rooms.
##### changeRoom(room_name as String, [args as AssociativeArray]) as Boolean
Switches to a room that has been defined using defineRoom(). The args AssociativeArray is optional, it will be passed to the onCreate() method.
##### resetRoom() as Void
Resets the current room, retaining the original args.

###### ---Font Methods---
##### registerFont(path as String) as Boolean
Registers the font at the provided path. Returns true if successful. Note: All fonts in the directory pkg:/fonts/ automatically get registered.

###### ---Canvas Methods---
##### canvasFitToScreen() as Void
This fits the game canvas to the screen regardless of the screen aspect ratio. This makes it so a game can be made at any size and black bars will be shown on the top/bottom or left/right if the game aspect ratio is not the same as the TV's.

###### ---Audio Methods---
##### playMusic(path as String, [loop as Boolean]) as Boolean
Plays music from the provided path. Loop defaults to false. Returns true if the path is valid.
##### stopMusic() as Void
Stops the currently playing music.
##### pauseMusic() as Void
Pauses the currently playing music.
##### resumeMusic() as Void
Resumes music that is paused.
##### loadSound(sound_name as String, path as String) as Void
Loads a short sound in to memory from the provided path to be triggered by playSound() with the provided name. This is specifically for sound effects, because the sounds are in memory they will be played instantly.
##### playSound(sound_name as String, [volume as Integer]) as Boolean
Plays the sound associated with the name provided, sound must have already been loaded using loadSound(). Returns true if the sound was triggered.

Game Object
------
# `new_emptyGameObject`

## Overview
The `new_emptyGameObject` function creates and initializes a new game object within your BrightScript game framework. It sets up essential properties, methods, and event hooks to manage drawable elements (images and labels), colliders, and game behaviors.

---

## Features
- **Core Properties**: Initializes object name, unique ID, game reference, and state variables.
- **Image & Label Management**: Methods to add, retrieve, and remove images and labels.
- **Drawable Object Management**: Supports insertion and removal of drawable objects.
- **Collider Management**: Provides functions to add circular or rectangular colliders.
- **Customizable Event Handlers**: Includes placeholders for events such as `onCreate`, `onUpdate`, `onCollision`, etc.

---

## Parameters
- **`game`**: An object representing the parent game instance. This parameter is used for generating unique IDs, accessing the game canvas, and managing resources.
- **`object_name`**: A string that specifies the name of the new game object.

---

## Return Value
- **`object`**: Returns the newly created game object with pre-configured properties, methods, and event hooks.

---

## Object Structure

### Core Properties
- **`name`**: The game object’s name.
- **`id`**: A unique identifier generated with `game.getNewUniqId("object")`.
- **`game`**: Reference to the parent game instance.
- **`enabled`, `persistent`, `pauseable`**: Control the object’s state.
- **`depth`**: Used for rendering order.
- **`x`, `y`, `xspeed`, `yspeed`**: Define position and movement.
- **`colliders`**: Collection for collision detection objects.
- **`drawableObjects`**: List of drawable elements.
- **`labelsAA`, `images`, `imagesAA`**: Containers for text labels and images.

---

## Event Handlers
- **`onCreate`**: A subroutine (empty by default) that executes upon object creation.
- **Additional event placeholders**:
  - `onUpdate`
  - `onCollision`
  - `onDrawBegin`
  - `onDrawEnd`
  - `onButton`
  - `onECPKeyboard`
  - `onECPInput`
  - `onAudioEvent`
  - `onPause`
  - `onResume`
  - `onUrlEvent`
  - `onGameEvent`
  - `onChangeRoom`
  - `onDestroy`

---

## Methods

### Image Management
- **`addRandomNameImage(config as object)`**  
  Generates a random image name and adds an image to the object.
- **`addImage(name as string, config as object)`**  
  Adds an image with specified configurations.  
  - **Animation Support**: If `config.isAnimation` is `true`, the image supports animations with methods such as `Animate`, `onResume`, and a custom `Draw` function.
  - **Resource Management**: Automatically loads image textures and handles duplicate name checks.
- **`getImage(name as string)`**  
  Retrieves an image object by its name.
- **`removeImage(name as string)`**  
  Removes an image from the object and unloads its resources.

---

### Label Management
- **`addRandomNameLabel(config as object)`**  
  Generates a random label name and adds a label to the object.
- **`addLabel(name as string, config as object)`**  
  Adds a label with specified properties.  
  - Supports both single-line and multi-line labels based on configuration.
  - Loads font textures and checks for duplicate labels.
- **`getLabel(name as string)`**  
  Retrieves a label object by its name.
- **`removeLabel(name as string)`**  
  Removes a label and unloads its associated resources.

---

### Drawable Object Management
- **`insertDrawableObject(drawable_object as object, insertPosition as dynamic)`**  
  Adds a drawable element to the rendering list and sorts the list by priority.
- **`removeDrawableObject(drawable_object as object)`**  
  Removes a drawable element from the list based on its type and name.
- **`setDepth(depth as integer)`**  
  Sets the render depth of the object.

---

### Collider Management
- **`addColliderCircle(collider_name as string, radius as float, offsetX as float, offsetY as float, enabled as boolean)`**  
  Creates a circular collider with the specified radius and offset values.  
  - Generates an `roRegion` for collision detection.
  - Registers the collider in the object’s colliders collection.
- **`addColliderRectangle(collider_name as string, offsetX as float, offsetY as float, width as float, height as float, enabled as boolean)`**  
  Creates a rectangular collider with defined dimensions and offsets.
- **`getCollider(collider_name as string)`**  
  Retrieves a collider object by its name.
- **`removeCollider(collider_name as string)`**  
  Removes a collider and its associated sprite from the object.

---
