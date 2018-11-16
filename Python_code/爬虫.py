# coding: UTF-8
import requests
url = 'https://storage.googleapis.com/linnarsson-lab-www-blobs/blobs/cortex/expression_mRNA_17-Aug-2014.txt'
path = 'demo.txt'
r  = requests.get(url)
print('ok')
with open(path, 'w', encoding = 'utf-8') as f:
    f.write(r.content.decode('utf-8') )
f.close()