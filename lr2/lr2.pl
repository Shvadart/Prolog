
% ��������� ��������������� ���������� � ������� �������������� ������
% ��������� ����������������� ����� �� ������������ ������� ����� � ���������� ��������� ��
% ����� ������ ����������
% �������,
% "��� ��������� ������ �������, ������� ������".
% ���_��������� = ���_����(X,�������(X)&&������(X)=>���������(���,X))

% ��� ��������� ��������� ���������� ������� ��.21  ��. �.������
% "��������� �������������� ���������� �� ����� PROLOG"
%
% �������
% 1.��������� ���������������� �����������.
% 2.��������� ��� �� ������.
% 3.������������� � ���������� ���������.
% 4. ������ �������� ������ (������ ������� ����������� �� ��������� �������)
% 5. ��������� ������ ��������������� �������
% 6. ��������� ���������� � ����� ������������� �������������� � �������.
% 7. ��� ������������� ��������� �������.
% 8. ��������� ������� DGL-������.
% 9. ��� DGL-������� ����� ��������� � ��������� �������.


:- use_rendering(svgtree, [list(false)]). % ����������� ������������� ����� � ���� ������ (����� ������)
:- dynamic ������/1. % ����������� ����������� �������� � ������� ������������� assert/1

% ���������� ���������, ��������������,  ����������, ���������� � ����������
:-  op( 100, xfy, &&).
:-  op( 100, xfy, @@).
:-  op( 150, xfy, =>).

% ���_��������� - ���������, ������������� �� �������� ������ ���� ������ � ������.

��������_�����(���_���������1 => ���_���������2 ) -->
    ����(_),
    ������_���_�����(���_���������1),
    ��(_),
	������_���_�����(���_���������2).

����('����') --> ['����'].
����('����') --> ['����'].
��('��') --> ['��'].

������_���_�����(���_��������� ) --> �����������(���_���������).
% ����
������_���_�����(���_���������1 && ���_���������2) -->
	�����������(���_���������1),
    ����_�(_),
    ������_���_�����(���_���������2 ).
% ����
������_���_�����(���_���������1 @@ ���_���������2) -->
	�����������(���_���������1),
    ����_���(_),
    ������_���_�����(���_���������2 ).

����_�('�') --> ['�'].
����_�(',') --> [','].
����_�('�') --> ['�'].
����_���('���') --> ['���'].
����_���('����') --> ['����'].
����_���(';') --> [';'].

�����������(�������, ���_���������)  -->
	������_���(�������,��������, ���_���������),
    ������_�������(�������,��������).

������_���(S, P, P)  --> ���_������(S).
������_���(S, P, P)  --> �����������(S).
������_���( S, P, Y)  -->
    ������������( S, P2, P, Y),
    ���( S, P1),
    ����_�����( S, P1, P2).

������_�������( S, P)  --> �������_��( S, P).
������_�������( S, P)  --> �����_��( S, Y, P1),������_���(Y, P1, P).
������_�������( S, P)  --> �����_��( S, Y, P), ���������( Y),!.
������_�������( _, �����������)  --> ['!'].
������_�������( _, ������)  --> ['?'];['�� ������ ��?'].

%������������( S, P1, P, ���_����( S, P1 => P)) --> [����];[���].
������������( S, P1, P, ���_����( S, P1 => P)) --> [������];[������];[���_����].
������������( S, P1, P, ����������( S, P1 && P)) --> [����������];[���������];[�����_��].
������������( _, P1, P, P1 && P) --> [].

���(X, F)  -->
    �����(Y),{F=..[Y,X]}. % F = Y(X)
���(X, P&&F)  -->
    ������(X,P),
    �����(Y),{F=..[Y,X]}. % F = Y(X)

����_�����( X, P1, P1 && P2)  -->
    [�������],
    ������_�������( X, P2).
����_�����( _, P1, P1)  --> [].

������(X,F)     -->
    ��������������(Y),
    {F=..[Y,X]}.
������(X,F&&Fs) -->
    ��������������(Y),
    {F=..[Y,X]}, % F = Y(X)
    ������(X,Fs).
������(X,F&&Fs) -->
    ��������������(Y),
    {F=..[Y,X]}, % F = Y(X)
    ([�];[',']),
    ������(X,Fs).

���������(X) -->
    ������(X).

�����_��( X, Y, F)  -->
    �����_������(Z),
    {F=..[Z,X,Y]}. % F = Z(X,Y)

�������_��(X, F)  -->
    �������_������(Y),
    {F=..[Y,X]}.   % F = Y(X)

�����_������(��������) -->  [��������].
�����_������(�����) -->  [�����].
�����_������(���������) -->  [���������].
�����_������(�����������) -->  [�����������].
�����_������(������) -->  [������].
�����_������(�����) -->  [�����].

�������_������(������) -->  [������].
�������_������(�����) -->  [�����].
�������_������(�����) -->  [�����].
�������_������(�����) -->  [�����].

�����(�������) --> [�������].
�����(�������) --> [�������].
�����(���) --> [���].

������(��������) --> [��������].
������(������) --> [������].
������(������) --> [������].

���_������(����)  -->  [����].
���_������(���)   -->  [���].
���_������(����)  -->  [����].
���_������(�����)  -->  [�����].

�����������(�)  -->  [�].
�����������(��)  -->  [��].
�����������(��)  -->  [��].
�����������(���)  -->  [���].
�����������(���)  -->  [���].
�����������(���)  -->  [���].

��������������(����������)--> [����������].
��������������(��������)--> [��������].
��������������(����������)--> [����������].

% ��� �������������� ������ � ������ ������� ����� ������������ ��������� ��������
% tokenize_atom('��� ���� ����� ������� ������, ����� �� � ����� �������', TokenList )

/** <examples>
?- �����������(X, ���_���������, [����,������],[]).
?- �����������(X, ���_���������, [���������,�������,������],[]).
?- �����������(X, ���_���������, [������, �������, ������],[]).
?- �����������(X, ���_���������, [������,�������,�������,������,�����������,����],[]).
?- �����������(X, ���_���������, [���,���������,������,�������,�������,������],[]).
?- �����������(X, ���_���������, [���,���������,������,���_��,�������,������_���_��],[]).
*/
