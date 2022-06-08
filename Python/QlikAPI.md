import string
import pandas as pd
import sqlalchemy
import sqlalchemy.engine
import requests
import numpy as np
import json
from pandas import json_normalize
# from pandas.io.json import json_normalize
from datetime import datetime, timedelta
#=====DB Connect====#
# engine = sqlalchemy.create_engine('mssql+pyodbc://sa:erp@10.168.2.127/ARCBLL?driver=SQL+Server')
# engine.connect()
#=====API Connect====#
yesterday1 = datetime.now() - timedelta(1)
yesterday = datetime.now() - timedelta(2)
currentDate = datetime.strftime(yesterday, '%Y-%m-%d')
currentDate1 = datetime.strftime(yesterday1, '%Y-%m-%d')
print(currentDate)
url = "https://erp-bi.ap.qlikcloud.com/api/v1/audits/archive?date=" + str(currentDate)
#start_task_date=01-Jun-2022&end_task_date=07-Jun-2022
payload={}
#=====Get Data====#
headers = {
  'Authorization': 'Bearer eyJhbGciOiJFUzM4NCIsImtpZCI6IjVkNmIyNDY0LWNhZDYtNDU0ZC05YmVkLWE0MjUxM2Q5YzA4MSIsInR5cCI6IkpXVCJ9.eyJzdWJUeXBlIjoidXNlciIsInRlbmFudElkIjoiVmxhSldsMm1OdWRTcWhIU1VhY3BlV2RBZWl5U1RiMGsiLCJqdGkiOiI1ZDZiMjQ2NC1jYWQ2LTQ1NGQtOWJlZC1hNDI1MTNkOWMwODEiLCJhdWQiOiJxbGlrLmFwaSIsImlzcyI6InFsaWsuYXBpL2FwaS1rZXlzIiwic3ViIjoib3RXNzhQTkhoUXdyZ1U4dnBBcWE1UDlmZjZwaF8wbWgifQ.Ct7ObPp7CNZoWhiuTbDEUy6aLagLaPFgdJkpghj7npns2ahVnOryZGDahp7hc2UKdGxNzZvaLqi6LqwqzfLJrPBHikU4kMaq-svTpeuuE7YXseU_POON6An8_e6uHYWn'
}
response = requests.request("GET", url, headers=headers, data=payload)
#=====Tranform Data to Text====#
respons = response.text
#=====Tranform Text to python object====#
respons = json.loads(respons)
#=====Tranform json string to pandas DataFrame ====#
df = json_normalize(respons['data']).astype(str)
#=====Fill null value with Nan====#
df = df.fillna(value = np.nan)
#=====Write dataframe to SQL Server====#
df.to_excel('data.xlsx')
# df.to_sql(name='QlikSenseAuditLog_erp-bi_1', con=engine, index=False, if_exists='append', dtype=sqlalchemy.types.NVARCHAR)
