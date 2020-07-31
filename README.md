**[Classification using Decision Tree]**


<img src='https://miro.medium.com/max/1400/0*YEwFetXQGPB8aDFV' width="40%" />



## Introduction






###  Datasets

Our Dataset is a mat file, which can be easily read using loadmat command in MATLAB.
It includes 4000 test, and 16000 training handwritten black-white alphabet letters, totally in 26 classes.
Each instance has 16 features, such as number of different pixels, mean and variance of the balck pixels in different ways and etc.



Classifying letter recognition data based on ID3 Algorithm using Decision Tree.

- ####First part
- In the first part, The tree is trained based on Information Gain (IG) criterion.
- In the second part, The tree is trained based on Gini Index criterion.
- In the third part, the two attributes with the most IG are swapped and the tree is trained.
- In the fourth part


## Description of the files in this repository

1) ``train.py``: Execute this file to train the model 
2) ``test.py``: Execute this file to test the model 
3) ``model/IBCLN_model.py``: Contains the class defining our model
4) ``model/networks.py``: Contains the function that defining the networks and losses.
5) ``options/base_options.py``: This file contains the basic options
6) ``options/train_options.py``: This file contains the options for training
7) ``options/test_options.py``: This file contains the options for testing

