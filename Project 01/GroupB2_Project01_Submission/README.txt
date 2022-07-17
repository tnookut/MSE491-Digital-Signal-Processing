Project Group B 2

This project is a graphical user interface for applying various audio effects
to an audio file of choice. This project was designed and programmed using 
MATLAB App Designer. 

Members:
    Kim Jae Hong
    Tanya Nookut


Code Working Functions:
- Callbacks
	- BrowseButtonPushed
	- ApplyTremoloButtonPushed
	- PlayButtonPushed
	- SaveButtonPushed
	- ApplyPanningButtonPushed
	- ApplyFadeInButtonPushed
	- ApplyFadeOutButtonPushed
	- ApplyEchoButtonPushed
	- ApplyReverbButtonPushed
	- UndoButtonPushed
	- RedoButtonPushed
- Functions
	- FadeIn
	- FadeOut
	- Echo
	- Reverb
	- Tremolo
	- RhythmicAutoPanning
	- UpdateSignal


Program Limitations:
- The program assumes that the user follows strict procedure when applying effects.
- The program does not have error or warnings when user perform unallowable actions such as
	- adding effects when audio hasn't been selected
	- clicking undo when an effect has not been applied
	- clicking redo when there isn't a history of change
	- Setting time values out of range of the signal
- User has to undo an effect before changing its parameters. Otherwise, two of the same
effects will be added.
- Matlab error when Rhythmic Auto Panning is applied more than once.
- Matlab error when Rhythmic Auto Panning is applied after reverb.
 
Suggested Future Work:
- Add warnings or throw errors when user perform unallowable actions described above.
- Fix current Matlab errors.
- Allow an effect to be applied more than once.
- Allow user to choose between adding a duplicate effecot or modifying existing effect.
- Allow user to rearange effects without using undo and redo buttons.
- In case of duplicated effects, allow user to choose which effect they want to modify.
- Add adjustable echo amplitude.



