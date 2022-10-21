-- AnimLayerCleaner
-- Description: Animation Layer Cleaner for 3ds Max
-- Version: 0.1
-- Author: Markulie
-- Created: September 30, 2022


macroscript AnimLayerCleanerMacro
    category:"markulie"
    buttonText:"AnimLayerCleaner"
    toolTip:"AnimLayerCleaner | Animation Layer Cleaner for 3ds Max"
(
global AnimLayerCleanerDialog
	
clearlistener()
gc()
try(DestroyDialog AnimLayerCleanerDialog)catch()

rollout AnimLayerCleanerDialog "AnimLayerCleaner v0.1" width:150 height:120
(
	button buttonCheck "Check Animation Layers" pos:[5,10] width:140 height:30
	button buttonClean "Clean Animation Layers!" pos:[5,50] width:140 height:30
	label message "" pos:[75,85]
	
	on buttonCheck pressed do
	(
		local count = AnimLayerManager.getLayerCount()
		message.text = ("Found: " + (count as string))
	)

	on buttonClean pressed do
	(		
		local count = AnimLayerManager.getLayerCount()
		message.text = ("Deleted: " + (count as string))
		with undo off for i = (AnimLayerManager.getLayerCount()) to 2 by -1 do AnimLayerManager.deleteLayer i
	)
	
	hyperLink author "markulie" address:"https://markulie.github.io" pos:[55,105] color:(color 200 255 255) hovercolor:(color 0 255 217) visitedcolor:(color 255 0 255) align:#center
)--rollout

createDialog AnimLayerCleanerDialog 
cui.RegisterDialogBar AnimLayerCleanerDialog style:#(#cui_floatable,#cui_dock_left,#cui_dock_right,#cui_handles)
)--macro
