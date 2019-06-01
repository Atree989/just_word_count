val file=sc.textFile("hdfs://...")
val counts=file.flatMap(line=>line.split(" ")).map(word,1)).reduceByKey(_+_)
counts.saveAsTextFile("hdfs://...")
