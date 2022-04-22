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

# ╔═╡ a944eb8d-7593-4715-9c87-9e51bc1e258d
using PlutoUI, Plots,Distributions

# ╔═╡ 6f859f74-8669-482b-990d-ceab405c308e
using ForwardDiff

# ╔═╡ 25335e5f-d5fc-4ce6-9086-3adc771d7eb3
md"""
# 4월12일 
"""

# ╔═╡ 2e24166d-19ab-4789-bc3a-e88df2a4e5a9
md"""
## usings 
"""

# ╔═╡ a67b5997-641e-477d-bf02-fe428a341367
PlutoUI.TableOfContents()

# ╔═╡ 9729506e-d348-4d98-bf73-4eb4129d4502
Plots.plotly()

# ╔═╡ 26054fba-2dc2-4a49-8670-d06cda967418
md"""
## 정규분포 
"""

# ╔═╡ b893bf74-479f-4316-bb8a-6fcaf79b668e
md"""
### note3: delta method 
`-` 이론: $\sqrt{n}(X_n -\theta) \overset{d}{\to} N(0,\sigma^2) \Rightarrow \sqrt{n}(g(X_n)-g(\theta)) \overset{d}{\to} N(0,g'(\theta)^2\sigma^2)$
- 예를 들면 $Z_n \overset{d}{\to} N(0,\sigma^2)$의 의미는 $Z_n \overset{d}{\to} Z, Z \sim N(0,1)$을 의미한다. 
"""

# ╔═╡ 29681c22-fe65-4243-9e92-69de752c75aa
md"""
> Delta Method : CLT를 기반으로 다양한 통계량들의 점근적 분포를 알 수 있음
"""

# ╔═╡ 2c7983ca-2384-4ec6-b2b9-223c4b6da683
md"""
> Delta Method : 어떤 함수 g(x)의 기댓값이나 분산을 몰라도 random variable X를 사용한 근사를 통해 함수 g(x)를 찾아가는 방법이며 CLT에 의해 성립한다.
"""

# ╔═╡ 04567107-6c16-4a88-84cf-b47d3dac9f8b
md"""
> Delta Method : 만약 어떤 변수가 근사적으로 정규분포를 따르면, 그 변수에 연속하는 함수(여기서는 g(x))를 씌워도 여전히 정규분포를 따른다. 즉, 평균도 정규분포를 따르고 분산도 정규분포를 따를 수 있다. 
"""

# ╔═╡ 07762ee6-27ed-49c9-9440-07217c33b053
md"""
> Delta Method : 점근적으로 정규화 된 확률 변수의 함수 분산을 얻어내는 방법
"""

# ╔═╡ e672f21f-2dca-49a8-9bc9-d770de7cca4c
md"""
- 앞부분의 가정은 대부분 중심극한 정리를 이용하여 만족시킬 수 있음. 
  - CLT: $\frac{\bar{X}-\mu}{\sqrt{\sigma^2/n}} \overset{d}{\to} N(0,1)$
  - 그런데 $\frac{\bar{X}-\mu}{\sqrt{\sigma^2/n}}=\sqrt{n}(\bar{X}-\mu)\frac{1}{\sigma}$. 여기에서 $\sqrt{n}(\bar{X}-\mu)\frac{1}{\sigma}$ N(0,1)로 수렴하므로 여기에 $\sigma$를 곱한것은 $N(0,\sigma^2)$으로 수렴할 것이다. 
  - 즉, $$\sqrt{n}(\bar{X}-\mu) \overset{d}{\to} N(0,\sigma^2)$$
  - 이제 $Y_n=\bar{X}=\frac{1}{n}\sum_{i=1}^{n}X_i$
  - 따라서 $\sqrt{n}(Y_n-\mu) \overset{d}{\to} N(0,\sigma^2)$
  - 결국 Delta Method의 가정은 "CLT가 성립할때~" 정도의 언어로 이해 가능"""

# ╔═╡ 23974c89-12e5-44ca-95b3-dcd001195270
md"""
- 델타메소드의 앞부분은 이해되었음.
- 델타메소드의 뒷부분을 이해하기 위해서는 테일러 정리를 이해해야 한다. 
"""

# ╔═╡ d31716ee-d2eb-40b4-9770-77e6b301de46
md"""
`-` 예비학습1 (테일러정리)
- 다항함수가 아닌 임의의 함수 f에 대해서 다항함수로 표현할 수 있음을 말함.
- 이론: $f(x) \approx f(a)+f'(a)(x-a)+f''(a)\frac{(x-a)^2}{2!}+ \dots +f^{(n)}(a)\frac{(x-a)^n}{n!}$
- 조건: $f(x)$는 $a$에서 $n$번 미분가능해야 함. 
"""

# ╔═╡ 1549bf36-967e-422f-8546-7837a8920cc6
md"""
`-` 예비학습2: ForwardDiff 패키지 이용하여 미분연산
"""

# ╔═╡ cd096641-a22c-4695-9c3a-7d370aaed3f1
md"""
(예제1) $f(x)=x^2$일때 $f'(2)$를 구하라.
"""

# ╔═╡ 404583ed-8aa2-4868-b46a-05f2a0d896d0
let 
	f(x)=x^2
	ForwardDiff.derivative(f,3) 
	# 한 번 시행할 때마다 한 번 미분, 그리고 미분된 함수 값에 3을 대입한 것임 
end

# ╔═╡ a5cdbf95-f452-4a89-8038-dacacdf87d90
md"""
(예제2) $f(x)=\sin(x)$ 일때 $f'(x)$를 plot하라. 
"""

# ╔═╡ 23ce71f5-f8bb-430e-9e2a-3d46a8a8ecd2
let 
	f(x) = sin(x)
	plot(f,-π,π)
	f′ = x -> ForwardDiff.derivative(f,x) 
	# 지점 x에 대해서 한 번 미분해주는 함수 f'
	
	plot!(f′)
	# 기존에 plot(f,-π,π)때 범위 설정돼서 !로 plot 겹쳐그릴 땐 범위 지정하지 않아도 된다.
end 

# ╔═╡ b522e633-e801-43c7-9c2e-9f8ba719255c
md"""
`-` 예비학습3: Forward diff로 테일러정리구현 

$f(x) \approx f(a)+f'(a)(x-a)+f''(a)\frac{(x-a)^2}{2!}+ \dots +f^{(m)}(a)\frac{(x-a)^m}{m!}$
"""

# ╔═╡ 7bc411ad-6021-4b35-9dd9-425833845d90
f(x) = exp(0.5*x)

# ╔═╡ 4b095354-fa56-4700-805e-7b94f758e5bf
∂f(m) = m==0 ? f : x -> ForwardDiff.derivative(∂f(m-1),x) 

# ∂f(0)과 f(0)은 엄연히 다른 함수임

# m차 미분의 정의
# 이를테면 ∂f(0)은 원함수
# 이를테면 ∂f(1) = x -> ForwardDiff.deriative(∂f(0),x)
# ∂f(1)은 ∂f(0)라는 원함수를 한 번 미분한 결과

# 만약 m=0이라면 미분되지 않은 원함수 ( 위에서 정의된 e^(0.5x) )
# 만약 m=1이라면 한 번 미분된 함수
# 만약 m=2라면 두 번 미분된 함수

# ╔═╡ a5913d22-cfa0-4b3d-8c24-5b18fadf059a
# 잠깐 복습
[1,2,3] .* [1,5,3]

# ╔═╡ daa2d3eb-71fa-4e88-8f70-3c92bc2b6814
# 곱셈은 브로드캐스팅할 때 dot 필요 없었는데 왜 바로 위 셀은 dot 빼주면 error 뜨지
[1,2,3] * 2
# 아 이건 되고 그냥 list 원소끼리 곱셈할 땐 dot필요

