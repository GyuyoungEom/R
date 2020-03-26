url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)

#<h1> 태그의 컨텐츠
h1.nodes <- html_nodes(text, "h1")
tag.h1 <- html_text(h1.nodes)

#텍스트 형식으로 내용을 가지고 있는 <a> 태그의 컨텐츠와 href 속성값
a.nodes <- html_nodes(text,"a")
tag.a <- html_text(a.nodes)
a.href <- html_attr(a.nodes,"href")

#<img> 태그의 src 속성값
img.nodes <- html_nodes(text,"img")
img.src <- html_attr(img.nodes,"src")

#첫 번째 <h2> 태그의 컨텐츠
h2.nodes.1 <- html_nodes(text,"h2:nth-of-type(1)")
tag.h2.1 <- html_text(h2.nodes.1)

#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
ul.nodes <- html_nodes(text,"ul>*[style$=green]")
ul.style <- html_text(ul.nodes)

#두 번째 <h2> 태그의 컨텐츠
h2.nodes.2 <- html_nodes(text,"h2:nth-of-type(2)")
tag.h2.2 <- html_text(h2.nodes.2)

#<ol> 태그의 모든 자식 태그들의 컨텐츠 
ol.nodes <- html_nodes(text,"ol>*")
tag.ol <- html_text(ol.nodes)

#<table> 태그의 모든 자손 태그들의 컨텐츠 
table.nodes <- html_nodes(text,"table *")
tag.table <- html_text(table.nodes)

#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
tr.nodes <- html_nodes(text,"tr.name")
class.name <- html_text(tr.nodes)

#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
id.nodes <- html_nodes(text,"td#target")
id.target <- html_text(id.nodes)
