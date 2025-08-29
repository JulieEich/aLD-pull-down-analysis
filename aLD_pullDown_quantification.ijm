/*aLD pull down quantification
Using a spinning disk confocal microscope (objective x100), acquire your images in the following order C1 : fluorescence (aLD), C2: transmission (beads).
Eichler Julie 
Fiji 1.54f
*/

//To begin clear all the ROIs and measures
roiManager("reset");
run("Clear Results");
setTool("freehand");
close("*");
print("\\clear");
print("Starting Macro");

// Directory selection
DIR = getDirectory("Choose an input directory");
print(DIR);

// List of files to analyze
list=getFileList(DIR);
SubList_nd=newArray(0);

// New directory to save image files and results
OUTPUT_DIR=getDirectory("Choose_ an output directory");
print(OUTPUT_DIR)

Save_ROI = OUTPUT_DIR+ "ROI_aLD_pull_down" + File.separator; 
File.makeDirectory(Save_ROI);

Save_Results = OUTPUT_DIR+ "Results_aLD_pull_down" + File.separator; 
File.makeDirectory(Save_Results);

// Select *.nd files in the chosen directory
for (i=0;i<list.length;i++){
	if (endsWith(list[i], ".nd" )){
		SubList_nd=Array.concat(SubList_nd, list[i]);
	}
}
Array.show(SubList_nd);

run("Set Measurements...", "area mean min integrated median redirect=None decimal=2");

// Loop
for (i=0;i<SubList_nd.length;i++){
run("Bio-Formats Macro Extensions");
FILE_PATH=DIR+SubList_nd[i];
run("Bio-Formats Importer", "open=["+ FILE_PATH +"] " + "color_mode=Default" + " view=Hyperstack " + " stack_order=XYCZT ");
fileName= getTitle();
titleNoExt= File.nameWithoutExtension;
run("Split Channels");
ChannelC1 = "C1-"+fileName;
ChannelC2 = "C2-"+fileName;

selectWindow(ChannelC1);
//titleOfChannelC1 = getImageID();
resetMinAndMax();
run("Magenta");

selectWindow(ChannelC2);
//titleOfChannelC2 = getImageID();
resetMinAndMax();
run("Grays");

setTool("oval");
roiManager("reset");
run("Clear Results");
waitForUser("ROI", "Select the ROI of interest and add them to the ROI manager pressing T, don't forget the blank" ); //add the ROIs to the ROI manager pressing T
selectWindow(ChannelC1);
roiManager("Show All");
roiManager("Measure");
outputPath1= Save_ROI+ titleNoExt +"Selected_ROI"+".roi"; // The ROIs files can be opened by drag and drop in FiJI
roiManager("Save", outputPath1);
outputPath2= Save_Results+ titleNoExt +"Measure_ROI"+".csv"; // The measurement can be open in EXCEL, the format has to be changed in CSV separator "," in excel
saveAs("results", outputPath2 );
roiManager("reset");
run("Clear Results");

}