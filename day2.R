# matrix 실습
x1 <-matrix(1:8, nrow = 2)
x1
#행이 2개이기 때문에 2*4 matrix생성성
x1<-x1*3
x1
#각각의 원소마다 3을 곱함
sum(x1); min(x1);max(x1);mean(x1)
#벡터가 왔는지, 매트릭스가 왔는지 확인하기 위해서 typeof(x)로 확인!!!!
x2 <-matrix(1:8, nrow =3)
x2
#수가 맞지 않을 경우, 반복해서 채워줌

(chars <- letters[1:10])
#소괄호로 묶어줄 경우 : 대입해준 후 어떤 원소들이 들어가 있는지 알 수 있음
#즉, 대입된 내용을 바로 확인 가능 (print함수의 기능까지 갖고있는 것)
mat1 <-matrix(chars)
#행/열을 따로 설정해주지 않았음. 열을 우선적으로 채워주기 때문에 행의 갯수가 없으면 1열짜리 매트릭스를 만들어냄
mat1; dim(mat1)
#dim함수는 몇 행/ 몇 열인지 알려주는 함수
matrix(chars, nrow=1)
matrix(chars, nrow=5)
matrix(chars, nrow=5, byrow=T)
matrix(chars, ncol=5)
matrix(chars, ncol=5, byrow=T)
matrix(chars, nrow=3, ncol=5)
matrix(chars, nrow=3)


vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1
#각각의 행마다 이름이 부여됨(vec1,vec2,vec3)
mat2 <- cbind(vec1,vec2,vec3); mat2
#rbind와 cbind 모두 가변형 인자를 가짐.
#행의 인덱스와 열의 인덱스로 이름을 붙여줌.
mat1[1,1] #매트릭스 형태를 깨고 벡터의 형태로 만들어 냄
mat1[2,];mat1[,3]
mat1[1,1,drop=F]
#매트릭스의 형태를 깨트리고 싶지 않으면, drop 속성을 이용함
#drop의 default값은 T
#함수 내에 꼭 매트릭스 구조만 와야 할 수 있음. 그 때 꼭 drop이라는 속성을 이용하여 매트릭스 형태 유지해주기.
mat1[2,,drop=F];mat1[,3,drop=F]

rownames(mat1) <- NULL
colnames(mat2) <- NULL
mat1;mat2
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
#이름과 인덱스 모두 인덱싱 가능
ls()
#만들어진 변수의 이름을 모두 가져옴
mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2)
#열단위로 summary하여 각각을 나타냄

mean(x2[2,])
sum(x2[2,])
rowSums(x2); colSums(x2)

apply(x2, 1, sum); apply(x2, 2, sum)  
#x2에 대하여 행 단위로 함수(sum)를 수행하라 아규먼트로 함수이름 전달. =rowsums
#두번째 아규먼트 1 :행단위 / 2 :열단위
?apply
#구글에서 검색할 때, in R을 덧붙이면 R에서 찾겠다~
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)


#Array실습
a1 <- array(1:30, dim=c(2,3,5))
#dim이라는 매개변수에 몇 행, 몇 열, 몇 층인지 알려줌
a1

a1[1,3,4];a1[1,3,4, drop=F]
a1[,,3]
a1[,2,]
#모든 층에 대한 2열 데이터들을 뽑아냄
a1[1,,]
#모든 층의 1행 데이터를 뽑아냄

getwd()
#현재의 working directory 알려주는 함수

# factor 실습

score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
#numeric vector
class(score)
summary(score)

f_score <- factor(score)
#vector를 factor로 만들 때, as.factor해도 되고, 그냥 factor라고 해도 됨
class(f_score)
f_score
#따로 level을 지정해주지 않았기 때문에, 자동으로 1~5로 지정해줌
summary(f_score)
#factor에 대한 summary는 각각의 데이터에 대한 갯수를 세줌
#table이라는 함수도 비슷한 역할
#나중에 data mining할 때, 어떤 단어를 몇 번 포함하고 있는지와 같은 지를 체크함
levels(f_score)
 
plot(score)   #산점도
plot(f_score) #막대그래프 나옴
#plot 그래프그리는 함수
#하나의 그래프 영역에는 고수준 함수 하나만 적용 가능

