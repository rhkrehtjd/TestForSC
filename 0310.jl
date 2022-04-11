### A Pluto.jl notebook ###
# v0.18.1

using Markdown
using InteractiveUtils

# ╔═╡ bc068777-a366-4552-a8d7-d2fd4429f01c
md"# 3월10일 강의노트"

# ╔═╡ 7fd5c088-5ac0-432c-8aa5-251823a15dad
md"### 변수이름"

# ╔═╡ 93015177-90dd-4a75-85d7-d7c4d22545dd
x=1.0

# ╔═╡ 5f9cc659-444a-4aca-835d-4ebd3bc2db8a
δ=0.1 
# \delta + tab 

# ╔═╡ 8c0dfc14-4f40-4928-bb8c-f973c9d3b54a
δ +2

# ╔═╡ 037ea21a-bc67-4ede-9628-50d9ad29a6e7
π 
# 미리저장되어있음 

# ╔═╡ 1674553a-8e42-4473-b574-6c814a8091fb
ℯ 
# 오일러 상수
# 미리저장되어 있음 \euler + tab

# ╔═╡ fed45320-b7f4-478b-8a2a-bfb417f5e34d
x̄ = (1+2+3+4)/4 # x\bar + tab 

# ╔═╡ 1f96e84b-4c3e-4fdc-8441-8fb4d3a49b3d
x̂ = 5.0 # x\hat + tab 

# ╔═╡ 6100965a-ec16-4274-9411-64f9dedc67a0
β̂ = 4.0 
# \beta + tab 그리고 베타가 생성된 뒤, \hat + tab
# x\hat처럼 beta\hat쓰면 안 됨
# x\hat 쓸 수 있는 건 x,y,a뭐 이렇게 일반적으로 사용가능한 문자들에 해당됨

# ╔═╡ 7558f29d-b09d-4e89-aa3e-0493cf735b49
xₜ = 2.0 # x\_t + tab 

# ╔═╡ be0ed6cb-fbb1-427f-bd9b-ab6b2f96bf70
β̂₀ = 1.5 # \beta + tab -> \hat + tab -> \_0 + tab

# ╔═╡ 031ccf5a-fac5-4b03-97e1-abf1f88824e8
β̂ᵐˡᵉ = 2.2	# \beta + tab -> \hat + tab -> \^mle + tab

# ╔═╡ a938bbfc-566d-4503-9543-24470a1568a5
♂ = "male" # \male + tab

# ╔═╡ 4e96a402-3eac-4a03-a3fb-050b67e5f165
최규빈 = "GuebinChoi"

# ╔═╡ 2745de40-c4a0-4233-aa97-6c367777f24a
최규빈

# ╔═╡ 69ab7085-ffd6-41ea-9ac3-861cae5aa6cc
md"### 자료형"

# ╔═╡ 7a9ec94b-4bf5-45e9-ace2-9d57789af169
md"##### int, float"

# ╔═╡ aa3c4cfd-e260-47fc-aa96-103995d99216
123 # int 

# ╔═╡ e5f215a7-cff9-4274-931a-36ff0c6bb63a
1.23 # float 

# ╔═╡ c5a27cde-cccf-45bd-b278-6712744714a3
md"""
`-` 타입을 보려면? = typeof 
"""

# ╔═╡ 3f7b6a98-8b81-4dda-85d8-01ed3bf498d6
typeof(123)

# ╔═╡ 7be5dda7-ec6a-4bac-b436-5efe82630bfe
typeof(1.23)

# ╔═╡ 1f09e243-6d8e-450c-a396-5781656ffaf2
md"""
##### Inf, NaN
"""

# ╔═╡ ecd47dbd-784a-448b-8bd9-bdf71b7c6192
md"""
`-` Inf 
"""

# ╔═╡ 0de4283c-3416-4ed3-90b4-59785bac2add
Inf

# ╔═╡ 52ecb331-9838-4039-bc2d-d8baff6bd394
typeof(Inf)

