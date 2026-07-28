# To-Do

## Need to do

- Add controller support:
  - ~~give player control to the first controller that input is received from, lose it if the controller disconnects so control may be given to a new controller~~
  - ~~track the active method of input~~
  - ~~add "look_(up/down/left/right)" actions to the input map with m&k and joystick events~~
  - rework mouse_aim_controller into more general purpose aim_controller that robustly handles mouse, keyboard, and controller aiming, with settings for sensitivity curves and turn speed ramp up
  - ~~rework player input_vector code to swap between null-canceling and joystick input handling depending on active input method to allow using the InputMap for joystick mappings~~
  - add category in options menu for controller settings, separate from m&k settings
  - ~~make input prompts use the new tracked input method, using this to adjust the input prompts shown~~
  - ~~make input prompts swap out prompts depending on the kind of controller that is being used~~
  - make ui navigatable with controller

- Implement welcome screen:
  - welcome player to the game
  - show the player the controls
  - give the player the option to change the controls/adjust sensitivity
  - tell the player they can change these settings in the options menu

- Port over the rest of the game:
  - start region
  - ...

- Implement UI scaling to support increasing resolution:
  - make increasingly scaled themes - complete: 1x, 2x
  - ~~implement system to automatically swap out the active theme~~

## Done

- ~~Finish rearranging options menu:~~
  - ~~put each label and button pair in a horizontal container inside of a bigger vertical container that contains all options, instead of 2 separate vertical containers that contain labels and buttons respectively~~
