# Assumptions:
# 1. the dataset in the cluster is located under "Dataset/"
# 2. the current directory contains files mapper.py and reducer.py for mapper and reducer code respectively

#Simplify task change further
taskNumber = 1a
taskName   = WordCount
sourceFile = Posts

#Simplify task change
mapperfile  = $taskNumber$taskName.py
reducerfile = "$taskNumber"Reducer.py
outfile     = output$taskNumber

#Automatic removal
hadoop fs -rm -r $outfile

#For Windows-compatibility
apt-get install dos2unix
dos2unix $mapperfile
dos2unix $reducerfile

#Main MapReduce function call
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.7.3.jar \
-files $mapperfile,$reducerfile \
-mapper $mapperfile \
-reducer $reducerfile \
-input Dataset/$sourceFile.xml \
-output $outfile

#Read file and save it locally
hadoop fs -cat $outfile/*
hadoop fs -copyToLocal $outfile

#Automatic cleanup
hadoop fs -rm -r $outfile
