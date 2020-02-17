/*list = LOAD '://localhost/user/root/output2d/*' using PigStorage(',') AS (id:int, title:chararray, score:int);
A = FOREACH list GENERATE id,title,score;

B = DISTINCT A;
C = GROUP B BY (title, score) PARALLEL 11;
D = FOREACH C GENERATE score, MAX(B.score);
DUMP D ;
STORE D INTO '2cPig_Output' using PigStorage(' ');*/


list = LOAD 'output2d/part-00000' using PigStorage(',') as (id:int, title:chararray, score:int);
sorted_list = ORDER list BY score DESC;
limit_list = LIMIT sorted_list 10 ;
dump limit_list ;
STORE limit_list INTO '2dPig_Output' using PigStorage(' ');
