import lxml
import requests
from bs4 import BeautifulSoup as bs

response=requests.get('https://www.kernel.org')
dom = bs(response.text, 'lxml')
result = dom.find_all('td', {'id':'latest_link'})

version = result[0].contents[1].contents[0]
link = result[0].contents[1]["href"]

print(version)
