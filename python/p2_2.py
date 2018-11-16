import random

secret = random.randint(1,10)
temp = input("Guess a number please:")
guess = int(temp)

while guess != secret:
      temp = input("Please guess agian")
      guess = int(temp)

      if guess == secret:
            print("You are right!")
      else:
            if guess < secret:
                  print("Please guess a bigger number!")
            else:
                  print("Please guess a smaller number!")
            
print("Game over!")
