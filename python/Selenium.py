
# coding: utf-8

# In[ ]:


gene_list = {{genelist}}


# In[ ]:


genelist = []
with open(gene_list) as genefile:
    gene = csv.reader(genefile, delimiter = ',')
    
    for row in gene:
        genelist.append(row)


# In[1]:


from selenium import webdriver

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import NoAlertPresentException
import unittest, time, re

from selenium.webdriver.chrome.options import Options


# In[55]:


from bs4 import BeautifulSoup
import csv


# In[59]:


def dic2csv(dict, file):
    with open(file,'w') as f:
        w = csv.writer(f)
        w.writerows(dict.items())


# In[14]:


chrome_options = Options()
chrome_options.add_argument("--headless")   
driver = webdriver.Chrome(chrome_options=chrome_options)     # 打开 Chrome 浏览器


# In[15]:


result =  {}
for gene in genelist:
    driver.get("https://www.genecards.org/")
    driver.find_element_by_xpath("(.//*[normalize-space(text()) and normalize-space(.)='Explore a Gene'])[1]/following::input[1]").clear()
    driver.find_element_by_xpath("(.//*[normalize-space(text()) and normalize-space(.)='Explore a Gene'])[1]/following::input[1]").send_keys(gene)
    driver.find_element_by_xpath("(.//*[normalize-space(text()) and normalize-space(.)='Explore a Gene'])[1]/following::input[1]").send_keys(Keys.ENTER)
    driver.find_element_by_xpath("//section[@id='aliases_descriptions']/div/div/div[2]/h3").click()
    code = driver.page_source
    
    soup = BeautifulSoup(code, 'html.parser')
    title = soup.title.string
    converse_gene = title.split(" ")[0]
    result[gene] = converse_gene


# In[62]:


dic2csv(result, "result.csv")


# In[ ]:




