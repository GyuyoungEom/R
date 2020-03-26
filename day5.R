# 교재 81페이지
library()
installed.packages()
search()
read_excel()
install.packages("readxl")
library(readxl) # require(readxl)
excel_data_ex <- read_excel("book/data_ex.xls")
#tibble은 Advanced Dataframe, R에서는 기본 데이터 프레임은 아님!
getwd()
View(excel_data_ex)
search()

# 웹 크롤링과 스크래핑

install.packages("rvest") 
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text
str(text) #list로 객체처럼 만들어낸다는 것을 알 수 있음

nodes <- html_nodes(text, "div") #태그선택자이용해서 보냄
#css가 두번째 아규먼트. 3번째는 xpath
nodes
#xml_nodset이라는 게 만들어져서 div태그로 정의되어 있는 속성/내용을 읽어옴
title <- html_text(nodes)
#innerHTML과 비슷함!!!
#찾아진 nodes를 vector로 변환해줌
title

node1 <- html_nodes(text, "div:nth-of-type(1)")
#css선택자중 shadow선택자 선택 가능 (nth-of-type(1)하면 첫번째 div태그를 찾는 것)
node1
html_text(node1)
html_attr(node1, "style")
#찾아진 node에 대하여 두번째 아규먼트로 가져오는 속성값을 가져오는 것

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)
#속성이 없기때문에 html_attr따로 해주지 않음

# 단일 페이지(rvest 패키지 사용)
install.packages("rvest"); 
library(rvest)
text<- NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url,  encoding="CP949")
#encoding="UTF-8"줘도 됨
text
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point
nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
imsi <- html_text(nodes, trim=TRUE)
review <- imsi[nchar(imsi) > 0] 
review
if(length(review) == 10) {
  page <- cbind(title, point)
  page <- cbind(page, review)
  write.csv(page, "movie_reviews.csv")
} else {
  cat("리뷰글이 생략된 데이터가 있네요ㅜㅜ\n")
}