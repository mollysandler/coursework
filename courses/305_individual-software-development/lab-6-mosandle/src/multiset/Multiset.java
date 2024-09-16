package multiset;
import java.util.Optional;

/**
 * Interface for multiset (bag) implementations; unordered collection of elements
 * allowing for duplicate (according to .equals()) entries.
 *
 * @param <E> specified element type
 */
public interface Multiset<E> {
  /**
   * Add an element to the multiset. Duplicates are allowed.
   *
   * @param element the value to add to the collection
   */
  void add(E element);

  /**
   * Remove one instance of the element from the multiset.
   *
   * @param element the element to remove as determined by .equals()
   * @return true if element found (before removal), false otherwise
   */
  boolean remove(E element);

  /**
   * Total number of elements (counting all duplicates) in the multiset.
   *
   * @return total number of elements
   */
  int size();

  /**
   * Total number of times the specified element appears in the multiset
   * (as determined by .equals()).
   *
   * @param element the value to count
   * @return number of occurrences of the element
   */
  int count(E element);

  /**
   * Remove and return an arbitrary element from the multiset. There is no
   * requirement on the order in which elements are grabbed.
   *
   * @return element extracted from the multiset; Optional.empty() if empty
   */
  Optional<E> grab();
}
