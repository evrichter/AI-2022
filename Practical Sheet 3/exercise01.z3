(declare-datatypes () ((Vertex A B C D E F G H)))
(declare-fun Edge (Vertex Vertex) Bool)
(declare-fun Reachable (Vertex Vertex) Bool)
(declare-fun Isolated (Vertex) Bool)



; 1. Fully specify the graph by providing the definition of the Edge relation
(assert (and (Edge A B) (Edge A C) (Edge D A) (Edge B C) (Edge F C) (Edge C E) (Edge C D) (Edge E E) (Edge D E) (Edge H F) (Edge F G)))
(assert (and (not (Edge A D)) (not (Edge A E)) (not (Edge A F)) (not (Edge A G)) (not (Edge A H)) (not (Edge B A)) (not (Edge B D)) (not (Edge B E)) (not (Edge B F)) (not (Edge B G)) (not (Edge B H)) (not (Edge C A)) (not (Edge C B)) (not (Edge C F)) (not (Edge C G)) (not (Edge C H)) (not (Edge D B)) (not (Edge D C)) (not (Edge D F)) (not (Edge D H)) (not (Edge D G)) (not (Edge E A)) (not (Edge E B)) (not (Edge E C)) (not (Edge E D)) (not (Edge E F)) (not (Edge E G)) (not (Edge E H)) (not (Edge E G)) (not (Edge G A)) (not (Edge G B)) (not (Edge G C)) (not (Edge G D)) (not (Edge G E)) (not (Edge G F)) (not (Edge G H)) (not (Edge H A)) (not (Edge H B)) (not (Edge H C)) (not (Edge H D)) (not (Edge H E)) (not (Edge H G)) (not (Edge F A)) (not (Edge F B)) (not (Edge F D)) (not (Edge F E)) (not (Edge F H))))


; 2. Every node can reach itself
(assert (forall ((x Vertex)) (Reachable x x)))


; 3. If there is an edge from x to y and y can reach z then x can reach z
(assert (forall ((x Vertex) (y Vertex) (z Vertex)) (=> (and (Edge x y) (Reachable y z)) (Reachable x z))))


; 4. A node is isolated if and only if there is no incoming or outgoing edge
(assert (forall ((x Vertex)) (= (Isolated x) (not (exists ((y Vertex)) (or (Edge x y) (Edge y x)))))))

 
; 5. Show that vertex E is reachable from vertex A and
; that no vertex in the graph is isolated.

(check-sat)

(echo " ")
(echo "Whether the E is reachable from A: ")
(get-value ((Reachable A E)))

(echo " ")
(echo "Whether the vertices are isolated: ")

(get-value ((Isolated A)))
(get-value ((Isolated B)))
(get-value ((Isolated C)))
(get-value ((Isolated D)))
(get-value ((Isolated E)))
(get-value ((Isolated F)))
(get-value ((Isolated G)))
(get-value ((Isolated H)))