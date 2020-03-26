#LIST
v<-c(1,2,3)
l<-list(1,2,3)
#데이터 셋들을 포장해서 담았기 때문에, 결과값이 벡터랑 다름.
v
#v*3할 경우 각각의 원소에 3을 곱해서 출력함
l
#l*3할 경우에는 error발생. list안에 있는 데이터값들은 그냥 들어가 있는 것이 아닌 포장되어서 들어있기 때문
#벡터는 벡터 연산을 할 수 있지만 리스트는 불가하다!!!!
#unlist함수를 이용하여 list형태를 푼 후에 연산 가능~!~!
v[1]
l[1]
#l[1]은 연산 불가 = 포장된 상태로는 연산 불가
l[[1]]
#l[[1]] 겹 대괄호를 할 경우 => 포장지를 벗겨내고 알맹이만 달라!!!
#이 경우에는 이항연산 가능 + $연산자도 가능하지만, 이때에는 이름이 있어야 함

lds <- list(1,2,3) 
lds
lds+100
unlist(lds)
unlist(lds)+100
lds[1]
lds[1]+10
lds[[1]]+10

#list에 이름부여하기
names(lds) <- LETTERS[1:3]
lds
lds[[2]]
lds[["B"]]
lds$B
#숫자 인덱스/ 이름 인덱스/ $B 모두 사용 가능
#이름이 있는경우에 한해 lds$B를 가장 많이 사용

a<-list(
  a = 1:3,
  b = "a string",
  c = pi,
  d = list(-1,-5)
)

a[1]
a[[1]] # a[["a"]]
a$a
a[[1]][1]
a$a[1]
# a[[1]][1]와 a$a[1]의 결과는 같음!!
a[1]+1
a[[1]]+1
a[[1]][2] <- 100
new_a <- unlist(a[1])
a[1]; new_a
names(a) <- NULL
names(new_a) <- NULL



ls()
length(ls())
save(list=ls(),file="all.rda") # varience will save in "all.rda" of rexam
#객체 상태 그대로를 이미지로 저장
#현재 워킹 디렉토리에 "all.rda"라는 이름으로 저장할래~
#확장자는 rda, rdata모두 가능
rm(list=ls())
#삭제하고 싶은 객체의 이름을 주면 되는데, ls()의 list들을 모두 삭제
ls()
load("all.rda")
#보관되어 있던거 그대로 불러옴!!
# 얘 시험이야~~~~~~~~~~~~~~~~~~~~~~~~~~
ls()

#read file data

#scan은 숫자를 읽어오는게 특화되어있음
#numeric벡터를 자동으로 읽어다줌
#default는 무조건 숫자기본!!!!!
nums <- scan("data/sample_num.txt")

word_ansi <- scan("data/sample_ansi.txt")
#에러남!!
word_ansi <- scan("data/sample_ansi.txt",what="")
#what이라는 매개변수에 null을 줘서 구성하고 있는 word/ character벡터를 만들어줌
words_utf8 <- scan("data/sample_utf8.txt", what="",encoding="UTF-8")
words_utf8_new <- scan("data/sample_utf8.txt", what="")

#readLines는 일반 텍스트파일일 경우(일정한 규격이 없을 경우) 행단위로 읽는 것이 기본 => 벡터로 리턴
lines_ansi <- readLines("data/sample_ansi.txt")
lines_utf8 <- readLines("data/sample_utf8.txt")
#encoding을 할 경우, 글씨가 깨져서 나옴
#R에서 읽어오는 파일의 default값은 ansi이다.
#따라서, 그대로 사용할 경우 (특히 한글)깨짐
lines_utf8 <- readLines("data/sample_utf8.txt",encoding="UTF-8")
#UTF-8문서를 읽어올거면 무조건 encoding UTF-8로 가져와야함!!!
#반드시 대문자 UTF-8로 해줘야함!!!!!!!!!!!!!!!

#read.csv는 각각의 열에 대한 구분을 ,로 구분.
#read.table의 특별한 형태가 read.csv (document도 같음)
#seperate하는걸 따로 설정해두지 않으면 " "(blanc)로 구분
df2 <- read.table("data/product_click.log")
#헤더는 자동으로 V1, V2로 설정되어있음. 이를 names함수 이용해서 수정 가능

str(df2)
#숫자가 크면 지수형태로 내보냄
#V1은 날짜로 구성해놨지만, 얘네는 숫자로 인식
#str에도 stringAsFactors 속성있음. F로 줘서 Factor로 구분하지 않고 읽어올 수 있음
head(df2)
summary(df2$V2)

cat("R", "은 통계분석 ", "전용 언어입니다.","\n")
#print(paste("R", "은 통계분석 ", "전용 언어입니다."))와 같은 결과


for(data in month.name) 
  print(data)

for(data in month.name) 
  cat(data,"\n")
#cat은 무조건 한 줄로 내보내는 것이 원칙

sum <- 0
for(i in 5:15){
  if(i%%10==0){
    break
  }
  sum <- sum + i
  #print(paste(i,":",sum))
  #print에는 앞에 인덱스를 내보내는 것이 기본으로 설정되어 있기 때문에 데이터셋을 내보내기 적합함
  cat(i,":",sum,"\n") #이것도 가능, cat은 데이터의 인덱스를 내보내주는 기능이 없음
}


sum <-0
for(i in 5:15){
  if(i%%10==0){
    next;  #continue
    #건너뛰는 next!!! 따라서, 10을 제외한 나머지만 for문돌아감
  }
  sum <- sum + i
  print(paste(i,":",sum))
}