# ╔═╡ a594053f-73ed-43cb-88ac-ee2306d1a32d
1/Inf

# ╔═╡ 3dc2979b-6f03-4337-af32-6b039475c198
1/0

# ╔═╡ 92ba7de9-87a5-4d2c-a6b9-da3fe695463c
Inf + 100

# ╔═╡ 1a34c0dd-3f49-45a5-968d-f8ac0ba70f96
Inf + Inf

# ╔═╡ 7d231a82-0126-4566-8b0b-308c3f45e065
500 - Inf 

# ╔═╡ 10461e54-a79a-4c26-bfd0-f657b135de80
md"""
`-` NaN(정의하기 애매할 때 사용하는 것 같다)
"""

# ╔═╡ 213b178c-6c93-497c-ac33-5ffce4975a97
NaN

# ╔═╡ 03b6c227-b712-432e-9259-b5d349bed203
typeof(NaN)

# ╔═╡ 332839be-a047-483f-ae68-a453adee9998
typeof(0/0)
# 0/0이 NaN이고 NaN의 type이 float64

# ╔═╡ fd962b4a-3cde-405b-b8ed-5d7fce3c0f04
0/0

# ╔═╡ b58c357a-1110-451c-96b9-dc2a816f0346
0/1

# ╔═╡ cb9de97c-a884-4545-b143-d274611cb8a1
1/0

# ╔═╡ c0f74c89-01a5-4b2b-b8fe-ed0c50edfb38
Inf - Inf
# 무한대 - 무한대?
# 뭔데
# 모르니 NaN

# ╔═╡ a6b58372-9f41-45a2-87f7-ffe8da31cdda
Inf / Inf 

# ╔═╡ fd9ebe5a-6c7f-4c97-8474-69cf100e4f0b
0 * Inf 
# 0 * 무한대?
# 몰라
# NaN

# ╔═╡ e69bcb1a-6b0a-459c-91b6-618691f93f49
0 + Inf 

# ╔═╡ aae82467-bf7d-4065-954a-0368aca73d8e
NaN + 2

# ╔═╡ d34f35b8-eaac-4097-82b0-c1018590bf0d
NaN - NaN

# ╔═╡ 34d1f92f-8861-4c1b-b1ec-b41a95ccb32a
NaN + Inf 

# ╔═╡ a1e4fa99-24c5-44a4-80dd-16237211c351
md"""
------------
"""

# ╔═╡ 89daf982-a9c1-4583-a1bc-2e6366c6f125
Inf > 2 

# ╔═╡ 3699cac6-046d-467d-b756-ce38dd42d953
Inf < 2 

# ╔═╡ ef6c82fa-b164-4321-b539-1b3577ad431a
-Inf > 2 

# ╔═╡ 364c7521-f34e-44fe-9aff-8fcece4f8f10
-Inf < 2 

# ╔═╡ ff3a8440-164e-487e-aad7-d17f6e482e8c
-Inf < Inf 

# ╔═╡ cb70b33d-f8ee-4e89-a5ee-90bc529460ea
Inf == Inf

# ╔═╡ 20df59d8-614c-4f10-914a-2e8b5c6ade45
Inf != Inf

# ╔═╡ 1f56d6f2-a59e-4a40-99e0-0abe9365bef1
NaN > 2,NaN < 2
# 정의할 수 없거나 애매하면 False 출력
# 그래서 둘 다 false 출력

# ╔═╡ c27f0b69-796d-432c-8923-20c8868179ca
NaN == NaN
# 모르는 것끼리 어떻게 동일한지 판단해
# 모르니
# 반환값도 flase 

# 그런데 Inf == Inf는 같다고 판단할 수 있음
# NaN은 모르는 것
# Inf는 아는 것

# ╔═╡ 07918808-d082-432a-8115-868ab95cba3f
NaN > NaN

# ╔═╡ 6947b7bb-bbd7-4b50-84f3-b3c760bdca93
NaN < NaN

