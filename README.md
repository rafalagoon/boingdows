# Boingdows: Windows with physics

Small experiment with the program's own window and the Godot Engine physics engine.

## How does it work

The project consists of a 640x480 window, which is internally represented by a RigidBody of the same size and a StaticBody that acts as screen boundaries.

The RigidBody acts according to the internal physics of the engine and with each change in position it emits a signal that is captured by the program, updating the position of the window.

When you click on the window bar to drag it, internally it is detected that the window loses focus, since it is the system that gains focus, and there we stop the physical simulation so that the window can be moved manually.

Once the window bar is released, the inner window interprets that it has regained focus and then we activate physics again, and we apply a force equivalent to the direction in which the window has been dragged.

## Variables to take into account:

*@export var screen_margin_left:int = 2240
@export var screen_margin_bottom:int = 60*
 
These two variables are used to adjust the window and its calculations to a screen. I have left the default ones that were good for me since I have two screens and I work on my secondary screen.

Adjust these values so that it works on your desktop

*@export var force_multiplier:int = 100000*

It is the force multiplier, the higher it is, the faster it will move. According to my tests this was the optimal value.

## Project License

MIT.

Author: Rafa Laguna

*Project developed on Twitch streaming*
