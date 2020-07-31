**Classification using Decision Tree From Scratch**


<img src='https://miro.medium.com/max/1400/0*YEwFetXQGPB8aDFV' width="40%" />





### Introduction
Classifying letter recognition data based on ID3 Algorithm using Decision Tree and got the confusion matrix.

- #### First part
The tree is trained based on Information Gain (IG) criterion.

- #### Second part
The tree is trained based on Gini Index criterion.

- #### Third part
The two attributes with the most IG are swapped and the tree is trained.

- #### Fourth part

Using Random Forest, clustered the attributes into K folds, and trained K trees and found the K with the best accuracy.



Implemented by two approaches, one using cells(memory consuming), and the other, using nested queries.
Details in the code!


###  Datasets

The Dataset is a mat file, which can be easily read using loadmat command in MATLAB.
It includes 4000 test, and 16000 training handwritten black-white alphabet letters, totally in 26 classes.
Each instance has 16 features, such as number of different pixels, mean and variance of the balck pixels in different ways and etc.

## Description of the files in this repository

1) ``code/initial_tree.m``: Execute this file to train the Decision Tree based on IG.
2) ``code/initial_tree_GINI.m``: Execute this file to train the Decision Tree based on Gini index. 
3) ``code/tree_changed_atts.m``: For the 3rd part
4) ``code/random_forest.m``: Contains the function that defining the networks and losses.