# ╔═╡ 831328c6-fadf-4cff-9ab8-cc9d1839f6a8
NaN != NaN
# NaN == NaN이 flase이니까 그거를 다시 ! 해준 결과는 true이다. 

# ╔═╡ 99bb3338-cc43-43aa-81ba-27d27afd61f6
NaN > Inf ,NaN < Inf
# 모르겠으니 false,false

# ╔═╡ 51a605f8-8e20-41d9-97c3-65b0c8aba622
NaN == Inf 

# ╔═╡ cb50e1d2-f5fb-40f7-a97e-dbacfe60913d
NaN + Inf 

# ╔═╡ 3f75715e-a258-4ece-afe0-e73f9ad1d677
md"""
`-` Inf와 NaN 비교할 때
- 애매하면 False로 출력됨
"""

# ╔═╡ 6215cb02-5b52-445b-bfa8-eeac87470537
md"""
##### 문자열
- 따옴표 두개 사용해야 문자열이 정의됨
- 따옴표 하나만 쓰면 ERROR
"""

# ╔═╡ 2ef84c02-f271-4bae-a50e-cfd6738a99ec
str1 = "asdf"

# ╔═╡ 1ab70342-5bd3-4c06-942c-599b06c80e98
str1[2] # 두번째 원소

# ╔═╡ 2922318a-9db5-4fe9-9f3b-d70e8b53eae6
str1[1:2] 

# ╔═╡ 83ee9ee0-0eab-41c6-846d-9352338aca8b
length(str1)

# ╔═╡ c2909e6f-e0d2-4be6-9a36-6b53b622fa47
str1 * "efg" # 문자열 잇기 방법1

# ╔═╡ c409f466-8d76-4e15-9de4-11cb0de44c2d
a1 = string("sadgh")

# ╔═╡ 468ae257-ce5b-429b-9d34-b2b0970d1b50
md"""
그냥 따옴표로 str을 명해주어도 되고

아니면 string()로 감싸주어도 되고,
그런데 어차피 string으로 감싸려고 해도, 큰따옴표는 써야함

- 밑에 셀보니
- string은 단독으로 str문자열 명해줄 때 사용한다기 보다는
- 두 str을 연결해줄 때 사용할 수 있는 method인 것 같다.
"""

# ╔═╡ 354d1e00-d631-4f29-a289-351802ffb39e
a1

# ╔═╡ da88c5ab-f756-4c48-b32e-bc69482cbf69
string(str1 , "efg") # 문자열 잇기 방법2

# ╔═╡ 8b5c2f32-62f8-4973-ae0c-83a084868c58
"1더하기1은 $(1+1)" # 문자열 끼워넣기 

# ╔═╡ c8497ded-75a5-481c-8a65-1b2bf3c190a0
begin
	word1 = "Julia" 
	word2 = "data" 
	word3 = "science" 
end
# let을 쓰면 이 안에서만 효력이 발생한다.
# 그러면 아래에서 markdown 생성할 때 당연히 error가 발생할 것

# ╔═╡ f71bc70e-3f5b-47a5-94f9-c1976ab95284
word_1 = "Julia";word_2 = "data";word_3 = "science";word_1 * word_2 * word_3

# ╔═╡ 519be7e4-80cd-405b-800a-2034a899ba36
string(word_1, word_2, word_3)

# ╔═╡ 8ec75baf-85d1-43f6-8c6c-ef3e19536529
"$word1 is great for $word2 $word3"

# ╔═╡ 43f529e2-dd3f-472d-852b-bba8853ad9d8
md"""
##### 튜플 
"""

# ╔═╡ ce71647d-fb14-40c3-b3e3-5d094f7e4187
(1,2,3)

# ╔═╡ 406d8005-4b25-4ce8-91cd-05794332e3fb
typeof((1,2,3))

