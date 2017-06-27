
# Coursera's Getting and Cleaning Data Peer Review Project
## Project Objectives
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below.
2) a link to a Github repository with your script for performing the analysis.
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4) a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

* * *

## Included Scripts, Data and Necesary Packages

|Type|Name|Usage//Description|
|:---:|---:|---|
|**Script**|run_analysis.R| Runs all 5 steps of analysis, prints out ongoing step & generates Codebook.md of the run.|
|**Data**|UCI HAR Dataset | Human Activity Recognition Data collected from the accelerometers from the Samsung Galaxy S smartphone|
|**Pkg**|reshape2|Necesary pkg for transformations happening inside `run_analysis.R`|
|**Pkg**|dplyr| Pkg used for manual pipping and testing|
* * *
## How to use:
### Install `run_analysis`'s dependent packages
* reshape2
* dplyr

### Source `run_analysis.R`
* Loads package dependencies
* Generates a new `CodeBook.md` for the run
* Outputs variables to the Global_env: `completeData`,`moltenData` & `tidyData`\
	Detailed info on these variable in `.\CodeBook.md\`
* Dumps `tidyData` to `.\UCI HAR Dataset\tidyData.txt`

