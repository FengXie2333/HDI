#  python传参的方式

### 位置参数

&nbsp;

### 默认参数

在调用函数的时候给一些参数指定默认值

定义默认参数要牢记一点：默认参数必须指向不变对象！

![](https://i.loli.net/2018/12/09/5c0d238db31d8.jpg)

&nbsp;

### 可变参数

即在调用函数时，允许传入多个参数。例如元组，列表

&nbsp;

### 关键字参数

可变参数允许传入0个～多个参数，而关键字参数允许在调用时以字典形式传入0个或多个参数（注意区别，一个是字典一个是列表）；在传递参数时用等号（=）连接键和值

~~~
#用两个星号表示关键字参数
def person_info(name, age, **kw):
    print("name", name, "age", age, "other", kw)

>>> person_info("Xiaoming", 12)
name Xiaoming age 12 other{}
>>> person_info("Dahuang", 35, city = "Beijing")
name Dahuang age 35 other {'city':'Beijing'}
~~~

&nbsp;

### 命名关键字参数

命名关键字参数在关键字参数的基础上限制传入的的关键字的变量名

 和普通关键字参数不同，命名关键字参数需要一个用来区分的分隔符\*，它后面的参数被认为是命名关键字参数

~~~
#这里星号分割符后面的city、job是命名关键字参数
person_info(name, age, *, city, job):
    print(name, age, city, job)

>>> person_info("Alex", 17, city = "Beijing", job = "Engineer")
Alex 17 Beijing Engineer 
~~~

**如果参数中已经有一个可变参数的话，前面讲的星号分割符就不要写了（其实星号是写给Python解释器看的，如果一个星号也没有的话就无法区分命名关键字参数和位置参数了，而如果有一个星号即使来自变长参数就可以区分开来）**

~~~
#args是变长参数，而city和job是命名关键字参数
person_info(name, age, *args, city, job):
    print(name, age, args, city)

>>> person_info("Liqiang", 43, "balabala", city = "Wuhan", job = "Coder")
Liqiang 43 balabala Wuhan Coder
~~~

&nbsp;

### 参数组合

总结一下，在Python中一种可以使用5中传递参数的方式（位置参数、默认参数、变长参数、关键字参数、命名关键字参数）

注意，这些参数在书写时要遵循一定的顺序即：**位置参数、默认参数、变长参数、关键字参数、命名关键字参数**



---------------------
作者：吃面包的科学怪人 
来源：CSDN 
原文：https://blog.csdn.net/abc_12366/article/details/79627263 