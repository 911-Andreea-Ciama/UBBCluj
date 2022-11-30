#pragma once
//DO NOT INCLUDE SETITERATOR

//DO NOT CHANGE THIS PART
#define NULL_TELEM -111111
typedef int TElem;
typedef bool TElemBool;
class SetIterator;

class Set {
    //DO NOT CHANGE THIS PART
    friend class SetIterator;

private:
    TElemBool* elems_bool; 
    int capacity_bool;
    int length_bool;
    
    TElem* elems;
    int capacity;
    int length;

public:
    //implicit constructor
    Set(int capacity = 10, int capacity_bool = 100000000);

    //adds an element to the set
    //returns true if the element was added, false otherwise (if the element was already in the set and it was not added)
    bool add(TElem e);

    //removes an element from the set
    //returns true if e was removed, false otherwise
    bool remove(TElem e);

    TElem getMinimum();
    TElem getMamimum();

    //checks whether an element belongs to the set or not
    bool search(TElem elem) const;

    //returns the number of elements;
    int size() const;

    //check whether the set is empty or not;
    bool isEmpty() const;

    //return an iterator for the set
    SetIterator iterator() const;

    // removes all elements from the set
    void empty();

    // destructor
    ~Set();

private:
    void resize(double factor = 2);
    void resizeBool(double factor = 5);
};