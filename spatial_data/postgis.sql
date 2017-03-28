SELECT ST_AsText(ST_ConvexHull(
		ST_Collect(
			ST_GeomFromText('MULTIPOINT(-118.294053 34.021895,-118.291424 34.018251,-118.291523 34.025478, -118.280046 34.021909, -118.282380 34.018408, -118.287898 34.024172, -118.289261 34.021263, -118.283019 34.021662, -118.286543 34.019954)')
		)));

CREATE TABLE coordinates(
	name VARCHAR,
	geom geometry(Point, '4326')
) ;

-- INSERT INTO coordinates(name, geom) values
-- ('My Apartment', ST_GeomFromText('POINT(-118.294053 34.021895)', 4326));

INSERT INTO coordinates(name, geom) VALUES
('Expo/Verm', ST_GeomFromText('POINT(-118.291424 34.018251)', 4326)),
('Verm/Jeff', ST_GeomFromText('POINT(-118.291523 34.025478)', 4326)),
('Jeff/Figu', ST_GeomFromText('POINT(-118.280046 34.021909)', 4326)),
('Figu/Expo', ST_GeomFromText('POINT(-118.282380 34.018408)', 4326)),
('LRC', ST_GeomFromText('POINT(-118.287898 34.024172)', 4326)),
('SGM', ST_GeomFromText('POINT(-118.289261 34.021263)', 4326)),
('LVL', ST_GeomFromText('POINT(-118.283019 34.021662)', 4326)),
('TCC', ST_GeomFromText('POINT(-118.286543 34.019954)', 4326));

SELECT name, geom
FROM coordinates
ORDER BY geom <-> st_setsrid(st_makepoint(-118.294053,34.021895), 4326)
LIMIT 3;
