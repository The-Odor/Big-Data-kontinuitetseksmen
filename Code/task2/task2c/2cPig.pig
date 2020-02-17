list = LOAD 'output2c/part-00000' using PigStorage(' ') AS (name:chararray, rep:int);
sorted_list = ORDER list BY rep DESC;
limit_list = LIMIT sorted_list 10 ;
dump limit_list ;
STORE limit_list INTO '2cPig_Output' using PigStorage(' ');