# ╔═╡ 67ff3e2d-802e-47fe-9bf9-75dea3beda14
# 잠깐 복습
2 .|> [x -> x-1, x -> x^2]
# 복습 끝

# ╔═╡ c40d3743-9e4f-4114-8511-f769572e1a88
md"a=$(@bind a Slider(-4:0.5:4,show_value=true))"

# ╔═╡ d5c72d0a-ce38-4613-be71-e1425a036387
md"m=$(@bind m Slider(0:8,show_value=true))"

# ╔═╡ e61a714b-4ee4-496c-a208-093513229792
function f̃(x)
	# 아래의 a와 m은 위에서 알아서 불러와 질 것이다. 
	_left = a .|> [∂f(i) for i in 0:m] 
	# [f(a), f'(a), f''(a), ... , f⁽ᵐ⁾(a)]
	# 함수들로 이루어진 list
	# 만약 m=8이라면 8개의 미분함수들이 list안에 들어가 있을 것
	
	_right = [(x-a)^i/factorial(i) for i in 0:m]
	
	return sum(_left .* _right) 
	# 이 함수를 통해서 아래 식의 우변을 구현한 것임
end

# ╔═╡ 1355e0a0-1062-4c11-bb25-eb9ebda7ebdd
md"""
$f(x) \approx f(a)+f'(a)(x-a)+f''(a)\frac{(x-a)^2}{2!}+ \dots +f^{(m)}(a)\frac{(x-a)^m}{m!}$
"""

# ╔═╡ 99d4bc91-78be-4cc8-b894-7dbea2d6368b
begin

	plot(f, -4,4,ylim=(-3,10)) # 아래 셀에서의 lhs, 즉 그냥 원함수인 e^(0.5x)

	plot!(f̃) 
	# 아래 셀에서의 rhs, rhs라는 긴 함수에 -4,4까지의 값을 넣어 plot 처리해준 것임
	# 테일러 함수의 의미를 잠깐 살펴보자면
	# 특정 지점 a에서의 근사를 1차 미분 + 2차 미분 + 3차 미분 + ...을 통해서 근사시키는 것임
	# (미적분학 시간에 배우는 선형근사를 생각해보면 될 것 같은데, 그때의 선형근사는 1차미분만해서 근사시켰다면 여기서는 1,2,3차,,등등 미분을 통해서 특정지점 a에서의 근사를 구하는 것임, 그래서 m값을 늘려주면, 즉 미분차수를 늘려주면 더 정확하게 근사됨을 알 수 있다. )


	scatter!([a],[f(a)])
	# scatter에 점 뿌릴 때 list로 넣어줘야 한다. 
end

# ╔═╡ 0b9dd29f-06a1-49bc-98a5-96957592930f
md"""
$f(x) \approx f(a)+f'(a)(x-a)+f''(a)\frac{(x-a)^2}{2!}+ \dots +f^{(m)}(a)\frac{(x-a)^m}{m!}$
"""

# ╔═╡ 4ae9114e-f4b7-4cef-adaa-80bb29b70833
md"""
- 테일러 정리
  - 다항함수가 아닌 임의의 함수 f를 다항식으로 표현할 수 있다. 
"""

# ╔═╡ 0e70491e-169b-48a8-9bae-cbc1204d1f38
md"""
---
"""

# ╔═╡ e2c03926-5954-42d0-80c2-92621b4ae1c7
md"""
---
"""

# ╔═╡ a4cfdd0f-6fd5-4710-87a4-f5e25fa177b7
md"""
`-` 델타메소드 느낌 
"""

# ╔═╡ 71c61bfd-8792-47e7-b19b-1b53a8f79aa5
md"""
(가정)$\sqrt{n}(X_n-\theta) \overset{d}{\to} N(0,\sigma^2)$
- 이건 CLT로 설명하였다면..
  - 그럼 여기서 θ는 확률변수 $Xₙ$의 평균인가?

(과정?)
-  $g(x) \approx g(\theta) + g'(\theta)(x-\theta)$
  - 테일러 정리.............
-  $g(X_n) \approx g(\theta) + g'(\theta)(X_n-\theta)$
-  $g(X_n)-g(\theta)  \approx  g'(\theta)(X_n-\theta)$
-  $\sqrt{n}(g(X_n)-g(\theta)) \approx \sqrt{n}g'(\theta)(X_n-\theta) \overset{d}{\to} g'(\theta) N(0,\sigma^2)$


(결론) $\sqrt{n}(g(X_n)-g(\theta)) \overset{d}{\to} g'(\theta) N(0,\sigma^2)$

"""

# ╔═╡ 7dd5475f-db8e-49ae-ae8d-98524ec1e8a4
md"""
---
"""

# ╔═╡ fe6a5379-9cd2-4e16-926a-da82541a56fd
md"""
###### 예제 - 베르누이분포의 평균과 분산추정
- $X_1,X_2,\dots, X_n \sim Ber(p)$ 이라고 하자. 평균은 $\hat{p}$로 분산은 $\hat{p}(1-\hat{p})$로 추정한다고 하자. 단 $\hat{p}=\bar{X}_n$. 이때 $\mu$와 $\sigma^2$에 대한 점근적 신뢰구간을 구하여라.
"""

# ╔═╡ 54e958f7-ef8d-4718-a722-1b6e5ec93946
p_slider = @bind p Slider(0.1:0.1:0.9,show_value=true)

# ╔═╡ 6b513058-30d1-4153-bc47-953e8cde2501
n_slider = @bind n Slider([100,1000,10000,100000],show_value=true)

# ╔═╡ 119f3edc-bb71-4f4b-bfc7-f9d8a09602cc
md"""
(풀이1) 시뮬레이션을 이용한 풀이 
"""

# ╔═╡ 61fc341b-bf89-436b-bbb7-9c3413c0ee03
begin
	N = 1000 
	
	# 평균의 추정치들 
	mean_est = [rand(Bernoulli(p),n) |> mean for i in 1:N]

	# 분산의 추정치들 
	g = p̂ -> p̂*(1-p̂)
	var_est = mean_est .|> g # mean_est가 p̂이니까
	 

	
	# μ와 σ²에 대한 95% 점근적 신뢰구간 ?
	l1, u1 = quantile(mean_est,0.025), quantile(mean_est,0.975)
	l2, u2 = quantile(var_est,0.025), quantile(var_est,0.975)

	# 주황색 bar가 95% 신뢰구간 안에 있는 sample들.
	# 파란색 bar는 그 밖의 sample들.
	p1 = histogram(mean_est); histogram!(mean_est[l1 .≤ mean_est .≤ u1])
	p2 = histogram(var_est); histogram!(var_est[l2 .≤ var_est .≤ u2])
	
	pp = plot(p1,p2,layout=(1,2))

	md"""
	요약 
	-  $(\mu,\sigma^2)=$ $(p,p*(1-p))
	-  $\mu$의 신뢰구간: $(l1,u1)
	-  $\sigma^2$의 신뢰구간: $(l2,u2)
	-  히스토그램 $pp
	"""
end 

# ╔═╡ bdcca8d2-1356-4f9a-933b-6a4222646db1
md"""
- 그런데 p=0.5일때는 왜이러지? 코드를 잘못짰나? 
"""

# ╔═╡ 95dbb062-7fc2-4144-912b-f957c20acc94
md"""
(풀이2) 델타메소드를 이용한 풀이 
"""

# ╔═╡ ca0baa77-9e14-4c8e-8d1e-91ee3a05e273
md"""
`-` 목적 
- 평균: $\bar{X}_n \sim ?$  은 무슨 분포?
- 분산: $\bar{X}_n(1-\bar{X}_n) \sim ?$  은 무슨 분포?
  - 아....그럼 $\bar{X}_n(1-\bar{X}_n)$라는 걸 g(X̄ₙ)으로 보는듯 !
    - 여기서 g(x) = x(1-x)이고 여기에 X̄ₙ(=p)를 넣어서 p(1-p)의 분포를 알 수 있는 것!
  - 즉, g(X̄ₙ)자체의 분포를 확인하는 것 !
"""

