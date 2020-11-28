import newspaper
bbc_paper = newspaper.build('https://www.bbc.com/news', memoize_articles=False)
first_article = bbc_paper.articles[1]
first_article.download()
first_article.parse()
print(first_article.title)
first_article.nlp()
print(first_article.summary)
