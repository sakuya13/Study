len :: [a] -> Integer
len [] = 0
len (_:xs) = 1 + len xs


all_pos [] = True
all_pos (x:xs) = x > 0 && all_pos xs


-- what will this C code print out?
-- int glob = 0;
-- int inc(void) {
--     glob++;
--     return glob;
-- }
-- printf(inc() - inc());
-- it depends. If the first inc() is evaluated first, it will print 1 - 2 = -1.
-- If it is evaluated second, it will print out 2 - 1 = 1. The C language does
-- not specify which.


