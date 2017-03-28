### spatial data in database

screen-shot of the project

1. I picked nine coordinates in USC campus area. ![nine_locations](https://github.com/ZhangShiqiu1993/db_management/blob/master/spatial_data/1.nine_locations.png?raw=true)

2. Computed the convex hull of those nine coordinates.
![convex_hull](https://github.com/ZhangShiqiu1993/db_management/blob/master/spatial_data/3.convex_hull.png?raw=true)
*PostGIS calculate convex hull*
![calculate convex hull](https://github.com/ZhangShiqiu1993/db_management/blob/master/spatial_data/2.convex_hull_query_result.png?raw=true)

3. Found the three nearest neighbors from my living apartment.
![three_nearest_neighbors](https://github.com/ZhangShiqiu1993/db_management/blob/master/spatial_data/5.three_nearest_neighbors.png?raw=true)
*PostGIS calculate knn (k-nearest neighbors)*
![calculate knn](https://github.com/ZhangShiqiu1993/db_management/blob/master/spatial_data/4.three_nn_query_result.png?raw=true)

4. Drawn a Spirograph curve around the teaching building SGM.
![spiro_1](https://github.com/ZhangShiqiu1993/db_management/blob/master/spatial_data/spiro1.png?raw=true)
![spiro_2](https://github.com/ZhangShiqiu1993/db_management/blob/master/spatial_data/spiro2.png?raw=true)


*based on PostgreSQL, PostGIS and Google Earth*
