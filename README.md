Social Distancing detection using Deep Learning
=============
<img src="/images/SocialDistancing1.png" width="100%" height="100%" title="Final Result" alt="Final Result"></img><br/>


**Background**

Coronavirus disease (COVID-19) is a new strain of disease in humans discovered in 2019 that has never been identified in the past. 
Coronavirus is a large family of viruses that causes illness in patients ranging from common cold to advanced respiratory syndromes such as Middle East Respiratory Syndrome (MERS-COV) and Severe Acute Respiratory Syndrome (SARS-COV).
Many people are currently affected and are being treated across the world causing a global pandemic. 
Several countries have declared a national emergency and have quarantined millions of people. 

To be a part of the worldwide trend, I've created a Social Distancing detection system.

Application Workflow
-------------   
<img src="/images/SocialDistancing2.png" width="70%" height="70%" title="Application Workflow" alt="Application Workflow"></img><br/>
* Detect Pedestrians in the perspective view 
  * Train YOLOv3 detector for pedestrian detection
* Convert perspective view into Bird's-eye view
  * Morphs the perspective view into a bird’s-eye (top-down) view
  * We assumes that every person is standing on the same flat ground plane.
* Measure the distances between persons in Bird's-eye view
  * Estimate pedestrian's (x, y) location in the bird's-eye view.
  * Selecting bottom-center point of each person's bounding box in the perspective view and transform the points into bird's-eye view.

 
Part1 - Detect Pedestrians in the perspective view
-------------
<img src="/images/SocialDistancing3-1.png" width="70%" height="70%" title="Detect Pedestrians" alt="Detect Pedestrians"></img><br/>

#### COVID19_PeopleExtractGT.mlx
This file extracts dataset provider given ground truth information, [Oxford Town Centre Dataset](http://www.robots.ox.ac.uk/ActiveVision/Research/Projects/2009bbenfold_headpose/project.html)[1], and get ready for the training.
#### COVID19_TrainPeopleYOLOv3.mlx
Train the pedestrian detection model from ground truth data, extracted from above file.

Part2 - Convert perspective view into Bird's-eye view & Measure the distances between persons in Bird's-eye view
-------------
<img src="/images/SocialDistancing4-1.png" width="100%" height="100%" title="Calibration" alt="Calibration"></img><br/>

#### COVID19_SocialDistancingScript.mlx
This file includes the entire social distancing system development script with pretrained people detection model.
It covers calibration process from perspective view into bird's-eye view, extract person's location and measure the distances each other.   
<img src="/images/SocialDistancing5-1.png" width="50%" height="50%" title="Measurement" alt="Measurement"></img><br/>

Part3 - Test application and App for interactive execution
-------------
### COVID19_PeopleVideoRunning.mlx
With the pretrained people detector, and using COVID19_SocialDistancingScript.mlx, it can run social distancing detector for existing video.
<img src="/images/SocialDistancing1.png" width="100%" height="100%" title="Final Result" alt="Final Result"></img><br/>
### COVID19_SocialDistancing.mlapp
I have built a lightweight tool that enables even non-technical users to create the system for their own.
<img src="/images/SocialDistancing6.png" width="100%" height="100%" title="App for Social Distancing" alt="App for Social Distancing"></img><br/>

Requires
- [MATLAB](https://www.mathworks.com/products/matlab.html)
- [Deep Learning Toolbox](https://www.mathworks.com/products/deep-learning.html)
- [Image Processing Toolbox](https://www.mathworks.com/products/image.html)
- [Computer Vision Toolbox](https://www.mathworks.com/products/computer-vision.html)
- [Parallel Computing Toolbox](https://www.mathworks.com/products/parallel-computing.html)
- [MATLAB Coder](https://www.mathworks.com/products/matlab-coder.html)
- [GPU Coder](https://www.mathworks.com/products/gpu-coder.html)


For more information on Deep Learning in MATLAB
-------------
[![View Social-Distancing-Monitoring-System on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://kr.mathworks.com/matlabcentral/fileexchange/76760-social-distancing-monitoring-system)

**[Download a free MATLAB trial for Deep Learning](https://www.mathworks.com/products/deep-learning.html)**


References
-------------
[1] B. Benfold and I. Reid. Guiding visual surveillance by tracking human attention. In BMVC, 2009

Copyright 2020 The MathWorks, Inc.
