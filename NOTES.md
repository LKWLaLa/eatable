http://www.menupages.com  (new york city_name = "www")

http://sanfrancisco.menupages.com/

http://losangeles.menupages.com/

http://washingtondc.menupages.com/

http://southflorida.menupages.com/

citypg.css('#image-map area').first.attr('href')
neighb_pg.css('tbody').first
neighb_pg.css('tbody tr td a').first.attr('href')
=> "/restaurants/zigo/"

Should I refactor to find correct css selector, so I don't need to filter for grubhub and seamless?

In case I want to add zip code:  menupg.css('span.city-zip').text

/\u00A0/  Regex for nbsp characters (to get rid of the weird spaces!!)





