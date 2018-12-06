def  recursion(n):
      result = n
      for i in (1, n):
	    result * = i
	    return result

number = int(input("Please print a number:"))
result = recursion(number)
print result
