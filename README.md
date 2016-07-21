# understory

## Documentation to come

###### quick note:
NOTE: SAVING notes from BOSCMapping
** for the load1 / save1 osc message receves **
It seems that the fader names coming from touchOSC were being used to control the saved preset value... so /load1 button would get the '1' from the button name in TouchOSC and use that to save the sketch setting config to 'image-1' at the moment i've set it so the 'name-#' is coming from the global `defaultPresetIndex` int which is stored in understory.pde this is also the same functionality for the save function. It might make sense to put this back into the functionality so different touchOSC versions load unique preset settings