# ╔═╡ 5a34a99f-0ade-4855-b275-27040fa821df
md"""
`-` CLT: $\sqrt{n}(\bar{X}_n-p ) \to N(0,p(1-p))$

`-` Delta method: $\sqrt{n}(g(\bar{X}_n)-g(p) ) \to N(0,g'(p)^2*p(1-p) )$

`-` Plug in $g(x) = x(1-x)$ and $g'(x)=1-2x$.

$$\sqrt{n}(\bar{X}_n(1-\bar{X}_n)-p(1-p) ) \to  N\big\{0,(1-2p)^2*p(1-p) \big\}$$

"""

# ╔═╡ f3c5020b-50c0-4273-a3b3-5abe9015d419
md"""
- CLT에 의하여, $\bar{X}_n \to N(p,p(1-p)/n)$

- Delta method에 의하여, $g(\bar{X}_n)  \to N(g(p),g'(p)^2*p(1-p)/n )$
  - 여기서 g(X̄ₙ)은 X̄ₙ(1-X̄ₙ)를 의미함
  - 이제 이것의 분포를 찾는 것임

- Plug in $g(x) = x(1-x)$ and $g'(x)=1-2x$.

$$\sqrt{n}(\bar{X}_n(1-\bar{X}_n)-p(1-p) ) \to  N\big\{0,(1-2p)^2*p(1-p) \big\}$$

"""

# ╔═╡ fd8062e9-3dcb-484e-aca1-338ef4c18e0a
md"""
> - 평균의 분포는 CLT에 의해서 파악
> - 분산의 분포는 delta method에 의해 파악
"""

# ╔═╡ 915b4c7a-9bfe-47b1-8a6d-823cb8f14277
md"""
> Delta Method란 어떤 함수 g(x)의 기댓값이나 분산을 몰라도 random variable X를 사용한 근사를 통해 함수 g(x)를 찾아가는 방법이며 CLT에 의해 성립한다.
"""

# ╔═╡ 5665c410-559d-44ff-8f33-59cc83f2ced0
md"""
-  p =  $\frac{1}{2}$일때는 $\bar{X}_n(1-\bar{X}_n)$의 점근적 분포에서 분산이 정의되지 않음
- 분산이 0이 됨, 즉 정규분포로 갈 수 없음
- 그래서 아까 p가 0.5일 때 그래프가 이상했었음
"""

# ╔═╡ 58fcf3d1-65ae-439a-a8ac-390d294222c1
md"""
`-` $\mu(=p)$에 대한 신뢰구간: $\sqrt{n}(\bar{X}_n-p ) \to N(0,p(1-p))$ 이용
"""

# ╔═╡ 7f0d0398-326f-48f3-89cd-922fa12021aa
let 
	μ = p  ## 점근적으로 근사된 정규분포의 평균 , 베르누이의 평균을 의미하는 게 아님
	σ = √(p*(1-p)/n)   ## 점근적으로 근사된 정규분포의 표준편차 
	l = quantile(Normal(μ,σ),0.025) |> x-> round(x,digits=5)
	u = quantile(Normal(μ,σ),0.975) |> x-> round(x,digits=5)
	md"""
	-   $\mu=$ $p
	-   $\mu$의 신뢰구간 $(l,u)
	- 시뮬레이션값 of 신뢰구간: $(l1,u1)
	"""
end 

# ╔═╡ 1abe2f40-4ccc-4b81-b632-5dff30c51fc9
md"""
`-` $\sigma^2$에 대한 신뢰구간: $\sqrt{n}(\bar{X}_n(1-\bar{X}_n)-p(1-p) ) \to  N\big\{0,p(1-p)(1-2p)^2 \big\}$이용
"""