# ╔═╡ 2ceac045-aac4-44f7-b969-d727595f30cb
a = (11,22,33) # a라는 변수에 튜플 (1,2,3)을 넣음 

# ╔═╡ bd45fad2-58cc-4c1d-8069-15ea62150769
typeof(a)

# ╔═╡ 2affadf8-d96c-467a-b725-d34888983acb
a[1]

# ╔═╡ 2d288956-7028-4356-a987-ee8db76ae472
# a[1]=100
# 튜플은 원소변경이 안 됨
# 파이썬에서도 안 됐음

# ╔═╡ c5ad6523-07c2-444c-9cd3-8e1ba61cfef8
# 튜플언팩킹
a₁, a₂, a₃ = 11,22,33 
# (a₁, a₂, a₃) = (11,22,33) 
# a₁=11, a₂=22, a₃=33 얘랑 같은 표현임

# ╔═╡ aa468bc9-8779-48be-889c-53e59e11315c
(a5, a6, a7) = (1,22,33)

# ╔═╡ dfe26b2c-e7f2-4db7-ab8a-94fb8a5beaa3
a5

# ╔═╡ e9df4f75-fec8-4fa0-8338-bd67c844bf4b
a₁

# ╔═╡ 0dc6ff92-b505-4ebc-97d9-a7761262f626
a₂

# ╔═╡ 9e83f7e9-9571-4195-b42b-62e12ea4d180
a₃

# ╔═╡ 4f407877-284c-4aca-9dad-a7b9a8e464b8
a₁,a₃

# ╔═╡ 5c347108-86f6-469c-9db3-a9e1a1e3c478
md"""
##### Array
- r에서의 벡터나 파이썬에서의 list와 유사
"""

# ╔═╡ 556a13bc-2d9f-48ef-abe9-144ec33264bd
b = [11,22,33];b_ = [11 22 33];b_
# 이렇게 comma로 연결된 건 열벡터라고 생각해야 됨
# 열벡터, 행벡터

# ╔═╡ d738dd15-b1bb-4e55-b788-c9212a488ed1
b[1]

# ╔═╡ f0e05ff9-820d-4b95-ad0d-770c72589a3b
# 튜플과 달리 원소변경이 가능.
b[1] = 100

# ╔═╡ 3406a77f-9ebc-4bd2-9082-2dafda0a1f08
b # 열 벡터

# ╔═╡ 72c6cdb7-608f-44a6-8f2e-6dfdf4af3bcc
md"""
`-` 브로드캐스팅
"""

# ╔═╡ 306a8f60-8cad-49ce-934f-60294c85069b
# b+1
# 브로드캐스팅이 안 됨
# 파이썬에서도 브로드캐스팅이 안 돼서 
# 넘파이로 해줬음
# error 발생

# ╔═╡ 28933892-c486-48f0-b420-e4ff03d26ede
broadcast(+,b,1)
# broadcasting이 아니라 broadcast이다.

# ╔═╡ 87c766e5-ba46-43f2-b840-02b8566056e1
b.+1 
# BroadCasting 하려면 dot 활용하자
# dot을 붙임으로써 원소 하나하나에 더하기 1 해준다고 생각하면 된다.
# 연산자 broadcasting은 연산자 앞에 dot을 붙인다.

# ╔═╡ 9612c517-e2e4-4321-9045-e9cc70c8d650
md"""
`-` 아래는 다르다
"""

# ╔═╡ 5be10235-e7cc-4b9a-9638-0ce11ddb8e95
# 얘는 열벡터
b1 = [1; 2 ;3] 

# ╔═╡ 3207d546-05a1-4129-a775-5f9f18434d18
[1; 2 ;3] 
# 위 줄이랑 동일한 건가?..
# 응응 맞음 동일함
# 세미콜론으로 하거나 혹은 comma로 한다. 

# ╔═╡ f76342cd-6bf4-41ad-b0ba-e3ea67c966b4
typeof(b1)

# ╔═╡ 1b8eb691-dd34-4b78-bb2f-29b563ed8892
# 얘는 행벡터
b2 = [1 2 3]

# ╔═╡ c3b90a24-348a-40fe-bd9c-c2da508a11ea
typeof(b2)

# ╔═╡ 6e57bf96-a86c-41f3-96d6-82923ac359f3
md"""
`-` b1,b2를 브로드캐스팅 하면?
"""

# ╔═╡ edbe00c1-f257-4b4a-898c-102188b3709a
b1.+b2
# 3*1 벡터 1*3 벡터라서 원래 덧셈 안 됨
# 그런데 브로드 캐스팅이 되어서
# 둘다 3*3으로 채워져서 더해지게 됨

# ╔═╡ e3f215a9-b173-4c9c-85cd-f0872cf9b0f5
b1.*b2 
# 곱하기 앞에 dot이 있으므로 내적, 외적, 행렬곱과 별개인 것 같다
# 그냥 브로드캐스팅 기능으로서
# 행벡터였다면 아래로 복사해주고
# 열벡터였다면 옆으로 복사해서
# 각 원소를 곱해준다

#  1 1 1     1 2 3
#  2 2 2  *  1 2 3
#  3 3 3     1 2 3

# ╔═╡ 676ffa7f-8a76-4f3b-8149-7cddd68bea9c
b1*b2
# 외적

# ╔═╡ 9d5fe06b-8bc0-4b3f-be78-0f398b770bd8
b2*b1
# 내적

# ╔═╡ 05863f75-5dc0-4086-804b-17b662b6595d
b2.*b1
# 아 그냥 
# *만 써주면 내적외적행렬곱 수행
# 앞에 .써주면 무조건 broadcasting으로 행벡터도 확대시키고, 열벡터도 확대시키고 그리고 
# 각 원소끼리 곱해주네

# ╔═╡ 9fe42106-43cb-4293-8e2e-dfcc71fd3da9
b1*b2


# ╔═╡ e893ef4a-12b7-4ca3-8262-fb2e6ae2baa6
b2.*b1

# ╔═╡ cc10ac69-667a-4a41-8439-0aea0406e140
md"""
`-` 브로드캐스팅의 또 다른 응용
  - 뭉텅이로 동일한지 확인할 때 말고
  - 각 원소들의 일치여부를 파악할 때
"""

# ╔═╡ 546c0949-cbb7-4376-980b-cb5bae22b9ab
[1,2] == [1,2] 

# ╔═╡ d588d8fa-2978-435b-8c1b-fad79c7d5810
[1,2] == [2,2]

# ╔═╡ cab2a579-7116-428a-bd45-4dff1eab3604
[1,2] == [1,1]

# ╔═╡ c7d4b4f3-74f2-4fa5-aaae-62dbfb3a4b3a
[1,2] == [2,1]

# ╔═╡ 493d28a8-4295-4eb5-a159-5f2b1fd7942a
# BroadCasting의 또 다른 응용
[1,2] .== [1,2] 
# 각 원소들끼리의 일치여부 확인할 때

# ╔═╡ 98ec2369-df57-4668-a6ec-c738c52c458b
[1,2] .== [2,2]

# ╔═╡ 7155f100-1d83-4c04-a30c-d7ba45ee74e8
[1,2] .== [1,1]

# ╔═╡ 280937bb-9fa6-423c-874b-3cf814b6bd10
[1,2] .== [2,1]

# ╔═╡ 0de890bc-be78-487d-9001-190cc8664587
[1,2,3,4] .== [1,2,33,4] 

# ╔═╡ e8e7d4c7-70f0-45ab-9469-26cd6f70a7f6
md"""
`-` 난수로 벡터선언
"""

# ╔═╡ d966ce95-faf6-484a-87a8-6ffd273f31ff
randn(5) # 표준정규분포

# ╔═╡ 7b951345-bfa5-464d-a71c-ff067d427010
# rand의 첫 번째 기능 : 유니폼분포 (0~1사이에서 추출)
rand(10) 

