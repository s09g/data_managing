import re
from pyspark import SparkConf, SparkContext

def normalizeWord(text):
	return re.compile(r'\W+', re.UNICODE).split(text.lower())

conf = SparkConf().setMaster("local").setAppName("WordCount")
sc = SparkContext(conf = conf)

rdd = sc.textFile("file:///book.txt")
words = rdd.flatMap(normalizeWord)
wordCounts = words.map(lambda x : (x, 1)).reduceByKey(lambda x, y: x + y)
wordCounts = wordCounts.map(lambda x : (x[1], x[0])).sortByKey()
results = wordCounts.collect()

for result in results:
	count = str(result[0])
	word = result[1].encode('ascii', 'ignore')
	if word:
		print(word.decode() + ":\t\t" + count)
