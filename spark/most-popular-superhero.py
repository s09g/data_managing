from pyspark import SparkConf, SparkContext

def parseNames(line):
    fields = line.split('\"')
    return (int(fields[0]), fields[1].encode('utf8'))

def countCoOccurences(line):
    elements = line.split()
    return (int(elements[0]), len(elements) - 1)

conf = SparkConf().setMaster("local").setAppName("PopularHero")
sc = SparkContext(conf = conf)

names = sc.textFile("file:///marvel-names.txt")
namesRDD = names.map(parseNames)

lines = sc.textFile("file:///marvel-graph.txt")
pairings = lines.map(countCoOccurences)

totalFriendsByCharacter = pairings.reduceByKey(lambda x, y: x + y)
flipped = totalFriendsByCharacter.map(lambda xy : (xy[1], xy[0]))

mostPopular = flipped.max()

mostPopularName = namesRDD.lookup(mostPopular[1])[0]

print(str(mostPopularName) + " is the most popular superhero, with " + \
    str(mostPopular[0]) + " co-appearances.")
