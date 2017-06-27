# Peer Reviewed Assignment Code Book
generated 2017-06-27 04:49:38 during sourcing of `run_analysis.R`

## Actions performed on data:
* merging all test  and training datasets files into one dataset: `completeData`
* `completeData` loaded in memory, dimensions: 10299 x 563
* subsetted `completeData` into `meanstdData` keeping only the key columns and features containing `std` or `mean`, dimensions : 10299 x 68
* Substituted activity variable ids for its corresponding descriptive activity label, dimensions:10299 x 68
* melted `meanstdData` into `moltenData`, based on key columns, dimensions : 679734 x 4
* Split `feature variable` into its atomic components (7), each in a different column, and merged it to `moltenData`, dimensions : 679734 x 11
