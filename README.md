# aLD-pull-down-analysis
Fiji macro and demo dataset for automated quantification of artificial lipid droplet (aLD) pull-down assays by fluorescence microscopy

# aLD Pull-Down Quantification (Fiji Macro)

This repository provides a Fiji macro and demo images illustrating the quantification of artificial lipid droplet (aLD) pull-down assays.  
Ni-NTA magnetic beads are coated with His₆-tagged proteins and incubated with fluorescently labeled aLDs. Upon interaction, aLDs remain bound to the beads and are visualized by fluorescence microscopy, whereas non-interacting aLDs are removed during washing. The provided macro automates image analysis to quantify the extent of aLD recruitment around the beads.

---

## Repository structure
- `aLD_pullDown_quantification` → Fiji macro for image analysis  
- `test_dataset/` → Example microscopy images  
- `README.md` → Documentation  

---

## Usage
1. Open Fiji/ImageJ.  
2. Load the macro from the `aLD_pullDown_quantification` folder.  
3. Run the macro on demo images or your own data.  
4. The script outputs bead–associated fluorescence intensity for quantification.  

---

## Demo
Example images are provided in `test_dataset/` to illustrate the analysis workflow.  

---

## Citation
If you use this macro or adapt the method, please cite:
Eichler J., et al 
