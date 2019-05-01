Correct Perspective Filter
==========================

Goal
----

In this tutorial you will learn:

-   how to correct the perspective of objects by affine transformation

Theory
------


Result
------

Below you can see the real world image with motion blur distortion. The license plate is not readable on both cars. The red markers show the car’s license plate location.
![Motion blur image. The license plates are not readable](images/motion_original.jpg)


Below you can see the restoration result for the black car license plate. The result was completed by LEN = 125, THETA = 0, SNR = 700.
![The restored image of the black car license plate](images/black_car.jpg)

Below you can see the restoration result for the white car license plate. The result was completed by LEN = 78, THETA = 15, SNR = 300.
![The restored image of the white car license plate](images/white_car.jpg)

The values of SNR, LEN and THETA were selected manually to give the best possible visual result. The THETA parameter coincides with the car’s moving direction, and the 
LEN parameter depends on the car’s moving speed. 
Sure, the result is not perfect, but at least it gives us a hint as to the image’s content. With some difficulty, the car license plate is now readable.

@note The parameters LEN and THETA are the most important. You should adjust LEN and THETA first, then SNR.

You can also find a quick video demonstration of a license plate recovering method
[YouTube](https://youtu.be/xSrE0hdhb4o).
@youtube{xSrE0hdhb4o}