#!/bin/bash

#在linux下测试
:<<cc
g++ ./map.cpp -o map
g++ ./reduce.cpp -o reduce
cat /home/hadoop/input/wordcount/wordcount.txt | ./map | sort | ./reduce
cc

#在hadoop下执行
hadoop fs -rmr /user/hadoop/output
hadoop jar $HADOOP_HOME/contrib/streaming/hadoop-streaming-1.2.1.jar \
-input /user/hadoop/input/wordcount/ \
-output /user/hadoop/output/wordcount \
-mapper /home/hadoop/c++/streaming/map \
-reducer /home/hadoop/c++/streaming/reduce \
-file /home/hadoop/c++/streaming/map \
-file /home/hadoop/c++/streaming/reduce
