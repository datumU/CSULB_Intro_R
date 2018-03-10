## script (2)
## definitions/dry explanation -> bulid a small function -> repeat

# hello world
# ask them to do their own simple arithmetic
# addition, subtraction pretty easy. multiplication, division, exponents


## build a single sandwich. Ask: which ingredients do we want to include on our sandwich?
## if they forget bread, they forget it. Tell them their sandwich won't hold, try again. (error catching)

print('bread')
print('lettuce')
print('bacon')
print('bread')

## whoops! forgot to add the tomato. Now I need to make the sandwich again.
skrrrahh('liljon1')

print('bread')
print('tomato')
print('lettuce')
print('bacon')
print('bread')

## nice. eat that sammich.
skrrrahh('liljon')



## What's better than eating a sandwich? eating a sandwich that someone (something) else made for us.
## I just want to tell the computer what to put on my sandwich and have the cpu make it for me.

## first need to tell the cpu which ingredients we have
ingredient1 <- 'bacon'
ingredient2 <- 'lettuce'
ingredient3 <- 'tomato'
ingredient4 <- 'mayo'

makeSandwich <- function(ingredients=(...)){

    # surround our ingredients with bread. c() stands for concatenate.
    # this means to join together two or more objects. An easy way to think of
    # c() is "combine."
    sandwich <- c('bread', ingredients, 'bread')

    # give the sandwich to you, i.e. print the sandwich to the console.
    print(sandwich)

}

makeSandwich(ingredients=c('bacon', 'lettuce', 'tomato', 'mayo'))



## now we can semi-automate our sandwich making!
## What if we could this on a larger scale and make some money?
## Perhaps open a restaurant?

## to do that, we need to more sandwiches. Let's serve BLTs, Grilled Cheese, and PB&J
ingredientsBLT <- c('bacon', 'lettuce', 'tomato')
ingredientsPBJ <- c('peanut butter', 'jelly')
ingredientsGCZ <- 'cheese'

## Now we need to take an order and determine the price
### (should I define ingredients outside of this fcn or inside?)
takeOrder <- function(sammichType){
    if(sammichType == 'Grilled Cheese'){
        ingredients <- ingredientsGCZ
        price <- 3
    }
    else if(sammichType == 'PBJ'){
        ingredients <- ingredientsPBJ
        price <- 4
    }
    else{
        ## fill in their code
        # ingredients <- ingredientsBLT
        # price <- 5
    }

    return(list(ingredients, price))
}

## explain going from vectors to lists. maybe draw an explanation?
## see RDS for short discussion and graphical representation

## need to also explain if/else, return statement vs. print








### logical: open or closed. categorical: customer is child, teen, adult, senior. Double: how many customers at one time, how many burgers/patties, etc.

## when a customer shows up, they first need to verify that you're actually open! We can think of
## this in the following terms: Is the restaurant open? T/F. This is usually based on what time it is
## so assuming the customer knows the time, they should know whether or not your store is open.

## assume we open at 8 and stay open all day.
openRRcheck <- function(time){print(time > 8)}

openRRcheck(9)
openRRcheck(7)
openRRcheck(8) ## hmmm, so we open at 8:01 then? want to fix this.
openRRcheck(1) ## 1 pm we're not open?? hmmm, need to handle am/pm.
## could add another argument for a,p. could use a time data format.
## could work on military time. let them decide and do this as exercise.
## have all examples to show once they wrap up.

## this also demonstrates code testing and building up/working your way towards
## some final function.

#...write fully functional openRRcheck. explain logical types

# have the openRRcheck working now, we need to now what kind of customer
# we're serving in case they get a discount: child, regular, senior

getAgeGrp <- function(customerAge){
    if(customerAge < 13){ageGrp <- 'child'}
    else if(customerAge < 65){ageGrp <- 'regular'}
    else{ageGrp <- 'senior'}

    return(ageGrp)
}

## what will happen if I type getAgeGrp(14)? (72)? 3.4? c(15,81)?


## we want it so that children get $2 off every order and seniors get 15% off
## For that, we need the age group, but more importantly, we need the prices!
## Since we want to write a generic algorithm to calculate the