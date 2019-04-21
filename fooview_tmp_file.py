import requests
import re

magic = r'<i class="dashicons dashicons-chart-area"><\/i>\n\t*(.+?)\t\t<\/span>\n.+?"><\/i>\n\t{4}(.+?)\t{3}<\/span>.+?(Updated .+?)\t{2}<\/span>.+?<a href="https:\/\/wordpress\.org\/plugins\/(.+?)\/'

for id in range(1, 50):
	r = requests.get("https://wordpress.org/plugins/browse/popular/page/" + str(id) + "/")
	data = re.findall(magic, r.text, re.DOTALL)
	for plugin in data:
		print(plugin)