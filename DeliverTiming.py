#!/usr/bin/env python
# coding: utf-8

# In[8]:


import pandas as pd


# In[9]:


delv = pd.read_csv("C:\\Users\\acer\\Desktop\\Data science Assignment\\anup assignment\\SimpleLinearRegression-master\\delivery_time.csv")


# In[10]:


delv.head(10)


# In[11]:


print(delv.info())
print(delv.shape)
print()
print(delv.describe())


# In[12]:


import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib import style
import numpy as np


# In[13]:


x = sns.PairGrid(delv,height=5,aspect=2.5)
x.map_diag(plt.hist,histtype='step',linewidth=3)
x.map_offdiag(plt.scatter,marker='*',linewidth=9)

plt.show(x)


# In[14]:


from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression


# In[15]:


x = np.array([delv['Sorting Time']]).reshape(-1,1)
y = np.array([delv['Delivery Time']]).reshape(-1,1)


# In[16]:


xTrain,xTest,yTrain,yTest = train_test_split(x,y,test_size=0.8)


# In[17]:


reg = LinearRegression()


# In[18]:


lr = reg.fit(xTrain,yTrain)


# In[19]:


print(lr.intercept_)
print(lr.coef_)


# In[20]:


yPred = lr.predict(xTest)


# In[21]:


preds = pd.DataFrame({'Actual':yTest.flatten(),'Predicted':yPred.flatten()})


# In[22]:


from sklearn.metrics import mean_squared_error,r2_score


# In[23]:


mse = mean_squared_error(yTest,yPred)
r2 = r2_score(yTest,yPred)


# In[24]:


print(mse)
print(r2)


# In[25]:


plt.figure(figsize=(18,9))
sns.lineplot(data=preds)
plt.show()


# In[ ]:





# In[ ]:




