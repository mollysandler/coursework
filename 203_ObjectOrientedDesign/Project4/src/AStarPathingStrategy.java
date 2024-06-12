import java.util.*;
import java.util.function.BiPredicate;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Stream;

class AStarPathingStrategy implements PathingStrategy { //kind of blindly trusting zach here but reviewed and done i think


    public List<Point> computePath(Point start, Point end,
                                   Predicate<Point> canPassThrough,
                                   BiPredicate<Point, Point> withinReach,
                                   Function<Point, Stream<Point>> potentialNeighbors) {

        Comparator<Node> fcomp = Comparator.comparingInt(Node::getF);
        PriorityQueue<Node> theQueue = new PriorityQueue<>(fcomp);
        List<Point> path = new LinkedList<>();
        HashMap<Point, Node> closedList = new HashMap<>();
        HashMap<Point, Node> openList = new HashMap<>();

        Node current = new Node(start, null, 0, Math.abs(start.x - end.x) + Math.abs(start.y - end.y));

        theQueue.add(current);
        openList.put(current.getLocation(), current);
        boolean done = false;

        List<Node> validNeighbors = new LinkedList<>();

        while (!done) {
            System.out.println(theQueue.size());
            validNeighbors.clear();
            List<Point> list = potentialNeighbors
                    .apply(new Point(current.getLocation().x, current.getLocation().y))
                    .filter(canPassThrough)
                    .toList();
            if(list.size()==0){
                done = true;
            }

            for (Point point : list) {
                if (!(closedList.containsKey(point))) {
                    validNeighbors.add(new Node(point, current, current.getG() + 1,
                            Math.abs(point.x - end.x) + Math.abs(point.y - end.y)));
                }
            }

            for (Node validNeighbor : validNeighbors) {
                if (!openList.containsKey(validNeighbor.getLocation())) {
                    openList.put(validNeighbor.getLocation(), validNeighbor);
                    if (!theQueue.contains(validNeighbor)) {
                        theQueue.add(validNeighbor);
                    }
                } else {
                    int oldGuyGCost = openList.get(validNeighbor.getLocation()).getG();
                    int newguyGCost = validNeighbor.getG();
                    if (newguyGCost < oldGuyGCost) {
                        openList.get(validNeighbor.getLocation()).setG(newguyGCost);
                        theQueue.remove(openList.get(validNeighbor.getLocation()));
                        if (!theQueue.contains(validNeighbor)) {
                            theQueue.add(validNeighbor);
                        }

                    }
                    if (!theQueue.contains(validNeighbor)) {
                        theQueue.add(validNeighbor);
                    }
                }
            }

            closedList.put(current.getLocation(), current);
            openList.remove(current.getLocation(), current);
            current = theQueue.poll();

            if (current == null || withinReach.test(current.getLocation(), end)) {
                done = true;
            }

        }

        //System.out.println("gets here");
        if (current == null) {
            //System.out.println("finishes");
            return path;
        }

        while (!(current.getLocation().equals(start))) {
            path.add(current.getLocation());
            current = current.getPrevious();
        }
        Collections.reverse(path);

        System.out.println("done");
        return path;
    }
}//end of class
