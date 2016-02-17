http://www.menupages.com  (new york city_name = "www")

http://sanfrancisco.menupages.com/

http://losangeles.menupages.com/

http://philadelphia.menupages.com/

http://boston.menupages.com/

http://chicago.menupages.com/

http://washingtondc.menupages.com/

http://southflorida.menupages.com/

citypg.css('#image-map area').first.attr('href')
neighb_pg.css('tbody').first
neighb_pg.css('tbody tr td a').first.attr('href')
=> "/restaurants/zigo/"


It occurs to me that having self.input as an instance variable in the CLI class, changing each time might not be a good idea.  It solves the need to call on other methods for return values (which is hard, if you also want to puts something in that method - each method has a separate menu), but if a user wants to go back to choose another something....  would having an instance variable be problematic or helpful?  Maybe I should use a different variable for each selection...


Getting confused about what to store in what class... And which class should be responsible, the CLI or the scraper?  Should neighborhood_url be a method or an instance variable?


