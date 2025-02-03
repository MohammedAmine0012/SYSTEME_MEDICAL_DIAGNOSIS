import requests
from bs4 import BeautifulSoup
import pandas as pd

# URL of the Wikipedia page
url = "https://fr.wikipedia.org/wiki/Régions_du_Maroc"

# Send a GET request to the URL
response = requests.get(url)
response.raise_for_status()  # Ensure the request was successful

# Parse the HTML content
soup = BeautifulSoup(response.text, 'html.parser')

# Find the table containing "Préfectures et Provinces" and "Région"
table = soup.find('table', {'class': 'wikitable'})

# Initialize lists to store the data
regions = []
provinces = []

# Extract table rows, skipping the header
rows = table.find_all('tr')[1:]

# Iterate through each row to extract data
for row in rows:
    cells = row.find_all('td')
    if len(cells) >= 2:  # Ensure the row has both columns
        region = cells[1].get_text(strip=True)  # Extract the "Région" column
        prefectures_provinces = cells[0].get_text(strip=True)  # Extract "Préfectures et Provinces"
        
        # Split provinces/prefectures by commas or newline (adjust based on the content)
        for item in prefectures_provinces.split(','):
            regions.append(region)
            provinces.append(item.strip())

# Create a DataFrame
df = pd.DataFrame({
    'Region': regions,
    'Province/Prefecture': provinces
})

# Save to CSV
df.to_csv('regions_and_provinces_morocco.csv', index=False, encoding='utf-8')

print("Data scraped successfully and saved as 'regions_and_provinces_morocco.csv'.")