data1 <- c("월","수","토","월",
           "목","화")
data1
class(data1)
#데이터 셋의 종류를 알려주는 역할이지만, 벡터의 경우 타입만 내보냄
summary(data1)
#named vector로 내보냄
day1 <- factor(data1)
day1
class(day1)
summary(day1)
levels(day1)
#level을 따로 argument로 지정해줘야 원하는 결과를 얻기 쉬움
#default값은 data set에 설정되어 있는 data가 기준이 됨
week.korabbname <- c("일", "월", "화",
                     "수", "목", "금", "토")
day2 <- factor(data1, 
               levels=week.korabbname)
day2
summary(day2)
#factor 데이터 안에 있는 값들의 갯수를 세줌
levels(day2)

btype <- factor(
  c("A", "O", "AB", "B", "O", "A"), 
  levels=c("A", "B", "O"))
#정해진 범주에 값이 없는 경우, 그 값은 NA처리 해버림. 즉, level이 우선순위가 높음

btype
summary(btype)
levels(btype)

gender <- factor(c(1,2,1,1,1,2,1,2), 
                 levels=c(1,2), 
                 labels=c("남성", "여성"))
#1=남성, 2=여성으로 표기
gender
summary(gender)
levels(gender)

# 내장 데이터셋
data()
#베이스 패키지에 있는 데이터는 자동으로 사용할 수 있게 되어있음
iris; head(iris);tail(iris) 
#head : 앞에서부터 6개//tail : 뒤에서부터 6개
#아규먼트 바꿔주면, 원하는 개수로 확인 가능
View(iris)
#명령어// R에서는 함수로 존재하지만, 실제로는 명령어다!!
str(iris)
#vector에서는 별 의미 없음
# 150 obs. // 관측치(행)이 150개
#어떤 데이터들이 갖고있게 될 변수
#변수의 의미 : IT = 메모리 상의 방/ 통계학 = 데이터를 구성하고 있는 속성을 보관하는 방
library()
#R이 설치되면서 같이 설치된 package를 나타내줌
#여기서 base 패키지는 java.lang과 같이 기본패키지로 생각하면 됨
#R은 이미 여러가지 api를 갖고 있으며, 내장된 데이터도 있음

#Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
str(fruit)
View(fruit)

fruit[1,]
fruit[-1,]
fruit[,2]
fruit[,3] # fruit[,3, drop=F]
fruit[, c(3,4)]
#데이터 구조가 깨지지 않아야 할 것 같으면, 자동으로 깨트리지 않고 내보내줌
fruit[3,2]
fruit[3,1]

fruit[,3]
fruit$qty #이게 가장 가독성이 좋음. 이거 많이 사용하자~~~~ (자바의 .연산자가 R에서는 $연산자)
#자바에서는 $가 식별자로 사용 가능. R에서는 이게 연산자!!
fruit[[3]]
fruit[3]  # 데이터프레임 형식 유지
#위에 4가지 모두 3번째 열을 꺼내는 것.
# 마지막꺼만 데이터 프레임 형식 유지.

str(fruit$qty)
str(fruit[3])

# dataframe exam1_DoIt 에 있는 data sample들. 필요하면 책사서 봐보기~~
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum)
df_midterm
str(df_midterm)
#이 결과로 나오는 num은 number가 아닌 numeric!
colnames(df_midterm)
rownames(df_midterm)
names(df_midterm) # =colnames(df_midterm) : 열 우선이기 때문에 names는 colnames의미
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))
colnames(df_midterm2)
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
#colum명이 이상하게 변하는 것을 막기위해 이렇게 넣어도 됨!! 변수명 한글도 가능~~
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류 - 갯수가 맞지 않아서 오류남. 
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
str(df)
df$var_sum <- df$var1 + df$var2
#이미 만들어져 있는 컬럼에 새로이 추가할 수 있음. (행단위로)
#df라는 데이터 프레임에 var_sum을 추가할거야~
#거기 안에는 df가 갖고 있는 var1의 값과 var2의 값을 더해서 담아줄거야~~
df$var_mean <- df$var_sum/2
#df에 -를 붙여서 다시 담으면 행/열은 제거됨
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다")
#ifelse는 삼항연산자와 같은 역할을 함
#조건이 참이면 앞에꺼, 거짓이면 뒤에꺼~

