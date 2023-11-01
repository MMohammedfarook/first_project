#!/usr/bin/env python
# coding: utf-8

# In[76]:


import pandas as pd
import numpy as np
data=pd.read_csv("D:/IBM/market basket insights1.csv")
from mlxtend.frequent_patterns import apriori, association_rules
from mlxtend.preprocessing import TransactionEncoder
from matplotlib import pyplot as plt


# In[2]:


print(data)


# In[3]:


a=data.head(200)
print(a)


# In[4]:


data.columns


# In[5]:


data.tail


# In[6]:


#perprocessing
data.describe()


# In[7]:


data.isnull().sum()


# In[8]:


data.isnull().sum()


# In[9]:


data.BillNo=data.BillNo.fillna("unknow")


# In[10]:


print(data.BillNo)


# In[11]:


data.isnull().sum()


# In[12]:


data.Date=data.Date.fillna("unknow")


# In[13]:


data.Itemname=data.Itemname.fillna("unknow")


# In[14]:


data.Price=data.Price.fillna("unknow")


# In[15]:


data.CustomerID=data.CustomerID.fillna("unknow")
data.Country=data.Country.fillna("unknow")


# In[16]:


data.isnull().sum()


# In[17]:


data.info()


# In[18]:


data


# In[19]:


data.info()


# In[20]:


best_selling_items = data.groupby(['Country', 'Itemname']).agg({'Quantity': 'sum'}).reset_index()
best_selling_items = best_selling_items.groupby('Country').apply(lambda x: x[x['Quantity'] == x['Quantity'].max()]).reset_index(drop=True)
best_selling_items.sort_values("Quantity",ascending=False)


# In[21]:


from matplotlib import pyplot as plt
plt.bar(best_selling_items['Country'],best_selling_items['Itemname'])
plt.yscale('log')
plt.ylabel('Quantity')
plt.xticks(rotation=90)
plt.show()


# In[22]:


from matplotlib import pyplot as plt
plt.figure(figsize=(22,7))
plt.subplot(1,2,1)
a.Price.plot()
plt.title("Price")
plt.subplot(1,2,2)
a.Quantity.plot()
plt.title("Quantity")


# In[23]:


import seaborn as sns


# In[24]:


sns.heatmap(data.isnull())


# In[25]:


# Get the top 10 item names by count
top_10_items = data['Itemname'].value_counts().nlargest(10).index

# Filter the DataFrame to include only the top 10 item names
df_top_10 = data[data['Itemname'].isin(top_10_items)]

# Create a countplot for the top 10 item names
ax=sns.countplot(data=df_top_10, x='Itemname')
plt.xticks(rotation=90)


# In[26]:


data = data[data['Itemname'].notna()]
print("Number of unique items:", data['Itemname'].nunique())
print(data['Itemname'].value_counts(normalize=True)[:5])


# In[37]:


data.groupby('Itemname')['Quantity'].sum().sort_values(ascending=False)[:10].plot(kind='barh', title='Number of Quantity Sold')
plt.ylabel('Item Name')
plt.xlim(20000, 82000)
plt.show()

# Plotting the top 10 most sold products by count
data['Itemname'].value_counts(ascending=False)[:10].plot(kind='barh', title='Number of Sales')
plt.ylabel('Item Name')
plt.xlim(0, 10)
plt.show()


# In[46]:


#association rulls
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
from matplotlib import pyplot as plt
from mlxtend.frequent_patterns import apriori, association_rules
from mlxtend.preprocessing import TransactionEncoder


df = pd.read_csv("D:/IBM/market basket insights1.csv",names=['itemname'
],sep=',')  
a=df.head(500)  
print(a)
data = list(a["itemname"].apply(lambda x:x.split(",") ))
print(data)   

b = TransactionEncoder()
b_data = b.fit(data).transform(data)
df = pd.DataFrame(b_data,columns=b.columns_)
df = df.replace(False,0)
print(df)

df = apriori(df, min_support = 0.2, use_colnames = True, verbose = 1)
print(df)


# In[71]:


total_sales = data
total_sales["Total_Price"] = total_sales["Price"] * total_sales["Quantity"]
#total_sales.columns
total_sales_per_customer = total_sales.groupby(["CustomerID", "Country"]).agg({"Total_Price": "sum"})
total_sales_per_customer.head(10)


# In[72]:


total_sales_per_customer.reset_index(inplace=True)
total_sales_per_customer.sort_values(by = "Total_Price", ascending = False).head(10)


# In[87]:


total_sales_per_customer.groupby(["Country"]).agg({"Total_Price":"sum"}).reset_index().sort_values(by="Total_Price", ascending=False )


# In[ ]:




