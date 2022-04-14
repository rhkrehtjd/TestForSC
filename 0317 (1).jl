### A Pluto.jl notebook ###
# v0.18.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 0bf98a42-5ab4-4329-9246-82990dfd9488
using Plots

# ╔═╡ 4cb7be66-1e1b-48dd-b999-4cc60fbd7339
using PlutoUI

# ╔═╡ 28c74c5b-00ea-4483-951d-5f3ee26fb894
md"""
# 3월17일 강의노트
"""

# ╔═╡ 76c5c29f-a90f-478a-9f98-b3afb11eb0ce
md"### 숙제풀이"

# ╔═╡ 60556e4f-affb-4f03-8a8a-460fa01eae13
md"---"

# ╔═╡ 30d0741c-8e74-4d38-908c-e0bcfe4fd5ca
md"[예비학습] 변수의 범위"

# ╔═╡ 931aa1c2-0186-40a6-a3f2-e8e505682c0c
z=0

# ╔═╡ d1353080-c111-459e-818e-6e29ae69a714
function f(z)
	return z+1065 # return 생략 가능
	# 줄리아는 타 셀에서 중복선언이 안 되는데,
	# 첫 번째 셀에서 선언한 z를 여기에서 또 사용할수 있다 ? 
	# 원래는 중복 정의 안 됨 => 하지만, 여기의 z는 이 함수에서만 효력이 있음
end # 함수 정의 후 end 꼭 입력하자.


# r에서의 함수 선언
# addFunction = function(x){
# 	}

# 파이썬에서의 함수 선언
# def addFunction(x) :
# 	~	

# ╔═╡ 2020a56c-563a-435a-a76d-478ecb16d8ab
f(3),z
# 밖에 있는 z는 그대로 0임
# 파이썬에서의 지역변수, 전역변수 개념과 유사

# ╔═╡ fd205715-4120-45df-8fe7-343dbcccae5b
Plots.plotly()
# 앞으로 plot 사용할 때 plotly를 backend로 사용할 수 있도록.

# ╔═╡ 99646a7d-7231-4646-b6a7-e622f8dfa466
md"""
---
"""

# ╔═╡ 9b1d8548-475e-4e54-8d92-ff0b26934f8b
q(x) = (x^2) ∘ (x-1)

# ╔═╡ 1a55eac2-d0eb-4075-88a1-de38f667ac51
q(3)

# ╔═╡ c5070513-c0bd-42c3-856a-53baceed192d
md"""
왜 안 되지
- 합성함수 연산자는 연산자 기준 앞 뒤로 함수가 들어가야 함
- (x^2)과 (x-1)은 줄리아에서 함수가 아님
- 그럼 아래와 같이 써볼까?
"""

# ╔═╡ 4bb86ab3-9999-4937-a121-a9cbbb2f283f
e(x) = x -> (x^2) ∘ x-> (x-1)

# ╔═╡ dcae0093-3981-469d-80f6-3a4c90a1ec95
e(34567)(3)

# ╔═╡ 6b2758bf-2d93-40d3-a768-7af4194b64d4
md"""
안되넹?
수정해보자
"""

# ╔═╡ 80bd720f-0bb3-4743-8ae3-33f21b2a9dee
t(x) = (x -> x^2) ∘ (x-> x-1)

# ╔═╡ 49272454-d994-4885-9511-f3aafa2f687c
t(123)(3)

# ╔═╡ 9b65ea0d-11a0-41a4-be1f-52f9fc7497aa
md"""
아하 괄호처리 유의해야함 
\circ 연산자는 앞뒤로 함수가 들어가야하기 때문에 함수로 읽을 수 있도록 괄호로 적절히 묶어주자
"""

# ╔═╡ 95508beb-0c8b-4ca6-8b24-d80545bc2b10
p(x) = ((x-1)^2)

# ╔═╡ 3a3bf368-a1d4-41c8-84c7-64639795d675
p(3)
# 이건 함수를 뱉는 함수가 아님

# ╔═╡ 5263f94f-d2a6-4a3a-aa77-e0e1629f5b19
l = (x -> x^2) ∘ (x -> x-1)

# ╔═╡ 466f2a09-7307-4aec-98a9-e9010e5f4310
i(x) = (x -> x^2) ∘ (x -> x-1)

# ╔═╡ eaadf411-ee49-4652-8ceb-3ff0e6f7192a
i(3)(3)
# 함수를 뱉는 함수
# 아래에서 설명할 것임

# ╔═╡ e3bd37c8-5f9c-4d8f-87c8-2ecff9238461
l(3)

# ╔═╡ 8cb75183-0bda-425d-abee-5a88b70eab92
md"""
#### 주의 ####
- 합성함수 사용할 때 ∘ 앞뒤로 괄호 묶어줘야함
- 아래와 같이 안 묶어주게 된다면
- l = x->x^2 ∘ x-> x-1
- 앞의 x^2만 계산하게 된다
"""

# ╔═╡ 75b3581f-c3e5-42cd-bde6-d5e57f0a62f8
md"""
---
"""

# ╔═╡ ccd9234b-d1a0-4236-ae94-6975c02e3e95
md"(풀이1: 제가 의도한 풀이)"

# ╔═╡ 09583a25-c52a-41ef-a43b-3a49521ee05e
g = (x -> x^2) ∘ (x -> x-1)

# ╔═╡ 1772db28-69ba-47b4-ba14-2a0dad6ee2e3
# (x -> x^2) ∘ (x -> x-1) 
# 이거 자체로 함수이고
# 이 함수에 g라는 이름을 명시해준 것.
# 따라서 g(3)은
# ((x -> x^2) ∘ (x -> x-1))(3)이나 동일하다.

# (x -> x^2) ∘ (x -> x-1) 은 오른쪽 괄호부터 적용하는 것.
# 합성함수 정의할 때, 두개의 함수 겉에 괄호 꼭 !

# ╔═╡ 28c91e84-ca8f-41c4-a2eb-a9352accfa0e
md"---"

# ╔═╡ 7315268d-1678-4106-affc-31dfa85b9a40
x=-1:0.1:3; y=[g(x) for x in -1:0.1:3]
# g(x) 이거 자체가 의미하는 게 g라는 이름을 가진 함수에 x라는 -1부터 3까지의 범위로 이루어진 벡터를 넣어준 것.
# 즉 g라는 스칼라를 받는 함수에 x라는 범위(-1:0.1:3)를 넣어주었기 때문에 error가 발생하게 된다.
# 왜냐면 함수 g는 스칼라를 받도록 설계해뒀는데, 벡터를 넣었기 때문에 error가 발생
# 따라서 각각 계산해주어야 함
# 즉, g((0,1))을 넣어줘도(g라는 함수에 vector(0,1)) error가 발생하게 된다.(스칼라가 아닌 벡터값을 넣어줬기 때문에)
# 따라서 list comprehension을 이용해야 한다.
# list comprehension을 이용하면 각각 계산하여 list를 채울 수 있게 된다.

# 부연하자면
# y라는 list안에서 for문이 발생하고 있기 때문에 g(x)는 결국 3을 대입한 값이 마지막에 저장되게 된다.

# ╔═╡ d597d9f9-e54a-40ec-a6a7-c4ff43474547
plot(x,y)

# ╔═╡ 2fea6b1e-e64a-4467-8a13-8f60fe91025a
md"(풀이2)"

# ╔═╡ cbb74ed1-7c47-453f-8ba0-e97456322eb0
# 이 방법이 중요하다.
plot(x,g.(x))
# x 각각의 원소에 대해서 함수 g가 적용되면 좋겠다
# 이런 것을 브로드캐스팅이라 부른다.
# [1,2] + 1 이렇게만 하면 error가 발생한다.
# 브로드캐스팅을 이용하려면
# [1,2].+1 이렇게 dot을 붙여주면 브로드캐스팅을 통해 [2,3]이 된다.
# 연산자 앞에 붙여주어야 한다!
# g라는 함수도 브로드캐스팅을 위해 dot을 붙여주자.
# g.(x) 함수 g가 x각각에 적용된 결과를 얻을 수 있음

# ╔═╡ c8a7d484-2d59-4b09-9324-7074bc87bdde
g.(x)
# g.x 이렇게 쓰면 안 됨
# 함수에 broadcasting할 때 dot 꼭 써주자!

# ╔═╡ 0d482ad7-543d-4c41-a53e-b89d958f4283
[1 2]*2
# 이건 되네
# [1 2] +2
# 이건 안 됐는데

# ╔═╡ d3aaefea-3cdd-411c-a7c5-3c643d51828f
[1 2].*2
# 곱셈은 broadcasting을 해줘도 안 해줘도 결과는 동일함.
# 곱셈은 broadcasting할 때 dot 해도 그만 안 해도 그만

# ╔═╡ 9b2fd596-2c96-4a25-bc61-c75237cb6220
md"(풀이3)"

# ╔═╡ 6173cba2-c0e1-4fba-89f5-0a9061992bd8
plot(x,g)
# 사실은 머 y자리에 broadcasting 결과를 넣어줄 필요는 없었음
# x는 배열이고 g는 함수인데..
# 그냥 이렇게 해도 된다.

# ╔═╡ 37ea5718-2f38-4944-9c8a-7f07b82bdc80
plot(g,x)
# 자리 바꿔서 이렇게도 선언해도 된다.

# ╔═╡ 61eb8c21-3de1-47f2-b520-2b428c4d48e0
# 질문하기
# plot(x,g.x)
# 왜 안 되긴 x에 괄호 안 씌워줬으니 안 되지
# 함수에 broadcasting 해줄 때, dot을 꼭 써주어야 한다
# plot(x,g.(x)) 이렇게!!

plot(x,((x -> x^2) ∘ (x -> x-1)).(x)) 
# x범위랑 그냥 함수만 써도 되긔
# (x -> x^2) ∘ (x -> x-1) = g

# ╔═╡ f88e54f2-8eb2-47b2-beaa-45fa21fa4326
plot((x -> x^2) ∘ (x -> x-1),x)
# plot(g,x랑 동일하다)

# ╔═╡ a8357633-10c7-4927-a996-469e0933fdf3
md"(풀이3의 응용), 그래프 겹쳐 그리기, 여러 함수 활용한 그림 그리기"

# ╔═╡ e4e87b59-69e9-44ae-b903-5480248a3c66
plot(x,sin); plot!(x,cos);plot!(x, x-> (x-1)^2)
# 느낌표를 붙임으로써 겹쳐서 그릴 수 있다
# 한 줄에 써야함!
# sin이라는 함수
# cos이라는 함수
# 물론 sin 대신에 sin.(x)를 사용해도 되고..

# ╔═╡ ff80c009-5291-4e1c-94a0-cd35eff7cd09
md"""
(풀이4) 파이프연산자를 이용

R에서의 %>% 이것과 유사한 기능
"""

# ╔═╡ 0b17375a-b0e2-4c96-b685-09d972572685
x

# ╔═╡ 3fd41cb7-1b7e-4a59-80d0-905445333701
plot(x, x.|> x -> x-1 .|> x-> x^2)
# 이거 자체가 x(= -1:0.1:3)범위라서 
#  x.|> x -> x-1 .|> x-> x^2
# 이것의 결과는 y값 배열이 된다. 


# x -> x-1 이것 자체가 함수고, 이거 적용뒤 다음 함수 적용할 것임.
# x -> x^2 이것 자체도 함수이다.
# x에 차례대로 적용해주어야 하기 때문에, x 뒤에 dot을 붙여준다.

# ╔═╡ 8aa7aa26-641f-4016-8fe2-9a525495b9c9
x.|> x -> x-1 .|> x-> x^2

# ╔═╡ c2ab6404-c4cc-44c2-b0aa-4c669cb883ba
plot(x.|> x -> x-1 .|> x-> x^2,x)
########################### 질문!!!!!! #######################################
# 뭘 질문하니 
# -> x.|> x -> x-1 .|> x-> x^2는 숫자들의 배열이다.
# 그러니까 이렇게 나오지

# x 자체는 애초에 범위였음

# ╔═╡ 82a099f4-f740-4e90-99f4-c1edb3e136eb
md"(학생풀이1)"

# ╔═╡ 7e90058d-a099-4016-9a61-20ae2af8f526
g_lee = (x -> x.^2) ∘ (x-> x.-1)
# 일단 이 함수도 오른쪽 괄호부터 계산 후 왼쪽 괄호를 계산해주는 것이다.

# 함수 선언 자체에 브로드캐스팅 기능을 적용한 경우이다
# 두개의 함수가 결합되어 있는 건데 이 각각의 함수 자체가 브로드캐스팅깍지 한다.
# 먼저 x->x.-1 이 함수는 벡터(스칼라 값 넣어줘도 작동 가능)를 받아서 모든 원소에 -1을 해준다
# 따라서 벡터형태로 값을 넣어줘도 함수가 기능을 할 수 있다.
# 따라서 그냥 g_lee(x)를 수행해도 함수값이 벡터로 반환되게 된다.

# ╔═╡ eb7e7795-1a6c-415d-9928-3e4922c223c0
g_lee((3,4))

# ╔═╡ fe7616c5-e93c-4f2a-9dcb-69f2ab73f550
plot(x,g_lee(x))
# 여기서 x는 vector이다.

# ╔═╡ e8d9ad33-f477-47bf-aa21-552027eb8157
plot(x,g_lee)

# ╔═╡ 7a114cb1-f019-4762-8b70-8897c5a63272
plot(g_lee,x)

# ╔═╡ f5b750b6-b09b-4b02-a6a2-b3bc71b9b839
md"(학생풀이2)"

# ╔═╡ f8cff662-1add-4970-9290-4f034080af1b
h(x) = (x -> x^2) ∘ (x-> x-1)
# 입력이 x, 출력은 (x -> x^2) ∘ (x-> x-1) 인 함수 = 함수를 뱉는 함수
# equal 기준 왼쪽의 x와 오른쪽 x는 다름,같은 모양이지만 다름, 어쨌든 다름
# 이번 수업 시작에서 말했듯 함수 안에서 x랑 바깥에서의 x는 다름
# 즉 equal 오른쪽 x는 함수에서만 사용되는 x임
# 따라서 함수를 뱉는 함수가 된것임
# 즉 입력값에 따라 출력값이 바뀌지 않게 됨

# 즉, h(x) = (a -> a^2) ∘ (c-> c-1)
# 이렇게 선언해도 결과는 (x -> x^2) ∘ (x-> x-1) 
# 이렇게 출력되게 된다.
# 우선 c->c-1이라는 함수가 작동되고 그 결과값이 a->a^2이라는 함수에 들어가서 최종 함수값이 나오게 된다.
# 결국에는 입력 x랑은 상관없이 (x -> x^2) ∘ (x-> x-1) 이런기능을 하는 함수가 나오게 된다.
# 여기서 말하는 `이런 기능` : 입력이 왔을 때, -1 후 ^2 하는 기능..

# h = (x -> x^2) ∘ (x-> x-1)
# 난 이렇게 해결했는데 이거랑은 다름, 난 h, 학생2는 h(x)

# ╔═╡ f686921b-1b98-47ae-a918-c7d2a3e1d6cd
s(x) = (a -> a^2) ∘ (c-> c-1)
# 함수((a -> a^2) ∘ (c-> c-1))를 뱉는 함수(s(x))

# ╔═╡ 9c955849-5af8-4034-8290-00c56dd23779
s(1)(3)
# s(1)해주면 함수가 불러와진 것임

# ╔═╡ 174d2c28-411e-4c93-8599-56318201b05e
# 실제로 해당 함수를 사용해보자
# 값이 아니고 함수가 나옴을 알 수 있을 것이다. 
# 즉 x값에 상관없이, 입력값에 상관없이 
# (x -> x^2) ∘ (x-> x-1) -> 이게 출력된 것
# 따라서 h(이 자리에 어떤 값을 넣던)
# 그 결과는 (x -> x^2) ∘ (x-> x-1)
# 이게 되는 거고
# 이제 드디어 그 옆에 (원하는 값을 넣으면)
# 원하는 값을 얻을 수 있는 것이다.
# 그래서 h(-1) = h(21433253654) = h(12435) = (x -> x^2) ∘ (x-> x-1)
h(1)

# ╔═╡ 07b6ff85-fef4-466b-b69a-dcf36a16fb95
h(x)
# 반환되는 결과가 h(1)과 동일함을 알 수 있다. 

# ╔═╡ 776c7951-82ed-48be-a4e7-440244f10009
h(222)(1)

# ╔═╡ c46eaba7-d9c3-4423-a51c-3519f994ee6f
h(1)(1)

# ╔═╡ 1d8417c1-dfbb-48fc-aec2-89bd3b30c450
h(x)(1)

# ╔═╡ 0aa8fa54-d0e0-4e75-8f59-a0a4725a9765
# 값이 다 0으로 나옴을 알 수 있다.

# ╔═╡ 59898c01-4cd4-4cb0-935f-17c3f15646d8
plot(x,h(x))
# 여기서 h(x)는 
# 쩌~~기 위에서 plot(x,g)랑 동일한 형태인 것.
# 여기 셀에서 h(x)는 y값 배열이 아니라 함수가 불러진 것이다. 

# ╔═╡ e66c7589-c9dd-47a6-832d-877ebb0a7c1d
plot(x,h(x).(x))
# 이건 h(x).(x) broadcasting을 이용하여 배열자체를 넣어준 것임

# ╔═╡ cec352c9-6fdf-432e-ab02-0fdbfb0bb358
plot(h(3425364758),x)

# ╔═╡ f397f89e-90f3-465a-8239-272fb7679be0
plot(x,h(0))
# plot(x,h(23436546758769))
# 이것도 가능할 것이다.
# 이것도 함수를 불러온 것

# ╔═╡ 6da506f2-fbf5-4eb7-adfb-f641b2baaf10
plot(x,h(23436546758769))

# ╔═╡ 1763d1e8-c943-41e9-a3ec-27a75b203789
plot(h(23436546758769),x)

# ╔═╡ 8c3d3c6f-0c62-4550-8051-0afc77d379a7
md"(조건문을 통한 함수를 뱉는 함수)"

# ╔═╡ 2591c80c-233f-40e1-9465-a45524d9d069
__h(x) = if x>0 x -> x+1  else x -> -x+1 end 
# 사실 함수 구조라기보단...
# 조건문으로 함수를 만드는 것 같음
# 조건문 함수를 통해 그에 따른 함수 뱉기!

# 마지막에 end잊지말자
# 익명의 함수 선언할 때 말고
# 이름을 지정해서 함수 선언해주는 방법을 쓸 때, 
# function dsf(x)
# blahblah
# 이렇게 해주었었음

# ╔═╡ c67305de-6168-4f92-9ea7-86deeffc9746
__h(0.1)(100)
# _h(0.1) 이제 함수가 만들어진 것이다.

# ╔═╡ f1645b5a-efbe-4612-ab5a-2931bec4c3df
__h(-0.1)(100)
# _h(-0.1) 이제 함수가 만들어진 것이다.

# ╔═╡ 29015797-b08c-4dd9-be8d-e26a2f7b01c0
plot(__h(1),-2,2); plot!(-2:2,__h(-1))
# -2,2 = -2부터 2, 그런데 이렇게 그림 그리는 방법사용할 땐 자리 바꿔주면 안 됨
# -2,2가 뒤 자리에 위치해야한다.


# __h(1) 이게 함수인 것이다.
# 함수랑 x값은 plot에서 자리 바꿔도 무관하다고 설명했음

# ╔═╡ 9e194198-b101-41e4-b6de-0ffa96afc732
md"---"

# ╔═╡ 9f336162-5b96-4924-8d12-597d325ee8bf
md"### 함수고급"

# ╔═╡ beae091e-4edd-4afb-819f-070ed46ad322
md"##### 연산자는 사실 함수였음"

# ╔═╡ f6e45891-3d89-4890-aa29-045605b7f1c5
+(2,3)
# g라는 함수가 있을 때
# g(2)
# 로 함수값을 얻을 수 있듯이
# +가 g라는 함수처럼 작동을 하는 것

# 내 생각인데
# 여기서 +라는 함수는
# 어떤 학생의 풀이였던
# 함수자체가 vector까지 소화가능한 broadcasting가능한 함수와
# 유사한 함수인 것 같다 
# 그래서 dot도 필요없음

# ╔═╡ 184926cd-3b17-4fd1-b35f-336f451cb142
*(2,3)

# ╔═╡ a97b3d06-94fb-47d6-8096-7cd5f2778b88
myadd = +
# 따라서 별칭을 정해줘도 무방하다

# ╔═╡ 1b88cbac-33a9-48a3-afa6-af9fd2d56a3c
myadd(1,3)

# ╔═╡ 9f3994fe-03fc-4b82-936d-cce75e6325cc
md"##### 브로드캐스팅"

# ╔═╡ dd6b49c9-2376-465d-a39d-1fb9c3020c05
plot(0:0.01:2π, sin.(0:0.01:2π)); plot!(0:0.01:2π, sqrt.(0:0.01:2π))
# plot(0:0.01:2π, sin)
# 이렇게 해도 되긴 함.
# 연산자만 앞에 dot!

# sqrt로 써야함, √말고
# 아니다 사실 √써도 되는데 
# 이것도 연산자이기 때문에 broadcasting하려면 √앞에 dot을 붙여서 .√로 써야함

# ╔═╡ 07c6d5f7-0c6e-4991-80ee-4b7862c40e42
plot(0:0.01:2π, sin.(0:0.01:2π)); plot!(0:0.01:2π, .√(0:0.01:2π))
# 연산자는 연산자 앞에 dot을 붙인다(그래서 루트도 앞에 dot을 붙인다)
# 다른 건 브로드캐스팅 진행할 때, sin. 이렇게 뒤에 붙임

# ╔═╡ ec02f852-1c0a-47ed-8d42-20ae7bc43bbc
md"""
##### 파이프연산자
"""

# ╔═╡ e30f919d-4387-49e0-8202-c66e179f5c95
md"""
`-` 파이프연산자의 기본
- `x |> f` 는 `f(x)` 와 같다. 
- `x |> f |> g`는 `g(f(x))`와 같다. 
- `x |> f |> g |> h `는 `h(g(f(x)))`와 같다. 
"""

# ╔═╡ 2ee12f8f-e5d7-4292-b568-2a217a453bdb
3   |>   x -> x-1   |>   x -> x^2
# 2 됐다가 제곱하니까 4가 된다.

# ╔═╡ 7eff8d1c-1ed5-4bc0-abd2-5cf9b0e63a94
0.5 |> x -> x-1 |> x -> x^2

# ╔═╡ 8c2e4b4c-7f8a-4d70-8bb4-d543e5703f49
md"""
`-` 파이프연산자와 브로드캐스트 
"""

# ╔═╡ 074402aa-dc21-48b3-8152-8eea32d783a4
[1,3] .|> x -> x-1 .|> x -> x^2

# ╔═╡ c7849d47-b141-43a4-a1d7-e66a125916c3
md"""
`-` 파이프연산자와 브로드캐스트 ver2 
"""

# ╔═╡ 7a708f2f-0a1b-46f3-89ff-8c766d8824f5
1:4 .|> [x -> x-100, inv, x->3x, -]
# 이렇게도 사용을 하네....
# inv는 역수
# 1,2,3,4 각 원소에 4개의 함수를 각각 적용해주는 것

# ╔═╡ e2304bf3-34f5-4def-a6a2-c6a6114b3ca6
md"""
(팁) 브로드캐스팅의 생략
"""

# ╔═╡ 13def20a-7ba6-4c5b-abbd-550d794df1fc
md"""
`-` 원래는 이렇게 써야한다..
"""

# ╔═╡ 391d8ccf-47b5-4367-b7b1-564c848692bd
sqrt.(0:0.5:2)
# 연산자 브로드캐스팅이 아닐 때의 dot위치.

# ╔═╡ 9e571983-ccbc-432b-866c-6fb2e5945864
.√(0:0.5:2)
# 연산자 브로드캐스팅을 할 땐, 연산자 앞에 dot을 붙여주어야 한다.

# ╔═╡ bd051e91-1f2e-4d09-aff1-7031627243b6
md"""
`-` 그런데 @.를 앞에 붙이면 모든 연산자, 함수는 브로드캐스팅으로 생각한다. 
"""

# ╔═╡ 8c43a1e1-242f-465c-af55-ea068ead309d
@. sqrt(0:0.5:2)

# ╔═╡ 2bab2cf7-76e8-42e5-bfe8-507c44bb1b32
# 딴 길
fff = @bind sad Slider(1:2:10,show_value=true)

# ╔═╡ ea4ee98d-e55c-4ef9-8204-859f02ed4472
fff

# ╔═╡ 23dbff36-43f9-4bc3-aa4b-5c82561e24fd
sad

# ╔═╡ 302440cd-fc4d-4d78-9fbe-157ee2ff37e4
@. √(0:0.5:2)

# ╔═╡ ea993fd5-988a-4e5d-b226-1be12df9d0e9
@. 0:0.5:2 |> x-> x-1 |> x-> x^2

# ╔═╡ 2426e9ce-ae9f-4f19-9eb4-5b9a4895fe80
@. 0:0.5:2 |> x-> x-1 |> x-> x^2 |> sin |> cos 

# ╔═╡ 3063f835-dba9-4b28-b9a4-c6e39b533b59
@. 1:4 |> [x -> x-100, inv, x->3x, -]

# ╔═╡ 24bce4da-3c92-495a-b89a-4383f38538c1
1:4 .|> [x -> x-100, inv, x->3x, -]

# ╔═╡ 89251ebb-33b6-4324-8db9-ae3d723630e7
n -> 2n-1  
# 초항이 1이고 공차가 2인 등차수열을 정의하는 함수
# n -> 2n-1
# 이거 자체가 함수인 것

# ╔═╡ d6e31001-5eec-4acb-afd3-c8bb7b822038
(n -> 2n-1)(3)

# ╔═╡ c19237ce-0e98-4a20-9e64-e3fe06858578
md"""
[예비학습] 피보나치수열의 정의 

(1) $a_1=a_2=1$ 

(2) $n\geq 3$일 경우 $a_n=a_{n-1}+a_{n-2}$
"""

# ╔═╡ 260a4935-7b4e-4e80-8df2-b85e367fd301
md"""
[예비학습2] if문
"""

# ╔═╡ dca32ac5-5403-4660-b5ab-5170e3de39d1
@bind n Slider(1:10, show_value=true)

# ╔═╡ 72a9be93-4bba-4fa1-b891-b3143ae5bd43
n≤2 ? println("2보다작거나같음") : println("2보다큼") 
# if문의 축약 버전
# 암기방법 
# ?(~라면), :(그렇지 않다면)

# ╔═╡ be8c34b7-e099-451e-9531-547f5690930b
if n <= 2
	 println("2보다작거나같음")
else
	println("2보다큼") 
end # 꼭 써야하긔

# ╔═╡ 0e193a0e-2b9e-41b2-92d4-b84daa218100
if n<=2 println("2보다 작거나 같음") else println("2보다 큼") end
# 그냥 윗줄과 다른 점은.. 한 줄로 늘여쓰느냐 아래로 늘여쓰느냐일 뿐...

# ╔═╡ 26a28598-9c2a-4d55-82be-0ff74800e633
md"""
- println은 한 번 print하고 다음 줄로 넘기고, 또 print하고 다음 줄로 넘김
- 그냥 print는 한 번 프린트하고 다음 줄로 넘기는 게 아니라 그냥 연속으로 바로 옆에 print함
"""