# ╔═╡ 2399aaa0-6062-4517-ac38-be9d4ed8a25b
# rand의 두 번째 기능: 주어진 값에서 원하는 개수만큼 복원 추출
rand([1,2,3,4,5,8],3) 

# ╔═╡ 9c2f38cd-3780-43de-b5d1-5e757613cfbf
md"""
`-` 리스트 컴프리헨션
"""

# ╔═╡ 67f92c8d-7167-4d28-8ab0-108b84e70c22
[√1, √2, √3, √4]

# ╔═╡ 6422cdf5-f670-496a-b10c-beae8c5886db
√4 + 1

# ╔═╡ cf4cee44-2b0b-4219-837d-d3fc2309add0
[2^i for i in [0,1,2,3]]
# 제곱할때 **이거 아님

# ╔═╡ 2f12986a-fdf3-47ce-9d5b-044543afaa30
[√i for i in [0,1,2,3]]

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─bc068777-a366-4552-a8d7-d2fd4429f01c
# ╟─7fd5c088-5ac0-432c-8aa5-251823a15dad
# ╠═93015177-90dd-4a75-85d7-d7c4d22545dd
# ╠═5f9cc659-444a-4aca-835d-4ebd3bc2db8a
# ╠═8c0dfc14-4f40-4928-bb8c-f973c9d3b54a
# ╠═037ea21a-bc67-4ede-9628-50d9ad29a6e7
# ╠═1674553a-8e42-4473-b574-6c814a8091fb
# ╠═fed45320-b7f4-478b-8a2a-bfb417f5e34d
# ╠═1f96e84b-4c3e-4fdc-8441-8fb4d3a49b3d
# ╠═6100965a-ec16-4274-9411-64f9dedc67a0
# ╠═7558f29d-b09d-4e89-aa3e-0493cf735b49
# ╠═be0ed6cb-fbb1-427f-bd9b-ab6b2f96bf70
# ╠═031ccf5a-fac5-4b03-97e1-abf1f88824e8
# ╠═a938bbfc-566d-4503-9543-24470a1568a5
# ╠═4e96a402-3eac-4a03-a3fb-050b67e5f165
# ╠═2745de40-c4a0-4233-aa97-6c367777f24a
# ╟─69ab7085-ffd6-41ea-9ac3-861cae5aa6cc
# ╟─7a9ec94b-4bf5-45e9-ace2-9d57789af169
# ╠═aa3c4cfd-e260-47fc-aa96-103995d99216
# ╠═e5f215a7-cff9-4274-931a-36ff0c6bb63a
# ╟─c5a27cde-cccf-45bd-b278-6712744714a3
# ╠═3f7b6a98-8b81-4dda-85d8-01ed3bf498d6
# ╠═7be5dda7-ec6a-4bac-b436-5efe82630bfe
# ╟─1f09e243-6d8e-450c-a396-5781656ffaf2
# ╟─ecd47dbd-784a-448b-8bd9-bdf71b7c6192
# ╠═0de4283c-3416-4ed3-90b4-59785bac2add
# ╠═52ecb331-9838-4039-bc2d-d8baff6bd394
# ╠═a594053f-73ed-43cb-88ac-ee2306d1a32d
# ╠═3dc2979b-6f03-4337-af32-6b039475c198
# ╠═92ba7de9-87a5-4d2c-a6b9-da3fe695463c
# ╠═1a34c0dd-3f49-45a5-968d-f8ac0ba70f96
# ╠═7d231a82-0126-4566-8b0b-308c3f45e065
# ╟─10461e54-a79a-4c26-bfd0-f657b135de80
# ╠═213b178c-6c93-497c-ac33-5ffce4975a97
# ╠═03b6c227-b712-432e-9259-b5d349bed203
# ╠═332839be-a047-483f-ae68-a453adee9998
# ╠═fd962b4a-3cde-405b-b8ed-5d7fce3c0f04
# ╠═b58c357a-1110-451c-96b9-dc2a816f0346
# ╠═cb9de97c-a884-4545-b143-d274611cb8a1
# ╠═c0f74c89-01a5-4b2b-b8fe-ed0c50edfb38
# ╠═a6b58372-9f41-45a2-87f7-ffe8da31cdda
# ╠═fd9ebe5a-6c7f-4c97-8474-69cf100e4f0b
# ╠═e69bcb1a-6b0a-459c-91b6-618691f93f49
# ╠═aae82467-bf7d-4065-954a-0368aca73d8e
# ╠═d34f35b8-eaac-4097-82b0-c1018590bf0d
# ╠═34d1f92f-8861-4c1b-b1ec-b41a95ccb32a
# ╟─a1e4fa99-24c5-44a4-80dd-16237211c351
# ╠═89daf982-a9c1-4583-a1bc-2e6366c6f125
# ╠═3699cac6-046d-467d-b756-ce38dd42d953
# ╠═ef6c82fa-b164-4321-b539-1b3577ad431a
# ╠═364c7521-f34e-44fe-9aff-8fcece4f8f10
# ╠═ff3a8440-164e-487e-aad7-d17f6e482e8c
# ╠═cb70b33d-f8ee-4e89-a5ee-90bc529460ea
# ╠═20df59d8-614c-4f10-914a-2e8b5c6ade45
# ╠═1f56d6f2-a59e-4a40-99e0-0abe9365bef1
# ╠═c27f0b69-796d-432c-8923-20c8868179ca
# ╠═07918808-d082-432a-8115-868ab95cba3f
# ╠═6947b7bb-bbd7-4b50-84f3-b3c760bdca93
# ╠═831328c6-fadf-4cff-9ab8-cc9d1839f6a8
# ╠═99bb3338-cc43-43aa-81ba-27d27afd61f6
# ╠═51a605f8-8e20-41d9-97c3-65b0c8aba622
# ╠═cb50e1d2-f5fb-40f7-a97e-dbacfe60913d
# ╟─3f75715e-a258-4ece-afe0-e73f9ad1d677
# ╟─6215cb02-5b52-445b-bfa8-eeac87470537
# ╠═2ef84c02-f271-4bae-a50e-cfd6738a99ec
# ╠═1ab70342-5bd3-4c06-942c-599b06c80e98
# ╠═2922318a-9db5-4fe9-9f3b-d70e8b53eae6
# ╠═83ee9ee0-0eab-41c6-846d-9352338aca8b
# ╠═c2909e6f-e0d2-4be6-9a36-6b53b622fa47
# ╠═c409f466-8d76-4e15-9de4-11cb0de44c2d
# ╟─468ae257-ce5b-429b-9d34-b2b0970d1b50
# ╠═354d1e00-d631-4f29-a289-351802ffb39e
# ╠═da88c5ab-f756-4c48-b32e-bc69482cbf69
# ╠═8b5c2f32-62f8-4973-ae0c-83a084868c58
# ╠═c8497ded-75a5-481c-8a65-1b2bf3c190a0
# ╠═f71bc70e-3f5b-47a5-94f9-c1976ab95284
# ╠═519be7e4-80cd-405b-800a-2034a899ba36
# ╠═8ec75baf-85d1-43f6-8c6c-ef3e19536529
# ╟─43f529e2-dd3f-472d-852b-bba8853ad9d8
# ╠═ce71647d-fb14-40c3-b3e3-5d094f7e4187
# ╠═406d8005-4b25-4ce8-91cd-05794332e3fb
# ╠═2ceac045-aac4-44f7-b969-d727595f30cb
# ╠═bd45fad2-58cc-4c1d-8069-15ea62150769
# ╠═2affadf8-d96c-467a-b725-d34888983acb
# ╠═2d288956-7028-4356-a987-ee8db76ae472
# ╠═c5ad6523-07c2-444c-9cd3-8e1ba61cfef8
# ╠═aa468bc9-8779-48be-889c-53e59e11315c
# ╠═dfe26b2c-e7f2-4db7-ab8a-94fb8a5beaa3
# ╠═e9df4f75-fec8-4fa0-8338-bd67c844bf4b
# ╠═0dc6ff92-b505-4ebc-97d9-a7761262f626
# ╠═9e83f7e9-9571-4195-b42b-62e12ea4d180
# ╠═4f407877-284c-4aca-9dad-a7b9a8e464b8
# ╟─5c347108-86f6-469c-9db3-a9e1a1e3c478
# ╠═556a13bc-2d9f-48ef-abe9-144ec33264bd
# ╠═d738dd15-b1bb-4e55-b788-c9212a488ed1
# ╠═f0e05ff9-820d-4b95-ad0d-770c72589a3b
# ╠═3406a77f-9ebc-4bd2-9082-2dafda0a1f08
# ╟─72c6cdb7-608f-44a6-8f2e-6dfdf4af3bcc
# ╠═306a8f60-8cad-49ce-934f-60294c85069b
# ╠═28933892-c486-48f0-b420-e4ff03d26ede
# ╠═87c766e5-ba46-43f2-b840-02b8566056e1
# ╟─9612c517-e2e4-4321-9045-e9cc70c8d650
# ╠═5be10235-e7cc-4b9a-9638-0ce11ddb8e95
# ╠═3207d546-05a1-4129-a775-5f9f18434d18
# ╠═f76342cd-6bf4-41ad-b0ba-e3ea67c966b4
# ╠═1b8eb691-dd34-4b78-bb2f-29b563ed8892
# ╠═c3b90a24-348a-40fe-bd9c-c2da508a11ea
# ╟─6e57bf96-a86c-41f3-96d6-82923ac359f3
# ╠═edbe00c1-f257-4b4a-898c-102188b3709a
# ╠═e3f215a9-b173-4c9c-85cd-f0872cf9b0f5
# ╠═676ffa7f-8a76-4f3b-8149-7cddd68bea9c
# ╠═9d5fe06b-8bc0-4b3f-be78-0f398b770bd8
# ╠═05863f75-5dc0-4086-804b-17b662b6595d
# ╠═9fe42106-43cb-4293-8e2e-dfcc71fd3da9
# ╠═e893ef4a-12b7-4ca3-8262-fb2e6ae2baa6
# ╟─cc10ac69-667a-4a41-8439-0aea0406e140
# ╠═546c0949-cbb7-4376-980b-cb5bae22b9ab
# ╠═d588d8fa-2978-435b-8c1b-fad79c7d5810
# ╠═cab2a579-7116-428a-bd45-4dff1eab3604
# ╠═c7d4b4f3-74f2-4fa5-aaae-62dbfb3a4b3a
# ╠═493d28a8-4295-4eb5-a159-5f2b1fd7942a
# ╠═98ec2369-df57-4668-a6ec-c738c52c458b
# ╠═7155f100-1d83-4c04-a30c-d7ba45ee74e8
# ╠═280937bb-9fa6-423c-874b-3cf814b6bd10
# ╠═0de890bc-be78-487d-9001-190cc8664587
# ╟─e8e7d4c7-70f0-45ab-9469-26cd6f70a7f6
# ╠═d966ce95-faf6-484a-87a8-6ffd273f31ff
# ╠═7b951345-bfa5-464d-a71c-ff067d427010
# ╠═2399aaa0-6062-4517-ac38-be9d4ed8a25b
# ╟─9c2f38cd-3780-43de-b5d1-5e757613cfbf
# ╠═67f92c8d-7167-4d28-8ab0-108b84e70c22
# ╠═6422cdf5-f670-496a-b10c-beae8c5886db
# ╠═cf4cee44-2b0b-4219-837d-d3fc2309add0
# ╠═2f12986a-fdf3-47ce-9d5b-044543afaa30
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
