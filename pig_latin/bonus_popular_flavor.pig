kids = load 'in/kids.txt' using PigStorage(' ') as (kid, age:int);
tweens = FILTER kids by age >= 10 and age <=12;
purchases = load 'in/purchases.txt' using PigStorage(' ') as (kid, flavor);
tween_purchase = JOIN tweens BY kid, purchases BY kid;
popular_flavor = GROUP tween_purchase by flavor;
flavor_count = FOREACH popular_flavor GENERATE group, COUNT(tween_purchase) as count;
top_popular = ORDER flavor_count BY count desc;
result = LIMIT top_popular 1;
STORE result INTO 'out';
