url <- "http://media.daum.net/ranking/popular/"
text <- read_html(url)

#뉴스 제목
news.title <- html_nodes(text,'#mArticle > div > ul > li > div.cont_thumb > strong > a')
title <- html_text(news.title)

#신문사
newspaper <- html_nodes(text,'span.info_news')
site <- html_text(newspaper)

news <- data.frame(newstitle=title, newspapername=site)
write.csv(news,"daumnews.csv")
#read.csv("daumnews.csv")