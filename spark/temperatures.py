from pyspark import SparkConf, SparkContext
conf = SparkConf().setMaster("local").setAppName("MinTemps")
sc = SparkContext(conf = conf)

def parseLine(line):
	fields = line.split(',')
	stationID = fields[0]
	entryType = fields[2]
	temperature = float(fields[3]) * 0.1
	return stationID, entryType, temperature

lines = sc.textFile("file:///1800.csv")
rdd = lines.map(parseLine)

minTemps = rdd.filter(lambda x: "TMIN" in x[1])
stationTemps = minTemps.map(lambda x : (x[0], x[2]))
minTemps = stationTemps.reduceByKey(lambda x, y: min(x, y))
results = minTemps.collect()
print("Min Temp")
for result in results:
	print(result[0] + "\t{:.2f}°C".format(result[1]))
print("\n")

minTemps = rdd.filter(lambda x: "TMAX" in x[1])
stationTemps = minTemps.map(lambda x : (x[0], x[2]))
minTemps = stationTemps.reduceByKey(lambda x, y: max(x, y))
results = minTemps.collect()
print("Max Temp")
for result in results:
	print(result[0] + "\t{:.2f}°C".format(result[1]))