# ╔═╡ d6ba2b43-7cae-4f5d-8c71-7320e8150a4b
md"""
(풀이)
"""

# ╔═╡ 60e4fb10-ec46-4ca8-89a3-0b6e265aebdb
a(n) = n ≤ 2 ? 1 : a(n-1)+a(n-2)
# n이 2보다 작거나 같으면 1, 그렇지 않으면, a(n-1)+a(n-2)이거 진행
# 이거 자체도 함수인데 이건 함수를 뱉는 함수가 아니라, 값을 뱉는 조건문 함수!

# ╔═╡ 5e16f2fd-74af-4c6b-af76-77f115aa9b93
a(3)

# ╔═╡ d65adc66-4ac6-4257-824c-d3ed5ef3847f
_a(n) = if n<=2 1 else _a(n-1) + _a(n-2) end

# ╔═╡ 3d71326e-8cdd-4235-88e4-7b6df27a4075
_a(3)

# ╔═╡ 94c23935-0c85-4713-a1c0-04a744559362
function __a(n)
	if n<=2
		1
	else
		__a(n-1) + __a(n-2)
	end
end

# ╔═╡ 1338f247-b15a-4855-87fb-0f89efaa401f
__a(3)

# ╔═╡ 161cd447-3a92-4c8c-bd58-1c8ff670cab8
_h(x) = if x>0 x -> x+1  else x -> -x+1 end 
# 조건문 함수를 통해 그에 따른 함수 뱉기
# 이것도 함수이긴 한데 이건 조건에 따른 또 다른 함수들(2개)을 뱉는 함수!

# ╔═╡ d9a5640f-843a-4440-82a6-d88eb77f169a
plot(__h(1),-2:2);scatter!(-2:2,_h(1))

# ╔═╡ 1e3dc7ff-3dc9-468d-bf36-52755b44a6dd
asd(x) = x>0 ? x-> x+1 : x -> -x+1
# 조건문 함수를 통해 그에 따른 함수 뱉기
# 함수를 뱉는 함수이지만, 조건에 따라 다른 함수를 뱉는 함수

# ╔═╡ b53f8dec-69f4-4660-b2b0-17a6f0f71a7c
asd(3)(1334)

# ╔═╡ fe1d571d-43d2-43ef-b5ed-7113150b8e19
asd(0)(1334)

# ╔═╡ 8acede8a-8a46-4c93-8603-9bbe9a3f092c
scatter(1:8,a);plot!(1:8,a)

# ╔═╡ bb5fb182-dac9-4f0d-bb67-06173fadaff5
a(3)

