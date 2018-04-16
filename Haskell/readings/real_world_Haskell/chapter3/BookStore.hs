-- file: ch03/BookStore.hs
type ReviewBody = String
data BookInfo = Book Int String [String]
                deriving (Show)

myInfo = Book 9780135072455 "Algebra of Programming"
         ["Richard Bird", "Oege de Moor"]

data BookReview = BookReview BookInfo CustomerID ReviewBody
type BookRecord = (BookInfo, BookReview)

type CustomerID = Int
type Cardholder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber Cardholder Address
                 | CashOnDelivery
                 | Invoice CustomerID -- no argument for Invoce constructor, when we want to print it, no instance error
                   deriving (Show)
-- pattern matching with the use of wild card
bookID      (Book id _ _     ) = id
bookTitle   (Book _ title _  ) = title
bookAuthors (Book _ _ authors) = authors
-- record synta with {}
data Customer = Customer {
      customerID      :: CustomerID
    , customerName    :: String
    , customerAddress :: Address
    } deriving (Show)

customer1 = Customer 271828 "J.R. Hacker"
            ["255 Syntax Ct", "Milpitas, CA 95134", "USA"]
-- we can vary the oder in which we list fields
customer2 = Customer {
              customerID = 271828
            , customerAddress = ["1048576 Disk Drive",
                                 "Milpitas, CA 95134",
                                 "USA"]
            , customerName = "Jane Q. Citizen"
            }

