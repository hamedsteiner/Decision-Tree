**[Classification using Decision Tree]


**[Single Image Reflection Removal through Cascaded Refinement  ][1]**\
Chao Li, Yixiao Yang, Kun He, Stephen Lin, John E. Hopcroft\
[CVPR 2020]

<img src='imgs/cascading_results.png'/>



## Introduction





## Quick Start

### Prepare Datasets

Download and unzip our created [dataset](https://drive.google.com/file/d/1YWkm80jWsjX6XwLTHOsa8zK3pSRalyCg/view?usp=sharing ) and images from [Zhang et al.][3], and then copy them to ```datasets/reflection```.



### Test

- #### Download Pre-trained Model

Download and unzip our [pre-trained model](https://drive.google.com/file/d/1Dnlb875jP-F3vcFHlolcPTXFn4RmnQNr/view?usp=sharing), and then copy them to ```checkpoints/IBCLN```.

- #### Prepare data

Copy image pairs ```T``` and ```I``` you want to test to ```datasets/reflection/testA1``` and ```datasets/reflection/testB``` separately.
If ```T``` image is not given, the ground truth will be an all black image.

- #### Run

You can run ```bash test.sh```

or equivalently:

```python test.py --dataroot datasets/reflection --name IBCLN --model IBCLN --dataset_mode resize_natural_3  --preprocess "" --no_flip --epoch final --gpu_ids 0```	



### Train

- #### Prepare data

Make two directories ```trainA1, trainA2``` in ```datasets/reflection``` i.e.

```
cd datasets/reflection
mkdir trainA1
mkdir trainA2
```

Prepare some images for synthesis. Copy ```T``` and ```R``` images to ```trainA1``` and ```trainA2``` separately.

- #### Run

You can run ```bash train.sh```

or equivalently:

```python train.py --dataroot datasets/reflection --name IBCLN --model IBCLN --dataset_mode resize_natural_3   --no_flip   --gpu_id 0 --display_id -1```




## Description of the files in this repository

1) ``train.py``: Execute this file to train the model 
2) ``test.py``: Execute this file to test the model 
3) ``model/IBCLN_model.py``: Contains the class defining our model
4) ``model/networks.py``: Contains the function that defining the networks and losses.
5) ``options/base_options.py``: This file contains the basic options
6) ``options/train_options.py``: This file contains the options for training
7) ``options/test_options.py``: This file contains the options for testing

