# To-Do

## Need to do

- start region:
  - ~~letter-boxing in the opening cinematic~~
  - ~~background audio in stasis chamber, fades out as you leave it~~
  - ~~room temp tag in stasis chamber: "Room temperature: 20.5 C"-"AC off."~~
  - ~~open stasis door tag: "< locked >"-"see terminal for information" when haven't checked terminal, "open door" otherwise~~
  - ~~stasis door opens on tag interaction, slides to the left, has audio~~
  - terminal tag in stasis chamber: "view automated logs", in document:
    "ERROR 4a:
    Critical stasis failure... repair required.
    Refer to maintenance handbook for more information.

    Recorded stasis duration: 2829 sols (56580.3 standard hours).

    Global notices:
    . Facility in low-power mode. Essential lighting and systems
    available only. Restore power via electrics room.
    . All operations ceased planet-wide. Details available on
    operation room of floor 2, outpost main complex building."
  - stasis chambers 1-10 (not including 3) tags
  - tag in generator room to "start generator", switches to "starting...", after 5 seconds it switches to "generator running" and swaps the region out for the powered on variant, there is background audio from the generator room, fades the farther away you get
  - tags in generator room saying "Generator running"-"Power available for basement" and "Rated to 10 KW"
  - tags in corridor saying "control room", "electrical switch room"-"DANGER"-"DO NOT ACCESS", "secure chambers 1-10" (stasis chambers are now closed off), "secure chambers 11-20", "storage", and "surface access stairs"-"(emergency exit)"
  - control (purple) room, "view stasis info" tag has map image:
    "CHAMBER STATUS:

    . 01: Nominal. Uptime: 56580.1
    . 02: Nominal. Uptime: 56580.2
    . 03: FAILURE
    . 04: Nominal. Uptime: 56580.1
    . 05: Nominal. Uptime: 56581.1
    . 06: Nominal. Uptime: 56580.3
    . 07: Nominal. Uptime: 56580.2
    . 08: Nominal. Uptime: 56580.3
    . 09: Nominal. Uptime: 56580.5
    . 10: Nominal. Uptime: 56580.8

    Viewing pg. 1/2"
  - "elevator" tag that opens elevator door, "close door" tag to close elevator door and be taken to the next region, door has audio, elevator has audio

## Done

- ~~Finish rearranging options menu:~~
  - ~~put each label and button pair in a horizontal container inside of a bigger vertical container that contains all options, instead of 2 separate vertical containers that contain labels and buttons respectively~~

- ~~Implement UI scaling to support increasing resolution:~~
  - ~~make increasingly scaled themes - complete: 0.75x, 1x, 2x, 3x, 4x~~
  - ~~implement system to automatically swap out the active theme~~  

- ~~Reformat scripts:~~
  - ~~UI and unsorted scripts are remaining~~
  - ~~Make scripts follow official style guides (use of gdtoolkit python scripts recommended)~~

- ~~Replace naive events autoload with proper EventsBus implementation~~

- ~~Move input method management code out of Global into its own autoload~~
  - ~~Improve input prompts script and merge it into the new input method script~~ (nah nvm lol)

- ~~Add controller support:~~
  - ~~give player control to the first controller that input is received from, lose it if the controller disconnects so control may be given to a new controller~~
  - ~~track the active method of input~~
  - ~~add "look_(up/down/left/right)" actions to the input map with m&k and joystick events~~
  - ~~rework mouse_aim_controller into more general purpose aim_controller that robustly handles mouse, keyboard, and controller aiming (new look_(up/down/left/right) actions), with settings for sensitivity curves and turn speed ramp up~~
  - ~~rework player input_vector code to swap between null-canceling and joystick input handling depending on active input method to allow using the InputMap for joystick mappings~~
  - ~~add category in options menu for controller settings, separate from m&k settings~~
  - ~~make input prompts use the new tracked input method, using this to adjust the input prompts shown~~
  - ~~make input prompts swap out prompts depending on the kind of controller that is being used~~
  - ~~make ui navigatable with controller~~

- ~~Implement welcome screen:~~
  - ~~welcome player to the game~~
  - ~~show the player the controls~~
  - ~~tell the player they can change these settings in the options menu~~
