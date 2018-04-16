-- normal ver.
foo = let a = 1
      in let b = 2
         in a + b

-- better ver.
bar = let x = 1
      in ((let x = "foo" in x), x)

quux a = let a = "foo"
         in a ++ "eek!"
quux' a = a ++ "eek!"

