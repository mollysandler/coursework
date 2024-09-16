def weight_on_planets(pounds, planet):
   if planet == "Mars" :
      return 0.38 * pounds
   elif planet == "Jupiter" :
      return 2.34 * pounds
   elif planet == "Venus" :
      return 0.91 * pounds
   elif planet == "Neptune":
      return 1.19 * pounds
   else:
      raise ValueError('Not a valid planet')

if __name__ == '__main__':
   pounds = float(input("What do you weigh on earth? "))
   print("\nOn Mars you would weigh", weight_on_planets(pounds, 'Mars'), "pounds.\n" +
          "On Jupiter you would weigh", weight_on_planets(pounds, 'Jupiter'), "pounds.\n" +
          "On Venus you would weigh", weight_on_planets(pounds, 'Venus'), "pounds.\n" +        
          "On Neptune you would weigh", weight_on_planets(pounds, 'Neptune'), "pounds.")