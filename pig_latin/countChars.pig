raw_data = LOAD 'in/*' AS (line:chararray);
lower_data = FOREACH raw_data GENERATE LOWER(line) AS line;
characters = FOREACH lower_data GENERATE FLATTEN(TOKENIZE(REPLACE(line, '', '|'), '|')) AS token;
char_words = FILTER characters BY token MATCHES '\\w';
char_group = GROUP char_words BY token;
result = FOREACH char_group GENERATE group, COUNT(char_words);
STORE result INTO 'out';