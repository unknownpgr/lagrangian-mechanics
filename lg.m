clear;

% ????? ?? ??? ??
syms l(t) theta(t) m g k

% ??? ??
x = l*sin(theta)
y = -l*cos(theta)
U = m*g*y + k*l.^2/2

%===========================================================
% ? ????? ???? ?? ?? ?? ?? ???? ?.
%===========================================================

% ????? T? ??? ?????? ??
T = m*(diff(x,t).^2+diff(y,t).^2)/2
L = T - U

%===========================================================
% ??? ?? l? ?? ???-???? ???? ??
%===========================================================

% MATLAB??? ??? ??? ??? ? ??. ???? ??? ?? ??? ??.
syms lt l_t
LT = subs(L,diff(l,t),l_t);
LT = subs(LT,l,lt);

% ???-???? ???? ??? ??
E1 = diff(LT,lt);
E2 = diff(LT,l_t);

%? ?? ?? t? ???? ??? ???? ?? ???? ???? ??? ?? ??? ??
E1 = subs(E1,lt,l);
E1 = subs(E1,l_t,diff(l,t));
E2 = subs(E2,lt,l);
E2 = subs(E2,l_t,diff(l,t));

% ???-???? ???? ??
Eq = E1-diff(E2,t) == 0;

% ??? ??
EqL = simplify(Eq,'Steps',100);

%===========================================================
% ??? ?? theta? ?? ???-???? ???? ??
%===========================================================

% MATLAB??? ??? ??? ??? ? ??. ???? ??? ?? ??? ??.
syms thetat theta_t
LT = subs(L,diff(theta,t),theta_t);
LT = subs(LT,theta,thetat);

% ???-???? ???? ??? ??
E1 = diff(LT,thetat)
E2 = diff(LT,theta_t)

%? ?? ?? t? ???? ??? ???? ?? ???? ???? ??? ?? ??? ??
E1 = subs(E1,thetat,theta);
E1 = subs(E1,theta_t,diff(theta,t));
E2 = subs(E2,thetat,theta);
E2 = subs(E2,theta_t,diff(theta,t));

% ???-???? ???? ??
Eq = E1-diff(E2,t) == 0;

% ??? ??
EqT = simplify(Eq,'Steps',100);

%===========================================================
% ?? ???? ?????
%===========================================================

latex(EqL)
latex(EqT)

%===========================================================
% ?? ??? ???? ????? ?? ??
%===========================================================

syms l__t theta__t

EqL = subs(EqL,diff(l,t,t),l__t);
EqT = subs(EqT,diff(theta,t,t),theta__t);
SL = solve(EqL,l__t);
ST = solve(EqT,theta__t);
SL = simplify(SL,10)
ST = simplify(ST,10)
latex(SL)
latex(ST)