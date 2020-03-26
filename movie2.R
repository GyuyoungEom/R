site <- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page="
text <- NULL
movie.review <- NULL
for(i in 1: 5) {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  nodes <- html_nodes(text,".desc_review")
  review <- html_text(nodes, trim=TRUE)
  nodes <- html_nodes(text,".emph_grade")
  point <- html_text(nodes)
  page <- cbind(point, review)
  movie.review <- rbind(movie.review, page)
}
write.csv(movie.review, "daummovie2.csv")

#무한루프로 해서 돌려보기
