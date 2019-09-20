# MatrixProfileEnergyConsumption

For rakennusfysiikka 2019 conference publication: Verification and improving building energy efficiency during occupation with energy measurement data - Case: Sheet Metal Center industrial hall (Markus Hansen-Haug, Khoa Dang; Häme University of Applied Science)


The repo consists of the dataset on Sheet Metal Center building, Hämeenlinna, Finland various energy consumption measurements during 01.04.2018 to 01.04.2019 and the energy consumption profiling/feature extraction using normal average consumption and AFD with matrix profile time series snippets. The building is regarded as one of the first near zero energy building in Finland (https://yle.fi/uutiset/3-8536020). 

## Instructions
clone the repo and open the path with matlab, add the eamonnMP folder to the matlab path also. Execute rakfy2019.m to perform the profiling on the geothermal heatpump energy consumption in the 2018-2019 winter. 

Copyright (c) 2019 Khoa Dang, released under the MIT license. 
This project uses open source components: 

The matrix profile and time series snippets calculation implementation were done Dr. Eamonn Keogh and his lab team at University of California, Riverside: https://www.cs.ucr.edu/~eamonn/MatrixProfile.html