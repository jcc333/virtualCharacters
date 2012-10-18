edge(a, b).   
edge(b, c).   
edge(c, d).   
edge(a, c).   
edge(f, g).   
edge(g, h).  

connected(A, A).
connected(A, B) :- (edge(A, B);edge(B, A));
                   connected(A, C),
                   connected(C, B).

% connected(NodeA, NodeB):-
%    (edge(NodeA, NodeB);edge(NodeB, NodeA));
%    (connected(NodeB, NodeC),
%     connected(NodeC, NodeA)).