# ╔═╡ 68b5142c-431c-49f4-b780-576ef8136d63
let 
	μ= p*(1-p)  ## 점근적으로 근사된 정규분포의 평균 
	σ= √(p*(1-p)*(1-2p)^2/n)   ## 점근적으로 근사된 정규분포의 표준편차 
	l = quantile(Normal(μ,σ),0.025) |> x-> round(x,digits=5)
	u = quantile(Normal(μ,σ),0.975) |> x-> round(x,digits=5)
	md"""
	-  $\sigma^2=$ $(p*(1-p))
	-  $\sigma^2$의 신뢰구간 $(l,u)
	- 시뮬레이션값: $(l2,u2)
	"""
end 

# ╔═╡ 662f63ea-a25b-4f6a-a20b-6d2d985c2710
md"""
`-` 궁금: $p=0.5$에서 어떤일이 일어나는 걸까? 
"""

# ╔═╡ 8b4d1116-97ab-4d75-9945-e0ef8448e951
md"""
- p= $p_slider
- n= $n_slider
"""

# ╔═╡ 8ea78d6b-7eb5-42f0-aac9-fda73f8b9a81
begin
	plot(g, 0,1 ,ylim=(-0.01,0.26))
	scatter!(mean_est, mean_est.*0)
	scatter!(var_est .*0, var_est)
	scatter!(mean_est,g.(mean_est))
	
	# g = p̂ -> p̂*(1-p̂)
	g′ = x -> ForwardDiff.derivative(g,x)
	
	# 점(p, g(p))를 지나고 기울기가 g′(p)인 직선 
	plot!(x -> g′(p)*(x-p)+g(p),color="red") 
end

# ╔═╡ 51ca38c6-d8f8-4d6f-8705-23e8915a106d
md"""
`-` 델타메소드의 식과 위의 그림을 다시 비교하면서 정리하면 

$\sqrt{n}(\bar{X}_n -\theta) \overset{d}{\to} N(0,\sigma^2) \Rightarrow \sqrt{n}(g(\bar{X}_n)-g(\theta)) \overset{d}{\to} g'(\theta)N(0,\sigma^2)$

- x축: $\bar{X}_n$
- y축: $g(\bar{X}_n)=\bar{X}_n(1-\bar{X}_n)$
- 근사: y축은 실제로는 곡선에 의한 상이지만 근사적으로 직선(접선)에 의한 상이라고 생각해도 무방.
  - 결론은 p가 0.5일 때 접선에 의한 상이 분산이 없음
  - n이 클 수록 분포가 거의 한 점에 몰려있음
  - 정규분포를 띄지 않게 된다.
- x축의 분포는 CLT에 의해서 정규분포로 간다고 가정. 
- y축의 분포는 x축의 분포에서 $g'(p)$를 타고 맵핑되는 분포로 생각가능. (근사적으로..)
- y축의 분포는 결국 Delta Method에 의해 N(평균=$g(p)$, 분산=원래 $x$축의 분산에 기울기값 $g'(p)$의 제곱을 곱한값) 인 정규분포로 수렴. 
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"
ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Distributions = "~0.25.53"
ForwardDiff = "~0.10.25"
Plots = "~1.27.5"
PlutoUI = "~0.7.38"
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
git-tree-sha1 = "9950387274246d08af38f6eef8cb5480862a435f"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.14.0"

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

[[deps.CommonSubexpressions]]
deps = ["MacroTools", "Test"]
git-tree-sha1 = "7b8a93dba8af7e3b42fecabf646260105ac373f7"
uuid = "bbf7d656-a473-5ed7-a52c-81e309532950"
version = "0.3.0"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "b153278a25dd42c65abbf4e62344f9d22e59191b"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.43.0"

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

[[deps.DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "80c3e8639e3353e5d2912fb3a1916b8455e2494b"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.4.0"

[[deps.DiffResults]]
deps = ["StaticArrays"]
git-tree-sha1 = "c18e98cba888c6c25d1c3b048e4b3380ca956805"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.0.3"

[[deps.DiffRules]]
deps = ["IrrationalConstants", "LogExpFunctions", "NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "dd933c4ef7b4c270aacd4eb88fa64c147492acf0"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.10.0"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "5a4168170ede913a2cd679e53c2123cb4b889795"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.53"

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
git-tree-sha1 = "bad72f730e9e91c08d9427d5e8db95478a3c323d"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.8+0"

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

[[deps.FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "246621d23d1f43e3b9c368bf3b72b2331a27c286"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.13.2"

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

[[deps.ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "LogExpFunctions", "NaNMath", "Preferences", "Printf", "Random", "SpecialFunctions", "StaticArrays"]
git-tree-sha1 = "1bd6fc0c344fc0cbee1f42f8d2e7ec8253dda2d2"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.25"

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
git-tree-sha1 = "af237c08bda486b74318c8070adb96efa6952530"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.64.2"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "cd6efcf9dc746b06709df14e462f0a3fe0786b1e"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.64.2+0"

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
git-tree-sha1 = "6f14549f7760d84b2db7a9b10b88cd3cc3025730"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.14"

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
git-tree-sha1 = "a7e100b068a6cbead98b9f4e5c8b488934b7aea0"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.11"

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
git-tree-sha1 = "b086b7ea07f8e38cf122f5016af580881ac914fe"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.7"

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

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ab05aa4cc89736e95915b01e7279e61b1bfe33b8"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.14+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

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

[[deps.PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "e8185b83b9fc56eb6456200e873ce598ebc7f262"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.7"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "621f4f3b4977325b9128d5fae7a8b4829a0c2222"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.4"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Statistics"]
git-tree-sha1 = "8162b2f8547bc23876edd0c5181b27702ae58dce"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.0.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "bb16469fd5224100e422f0b027d26c5a25de1200"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.2.0"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "88ee01b02fba3c771ac4dce0dfc4ecf0cb6fb772"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.27.5"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "670e559e5c8e191ded66fa9ea89c97f10376bb4c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.38"

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

[[deps.QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "78aadffb3efd2155af139781b8a8df1ef279ea39"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.4.2"

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
git-tree-sha1 = "dc1e451e15d90347a7decc4221842a022b011714"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.5.2"

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

[[deps.Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[deps.Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

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

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "5ba658aeecaaf96923dce0da9e703bd1fe7666f9"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.4"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "4f6ec5d99a28e1a749559ef7dd518663c5eca3d5"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.4.3"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "8d7530a38dbd2c397be7ddd01a424e4f411dcc41"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.2.2"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8977b17906b0a1cc74ab2e3a05faa16cf08a8291"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.16"

[[deps.StatsFuns]]
deps = ["ChainRulesCore", "InverseFunctions", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "5950925ff997ed6fb3e985dcce8eb1ba42a0bbe7"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.18"

[[deps.StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "57617b34fa34f91d536eb265df67c2d4519b8b98"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.5"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

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
# ╟─25335e5f-d5fc-4ce6-9086-3adc771d7eb3
# ╟─2e24166d-19ab-4789-bc3a-e88df2a4e5a9
# ╠═a944eb8d-7593-4715-9c87-9e51bc1e258d
# ╠═a67b5997-641e-477d-bf02-fe428a341367
# ╠═9729506e-d348-4d98-bf73-4eb4129d4502
# ╟─26054fba-2dc2-4a49-8670-d06cda967418
# ╟─b893bf74-479f-4316-bb8a-6fcaf79b668e
# ╟─29681c22-fe65-4243-9e92-69de752c75aa
# ╟─2c7983ca-2384-4ec6-b2b9-223c4b6da683
# ╟─04567107-6c16-4a88-84cf-b47d3dac9f8b
# ╟─07762ee6-27ed-49c9-9440-07217c33b053
# ╟─e672f21f-2dca-49a8-9bc9-d770de7cca4c
# ╟─23974c89-12e5-44ca-95b3-dcd001195270
# ╟─d31716ee-d2eb-40b4-9770-77e6b301de46
# ╟─1549bf36-967e-422f-8546-7837a8920cc6
# ╠═6f859f74-8669-482b-990d-ceab405c308e
# ╟─cd096641-a22c-4695-9c3a-7d370aaed3f1
# ╠═404583ed-8aa2-4868-b46a-05f2a0d896d0
# ╟─a5cdbf95-f452-4a89-8038-dacacdf87d90
# ╠═23ce71f5-f8bb-430e-9e2a-3d46a8a8ecd2
# ╟─b522e633-e801-43c7-9c2e-9f8ba719255c
# ╠═7bc411ad-6021-4b35-9dd9-425833845d90
# ╠═4b095354-fa56-4700-805e-7b94f758e5bf
# ╠═a5913d22-cfa0-4b3d-8c24-5b18fadf059a
# ╠═daa2d3eb-71fa-4e88-8f70-3c92bc2b6814
# ╠═67ff3e2d-802e-47fe-9bf9-75dea3beda14
# ╠═c40d3743-9e4f-4114-8511-f769572e1a88
# ╠═d5c72d0a-ce38-4613-be71-e1425a036387
# ╠═e61a714b-4ee4-496c-a208-093513229792
# ╟─1355e0a0-1062-4c11-bb25-eb9ebda7ebdd
# ╠═99d4bc91-78be-4cc8-b894-7dbea2d6368b
# ╟─0b9dd29f-06a1-49bc-98a5-96957592930f
# ╟─4ae9114e-f4b7-4cef-adaa-80bb29b70833
# ╟─0e70491e-169b-48a8-9bae-cbc1204d1f38
# ╟─e2c03926-5954-42d0-80c2-92621b4ae1c7
# ╟─a4cfdd0f-6fd5-4710-87a4-f5e25fa177b7
# ╟─71c61bfd-8792-47e7-b19b-1b53a8f79aa5
# ╟─7dd5475f-db8e-49ae-ae8d-98524ec1e8a4
# ╟─fe6a5379-9cd2-4e16-926a-da82541a56fd
# ╠═54e958f7-ef8d-4718-a722-1b6e5ec93946
# ╠═6b513058-30d1-4153-bc47-953e8cde2501
# ╟─119f3edc-bb71-4f4b-bfc7-f9d8a09602cc
# ╠═61fc341b-bf89-436b-bbb7-9c3413c0ee03
# ╟─bdcca8d2-1356-4f9a-933b-6a4222646db1
# ╟─95dbb062-7fc2-4144-912b-f957c20acc94
# ╟─ca0baa77-9e14-4c8e-8d1e-91ee3a05e273
# ╟─5a34a99f-0ade-4855-b275-27040fa821df
# ╟─f3c5020b-50c0-4273-a3b3-5abe9015d419
# ╟─fd8062e9-3dcb-484e-aca1-338ef4c18e0a
# ╟─915b4c7a-9bfe-47b1-8a6d-823cb8f14277
# ╟─5665c410-559d-44ff-8f33-59cc83f2ced0
# ╟─58fcf3d1-65ae-439a-a8ac-390d294222c1
# ╟─7f0d0398-326f-48f3-89cd-922fa12021aa
# ╟─1abe2f40-4ccc-4b81-b632-5dff30c51fc9
# ╟─68b5142c-431c-49f4-b780-576ef8136d63
# ╟─662f63ea-a25b-4f6a-a20b-6d2d985c2710
# ╟─8b4d1116-97ab-4d75-9945-e0ef8448e951
# ╠═8ea78d6b-7eb5-42f0-aac9-fda73f8b9a81
# ╟─51ca38c6-d8f8-4d6f-8705-23e8915a106d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
