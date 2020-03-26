url <- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen"
text <- read_html(url)

#고객 평점
nodes <- html_nodes(text,".emph_grade")
point <- html_text(nodes)

#고객 리뷰
nodes <- html_nodes(text,".desc_review")
review <- html_text(nodes, trim=TRUE)
nodes <- html_nodes(text,xpath="//*[@id='mArticle']/div[]/div[]/div[]/ul/li[]/div/p/text()[]")

if(length(review) == 10) {
  #page <- cbind(point, review)
  page <- data.frame(평점=point, 리뷰=review)
  write.csv(page, "daummovie1.csv")
} else {
  cat("리뷰글이 생략된 데이터가 있네요ㅜㅜ\n")
}
