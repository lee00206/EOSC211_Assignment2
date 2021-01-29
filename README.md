# EOSC211_Assignment2
This is a part of the assignments in Earth and Ocean Science 211 course at UBC.<br>
Assignment 2 constructs a simplified planetary flyby. It computes a spacecraft's accelaration, velocity and position as it flys by a planet. The assignment is composed of 4 functions and several scripts:<br>
* *get_traj* returns the acceleration, velociy and position vectors along the complete spacecraft trajectory. It will call three subfunctions gravv, scvelops, and checkinit.
* *gravacc* will calculate the gravitational acceleration on the spacecraft at any given point along the trajectory.
* *scvelpos* will compute the instantaneous change in position and velocity of the spacecraft due to the gravitational acceleration caused by the planet.
* *checkinit* will check that the initial acceleration caused by the planet.
* The main script will call get_traj for various initial (starting) conditions that are given. The main script will contain the code to generate the requested figures or output in each section.<br>
<img src="https://user-images.githubusercontent.com/43057046/106304401-a7881400-629e-11eb-8a32-942aa3151a2b.jpg" width="60%" height="50%"></img><br>
<img src="https://user-images.githubusercontent.com/43057046/106304409-a951d780-629e-11eb-9c1b-067c8086d351.jpg" width="60%" height="50%"></img><br>
<img src="https://user-images.githubusercontent.com/43057046/106304411-aa830480-629e-11eb-9fbd-f132d15fcea9.jpg" width="60%" height="50%"></img><br>
