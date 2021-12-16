json.extract! newspaper, :id, :newspaperName, :newspaperUrl, :newspaperCssSelector, :created_at, :updated_at
json.url newspaper_url(newspaper, format: :json)