sumNumber <- 0
while(sumNumber <= 20) { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
} 

repeat {
  cat("ㅋㅋㅋ\n")
}


sumNumber <- 0
repeat { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
  if(sumNumber > 20)
    break;
}

#제어문
#if else
randomNum <-sample(1:10,1)
if(randomNum>5){
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

if(randomNum%%2 == 1){
  cat(randomNum,";홀수\n")
}else{
  cat(randomNum,";짝수","\n")
}


if(randomNum%%2 == 1){
  cat(randomNum,";홀수","\n")
}else{
  cat(randomNum,";짝수","\n")
}

score <- sample(0:100, 1)  # 0~100 숫자 한 개를 무작위로 뽑아서
if (score >=90){
  cat(score,"는 A등급입니다","\n")
}else if (score >=80){
  cat(score,"는 B등급입니다","\n")
}else if (score >=70){
  cat(score,"는 C등급입니다","\n")
}else if (score >=60){
  cat(score,"는 D등급입니다","\n")
}else {
  cat(score,"는 F등급입니다","\n")
}

#for문
#for 실습
for(data in month.name) 
  print(data)
for(data in month.name)print(data);print("ㅋㅋ")
for(data in month.name){print(data);print("ㅋㅋ")}

for(n in 1:5)
  cat("hello?","\n")

for(i in 1:5){
  for(j in 1:5){
    cat("i=",i,"j=",j,"\n")
  }
}
# 구구단
for(dan in 1:9){
  for(num in 1:9){
    cat(dan,"x",num,"=",dan*num,"\t") 
    # \n : 개행문자, \t : 탭문자
  }
  cat("\n")
}


bb <- F
for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      bb<-T
      break
      #안에 반복문만 break
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
  if(bb) #bb가 TRUE이면
    break
  #한꺼번에 나갈 수 없음. 따라서, 변수를 하나 설정해줘서 나가도록 해야함
}

#while문
i<-1
while(i <= 10){
  cat(i,"\n")
  i <- i+1
}
cat("종료 후 :",i,"\n")

i<-1
while (i<=10) {
  cat(i,"\n")
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+2
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+1
}

#switch 문을 대신하는 함수
month <- sample(1:12,1)
month <- paste(month,"월",sep="") # "3월"  "3 월"
result <- switch(EXPR=month,
                 "12월"=,"1월"=,"2월"="겨울",
                 "3월"=,"4월"=,"5월"="봄",
                 "6월"=,"7월"=,"8월"="여름",
                 "가을")
#month는 character형. 처리식이 문자열데이터
#blanc가 하나라도 있을 경우 문자열 비교가 불가능(거짓으로 나옴)
cat(month,"은 ",result,"입니다\n",sep="")

num <- sample(1:10,1)
num
switch(EXPR = num,"A","B","C","D")
#대입연산자가 아닌 이상 다 print됨
#num이 범주안에 없을 경우, 아무것도 안나옴(default값을 지정하지 못함)

for(num in 1:10){
  cat(num,":",switch(EXPR = num,"A","B","C","D"),"\n")
}

for(num in 1:10){
  num <- as.character(num)
  # paste0(num,"") -> 이렇게 할 수도 있는데, 이건 되게 촌스러운 방법!!!
  cat(num,":",switch(EXPR = num,
                     "7"="A","8"="B","9"="C","10"="D","ㅋ"),"\n")
}


# 함수 정의와 활용

func1 <- function() {
  xx <- 10   # 지역변수
  yy <- 20
  return(xx*yy)
}
#R은 return문이 아니라 return 함수!!
func1()

result <- func1()
result
xx  # 오류발생


func2 <- function(x,y) {
  xx <- x
  yy <- y
  return(sum(xx, yy))
}

func2()    # 기본값이 없는 인수 "x"가 누락되어 있습니다
func2(5,6) # 식 : 연산식, 호출식, 변수, 리터럴

func3 <- function(x,y) {
  #x3 <- x+1
  #y3 <- y+1
  x4 <- func2(x+1, y+1)  # 값(식) : 변수, 리터럴, 연산식, 호출식
  return(x4)
}

func3(9, 19)  # 30

func4 <- function(x=100, y=200, z) {
  #x와 y는 선택적이고, z는필수!!!
    return(x+y+z)
}
func4()
func4(10,20,30)
func4(x=1,y=2,z=3)
func4(y=11,z=22,x=33)
func4(z=1000)  

# 쉬트에 있는 함수 코드
f1 <- function() print("TEST")
f1()
r <- f1()
r
f2 <- function(num) {print("TEST"); print(num) }
f2(100)
f2()
f3<- function (p="R") print(p)
f3()
f3(p="PYTHON")
f3("java")
f4<- function (p1="ㅋㅋㅋ",p2) for(i in 1:p2) print(p1)
f4(p1="abc", p2=3)
f4("abc", 3) 
f4(5) 
f4(p2=5) 
f5<- function(...) { print("TEST"); data <- c(...); print(length(data))}
f5(10, 20, 30)
f5("abc", T, 10, 20)
f6<- function(...) {
  print("수행시작")
  data <- c(...)
  for(item in data) {
    print(item)
  }
  return(length(data))
}
f6()
f6(10)
f6(10,20)
f6(10,20,30)
f6(10,'abc', T, F)

f7<- function(...) {
  data <- c(...)
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}
f7(10,20,30)
f7(10,20,'test', 30,40)

f8<- function(...) {
  data <- list(...)
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}

f8(10,20,30)
f8(10,20,"test", 30,40)