# ╔═╡ 38f0eba5-627b-473f-abfc-a7696d12dd65
b = x -> 3x-1 ; plot(1:10,b);scatter!(1:10,b)
## 숙제
# 초항이 2이고 공차가 3인 수열을 점화식의 형태로 정의하여 보라. 
# 1항부터 10항지의 출력결과를 시각화하라.

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Plots = "~1.27.0"
PlutoUI = "~0.7.37"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "af92965fb30777147966f58acb05da51c5616b5f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.3"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c9a6160317d1abe9c44b3beb367fd448117679ca"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.13.0"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "bf98fa45a0a4cee295de98d4c1462be26345b9a1"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.2"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "12fc73e5e0af68ad3137b886e3f7c1eacfca2640"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.17.1"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "96b0bc6c52df76506efc8a441c6cf1adcb1babc4"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.42.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[deps.DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3daef5523dd2e769dad2365274f760ff5f282c7d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.11"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ae13fcbc7ab8f16b0856729b050ef0c446aa3492"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.4+0"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "51d2dfe8e590fbd74e7a842cf6d13d8a2f45dc01"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.6+0"

[[deps.GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "RelocatableFolders", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "9f836fb62492f4b0f0d3b06f55983f2704ed0883"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.64.0"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "a6c850d77ad5118ad3be4bd188919ce97fffac47"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.64.0+0"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "83ea630384a13fc4f002b77690bc0afeb4255ac9"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.2"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "a32d672ac2c967f3deb8a81d828afc739c838a06"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "91b5dcf362c5add98049e6c29ee756910b03051d"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.3"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b53380851c6e6664204efb2e62cd24fa5c47e4ba"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.2+0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "4f00cc36fede3c04b8acf9b2e2763decfdcecfa6"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.13"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "c9551dd26e31ab17b86cbd00c2ede019c08758eb"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+1"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "58f25e56b706f95125dcb796f39e1fb01d913a71"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.10"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NaNMath]]
git-tree-sha1 = "737a5957f387b17e74d4ad2f440eb330b39a62c5"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ab05aa4cc89736e95915b01e7279e61b1bfe33b8"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.14+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "85b5da0fa43588c75bb1ff986493443f821c70b7"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.3"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "bb16469fd5224100e422f0b027d26c5a25de1200"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.2.0"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "9213b4c18b57b7020ee20f33a4ba49eb7bef85e0"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.27.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "bf0a1121af131d9974241ba53f601211e9303a9e"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.37"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "d3538e7f8a790dc8903519090857ef8e1283eecd"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.5"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RecipesBase]]
git-tree-sha1 = "6bf3f380ff52ce0832ddd3a2a7b9538ed1bcca7d"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.2.1"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "995a812c6f7edea7527bb570f0ac39d0fb15663c"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.5.1"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "cdbd3b1338c72ce29d9584fdbe9e9b70eeb5adca"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "0.1.3"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "6976fab022fea2ffea3d945159317556e5dad87c"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.4.2"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "c3d8ba7f3fa0625b062b82853a7d5229cb728b6b"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.2.1"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8977b17906b0a1cc74ab2e3a05faa16cf08a8291"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.16"

[[deps.StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "57617b34fa34f91d536eb265df67c2d4519b8b98"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.5"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "5ce79ce186cc678bbb5c5681ca3379d1ddae11a1"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.7.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unzip]]
git-tree-sha1 = "34db80951901073501137bdbc3d5a8e7bbd06670"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.1.2"

[[deps.Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4528479aa01ee1b3b4cd0e6faef0e04cf16466da"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.25.0+0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e45044cd873ded54b6a5bac0eb5c971392cf1927"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.2+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─28c74c5b-00ea-4483-951d-5f3ee26fb894
# ╟─76c5c29f-a90f-478a-9f98-b3afb11eb0ce
# ╟─60556e4f-affb-4f03-8a8a-460fa01eae13
# ╟─30d0741c-8e74-4d38-908c-e0bcfe4fd5ca
# ╠═931aa1c2-0186-40a6-a3f2-e8e505682c0c
# ╠═d1353080-c111-459e-818e-6e29ae69a714
# ╠═2020a56c-563a-435a-a76d-478ecb16d8ab
# ╠═0bf98a42-5ab4-4329-9246-82990dfd9488
# ╠═fd205715-4120-45df-8fe7-343dbcccae5b
# ╟─99646a7d-7231-4646-b6a7-e622f8dfa466
# ╠═9b1d8548-475e-4e54-8d92-ff0b26934f8b
# ╠═1a55eac2-d0eb-4075-88a1-de38f667ac51
# ╟─c5070513-c0bd-42c3-856a-53baceed192d
# ╠═4bb86ab3-9999-4937-a121-a9cbbb2f283f
# ╠═dcae0093-3981-469d-80f6-3a4c90a1ec95
# ╟─6b2758bf-2d93-40d3-a768-7af4194b64d4
# ╠═80bd720f-0bb3-4743-8ae3-33f21b2a9dee
# ╠═49272454-d994-4885-9511-f3aafa2f687c
# ╟─9b65ea0d-11a0-41a4-be1f-52f9fc7497aa
# ╠═95508beb-0c8b-4ca6-8b24-d80545bc2b10
# ╠═3a3bf368-a1d4-41c8-84c7-64639795d675
# ╠═5263f94f-d2a6-4a3a-aa77-e0e1629f5b19
# ╠═466f2a09-7307-4aec-98a9-e9010e5f4310
# ╠═eaadf411-ee49-4652-8ceb-3ff0e6f7192a
# ╠═e3bd37c8-5f9c-4d8f-87c8-2ecff9238461
# ╟─8cb75183-0bda-425d-abee-5a88b70eab92
# ╟─75b3581f-c3e5-42cd-bde6-d5e57f0a62f8
# ╟─ccd9234b-d1a0-4236-ae94-6975c02e3e95
# ╠═09583a25-c52a-41ef-a43b-3a49521ee05e
# ╠═1772db28-69ba-47b4-ba14-2a0dad6ee2e3
# ╟─28c91e84-ca8f-41c4-a2eb-a9352accfa0e
# ╠═7315268d-1678-4106-affc-31dfa85b9a40
# ╠═d597d9f9-e54a-40ec-a6a7-c4ff43474547
# ╟─2fea6b1e-e64a-4467-8a13-8f60fe91025a
# ╠═cbb74ed1-7c47-453f-8ba0-e97456322eb0
# ╠═c8a7d484-2d59-4b09-9324-7074bc87bdde
# ╠═0d482ad7-543d-4c41-a53e-b89d958f4283
# ╠═d3aaefea-3cdd-411c-a7c5-3c643d51828f
# ╟─9b2fd596-2c96-4a25-bc61-c75237cb6220
# ╠═6173cba2-c0e1-4fba-89f5-0a9061992bd8
# ╠═37ea5718-2f38-4944-9c8a-7f07b82bdc80
# ╠═61eb8c21-3de1-47f2-b520-2b428c4d48e0
# ╠═f88e54f2-8eb2-47b2-beaa-45fa21fa4326
# ╟─a8357633-10c7-4927-a996-469e0933fdf3
# ╠═e4e87b59-69e9-44ae-b903-5480248a3c66
# ╟─ff80c009-5291-4e1c-94a0-cd35eff7cd09
# ╠═0b17375a-b0e2-4c96-b685-09d972572685
# ╠═3fd41cb7-1b7e-4a59-80d0-905445333701
# ╠═8aa7aa26-641f-4016-8fe2-9a525495b9c9
# ╠═c2ab6404-c4cc-44c2-b0aa-4c669cb883ba
# ╟─82a099f4-f740-4e90-99f4-c1edb3e136eb
# ╠═7e90058d-a099-4016-9a61-20ae2af8f526
# ╠═eb7e7795-1a6c-415d-9928-3e4922c223c0
# ╠═fe7616c5-e93c-4f2a-9dcb-69f2ab73f550
# ╠═e8d9ad33-f477-47bf-aa21-552027eb8157
# ╠═7a114cb1-f019-4762-8b70-8897c5a63272
# ╟─f5b750b6-b09b-4b02-a6a2-b3bc71b9b839
# ╠═f8cff662-1add-4970-9290-4f034080af1b
# ╠═f686921b-1b98-47ae-a918-c7d2a3e1d6cd
# ╠═9c955849-5af8-4034-8290-00c56dd23779
# ╠═174d2c28-411e-4c93-8599-56318201b05e
# ╠═07b6ff85-fef4-466b-b69a-dcf36a16fb95
# ╠═776c7951-82ed-48be-a4e7-440244f10009
# ╠═c46eaba7-d9c3-4423-a51c-3519f994ee6f
# ╠═1d8417c1-dfbb-48fc-aec2-89bd3b30c450
# ╠═0aa8fa54-d0e0-4e75-8f59-a0a4725a9765
# ╠═59898c01-4cd4-4cb0-935f-17c3f15646d8
# ╠═e66c7589-c9dd-47a6-832d-877ebb0a7c1d
# ╠═cec352c9-6fdf-432e-ab02-0fdbfb0bb358
# ╠═f397f89e-90f3-465a-8239-272fb7679be0
# ╠═6da506f2-fbf5-4eb7-adfb-f641b2baaf10
# ╠═1763d1e8-c943-41e9-a3ec-27a75b203789
# ╟─8c3d3c6f-0c62-4550-8051-0afc77d379a7
# ╠═2591c80c-233f-40e1-9465-a45524d9d069
# ╠═c67305de-6168-4f92-9ea7-86deeffc9746
# ╠═f1645b5a-efbe-4612-ab5a-2931bec4c3df
# ╠═29015797-b08c-4dd9-be8d-e26a2f7b01c0
# ╠═d9a5640f-843a-4440-82a6-d88eb77f169a
# ╟─9e194198-b101-41e4-b6de-0ffa96afc732
# ╟─9f336162-5b96-4924-8d12-597d325ee8bf
# ╟─beae091e-4edd-4afb-819f-070ed46ad322
# ╠═f6e45891-3d89-4890-aa29-045605b7f1c5
# ╠═184926cd-3b17-4fd1-b35f-336f451cb142
# ╠═a97b3d06-94fb-47d6-8096-7cd5f2778b88
# ╠═1b88cbac-33a9-48a3-afa6-af9fd2d56a3c
# ╟─9f3994fe-03fc-4b82-936d-cce75e6325cc
# ╠═dd6b49c9-2376-465d-a39d-1fb9c3020c05
# ╠═07c6d5f7-0c6e-4991-80ee-4b7862c40e42
# ╟─ec02f852-1c0a-47ed-8d42-20ae7bc43bbc
# ╟─e30f919d-4387-49e0-8202-c66e179f5c95
# ╠═2ee12f8f-e5d7-4292-b568-2a217a453bdb
# ╠═7eff8d1c-1ed5-4bc0-abd2-5cf9b0e63a94
# ╟─8c2e4b4c-7f8a-4d70-8bb4-d543e5703f49
# ╠═074402aa-dc21-48b3-8152-8eea32d783a4
# ╟─c7849d47-b141-43a4-a1d7-e66a125916c3
# ╠═7a708f2f-0a1b-46f3-89ff-8c766d8824f5
# ╟─e2304bf3-34f5-4def-a6a2-c6a6114b3ca6
# ╟─13def20a-7ba6-4c5b-abbd-550d794df1fc
# ╠═391d8ccf-47b5-4367-b7b1-564c848692bd
# ╠═9e571983-ccbc-432b-866c-6fb2e5945864
# ╟─bd051e91-1f2e-4d09-aff1-7031627243b6
# ╠═8c43a1e1-242f-465c-af55-ea068ead309d
# ╠═2bab2cf7-76e8-42e5-bfe8-507c44bb1b32
# ╠═ea4ee98d-e55c-4ef9-8204-859f02ed4472
# ╠═23dbff36-43f9-4bc3-aa4b-5c82561e24fd
# ╠═302440cd-fc4d-4d78-9fbe-157ee2ff37e4
# ╠═ea993fd5-988a-4e5d-b226-1be12df9d0e9
# ╠═2426e9ce-ae9f-4f19-9eb4-5b9a4895fe80
# ╠═3063f835-dba9-4b28-b9a4-c6e39b533b59
# ╠═24bce4da-3c92-495a-b89a-4383f38538c1
# ╠═89251ebb-33b6-4324-8db9-ae3d723630e7
# ╠═d6e31001-5eec-4acb-afd3-c8bb7b822038
# ╟─c19237ce-0e98-4a20-9e64-e3fe06858578
# ╟─260a4935-7b4e-4e80-8df2-b85e367fd301
# ╠═4cb7be66-1e1b-48dd-b999-4cc60fbd7339
# ╠═dca32ac5-5403-4660-b5ab-5170e3de39d1
# ╠═72a9be93-4bba-4fa1-b891-b3143ae5bd43
# ╠═be8c34b7-e099-451e-9531-547f5690930b
# ╠═0e193a0e-2b9e-41b2-92d4-b84daa218100
# ╟─26a28598-9c2a-4d55-82be-0ff74800e633
# ╟─d6ba2b43-7cae-4f5d-8c71-7320e8150a4b
# ╠═60e4fb10-ec46-4ca8-89a3-0b6e265aebdb
# ╠═5e16f2fd-74af-4c6b-af76-77f115aa9b93
# ╠═d65adc66-4ac6-4257-824c-d3ed5ef3847f
# ╠═3d71326e-8cdd-4235-88e4-7b6df27a4075
# ╠═94c23935-0c85-4713-a1c0-04a744559362
# ╠═1338f247-b15a-4855-87fb-0f89efaa401f
# ╠═161cd447-3a92-4c8c-bd58-1c8ff670cab8
# ╠═1e3dc7ff-3dc9-468d-bf36-52755b44a6dd
# ╠═b53f8dec-69f4-4660-b2b0-17a6f0f71a7c
# ╠═fe1d571d-43d2-43ef-b5ed-7113150b8e19
# ╠═8acede8a-8a46-4c93-8603-9bbe9a3f092c
# ╠═bb5fb182-dac9-4f0d-bb67-06173fadaff5
# ╠═38f0eba5-627b-473f-abfc-a7696d12dd65
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
