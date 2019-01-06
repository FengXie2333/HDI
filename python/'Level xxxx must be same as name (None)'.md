#  'Level XXXXXX must be same as name (None)'

~~~python
name = df['name'])
name.count('XXXXX')
~~~

```python
KeyError: 'Level ZYLib20170921-GCLMT must be same as name (None)'
```

debug:

reason:name的type不对

![](https://i.loli.net/2018/12/20/5c1b0a994d0c4.jpg)

修改：

~~~python
name = list(df['name])
~~~