getwd() # setwd('xxx')


#csv(comma separate value)파일열기 : excel보다 메모장으로 열어서 보기
score <- read.csv("data/score.csv")
#절대 path도 가능, 현재 directory밑에 있을 경우 그 밑에 폴더에 넣어서 사용
score
str(score)
score$sum <- 
  score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, 
                       "pass", "fail")
score
summary(score$result)
#factor여야지만 세주기 때문에 현재에는 그냥 총 갯수만 세줌
table(score$result)
#table함수의 경우 factor가 됐든 아니든 무조건 그 갯수를 세어줌
#summary에 비해 갯수를 셀 때 더 자주 사용됨
summary(factor(score$result))
score$result = factor(score$result) 
#factor처리 후 summary하게 되면 result의 범주에 알맞는 갯수를 세어줌
str(score)
summary(score)
#열단위로 summary가능
#연속적이지 않은 데이터 = 이산형 데이터
#id/class는 이산형데이터로 굳이 최소/최대가 필요하지않음
score$id = as.character(score$id)
score$class = factor(score$class)
#id와 class를 바꿔주게 될 경우 각각의 구성하고 있는 데이터 타입에 알맞은 summary가 나옴

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
#ifelse안에 ifelse사용가능
#중첩된 ifelse문을 사용하여 A~D등급까지 나눠서 저장 가능
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)
order(v)

emp <- read.csv(file.choose(),
                stringsAsFactors = F)
#factor로 변환하지 말아라!
emp
str(emp)

# emp에서 직원 이름
emp$ename
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 

# emp에서 직원이름, 잡, 샐러리
emp[,c(2,3,6)]
#2,3,6번째 열을 뽑아내겠다~
emp[,c("ename","job","sal")]
subset(emp,select = c(ename, job, sal))
#subset(df,subset,select=(추출하고자하는 컬럼명(인용부호 없이 나열해도 됨))

?subset
# emp에서 1,2,3 행 들만
?head
head(emp,10)
emp[1:3,]
emp[c(1,2,3),]
#6개만 뽑아내고 싶을 땐, head함수 수행
# ename이 "KING"인 직원의 모든 정보
emp[9,] 
emp$ename=="KING"
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,
      F,F,F,F,F,F,F,F),]
emp[emp$ename=="KING",]
#인덱스를 줘도 되지만 비교식을 넣어도 됨.
#where절이랑 비슷혀~~ 
subset(emp,subset=emp$ename=="KING")
#subset이라는 매개변수에 조건을 넣어주면 됨.
subset(emp,emp$ename=="KING") 

# 커미션을 받는 직원들의 모든 정보 출력
emp[!is.na(emp$comm),]
#sql에서도 null값은 등가연산이 불가능. -> is null/ is not null 이용
#is.na()의 함수 => R에서도 null의 등가연산이 불가능하기 때문에 is.na()이용해서 비교
#is.na()로 하면 결과값이 T/F로 나타남 -> na여야 true
subset(emp,!is.na(emp$comm)) 

# select ename,sal from emp where sal>=2000
subset(emp, select=c("ename","sal"), 
       subset= emp$sal>= 2000)
#select에 확인하고자하는 colum명, subset에 조건
subset(emp, emp$sal>= 2000, 
       c("ename","sal"))
emp[emp$sal>=2000,c("ename","sal")]

# select ename,sal from emp where sal between 2000 and 3000
subset(emp, select=c("ename","sal"), subset=(sal>=2000 & sal<=3000))
#무조건 &하나만 써야하는거 체크~!!!
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]


y <- c(0,25,50,75,100)
z <- c(50, 50, 50, 50,50)
y == z
y != z
y > z
y < z
y >= z
y <= z
y == 50 # c(50, 50, 50, 50, 50)
# 연산하려는 대상과 갯수를 맞춤 -> 작은애를 큰 애로 맞춤 = c(50, 50, 50, 50, 50)와 연산하는 것과 같음
y > 50

#나눗셈 기호 연산자
num1 <- 11 # c(11)
num2 <- 3  # c(3)
num1 / num2
num1 %% num2
# %%나머지 연산자
num1 %/% num2
# %/%는 몫 연산자

