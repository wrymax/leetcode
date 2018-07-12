class Node:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.next = None
        self.pre = None

class LRUCache:
    def __init__(self, capacity):
        """
        :type capacity: int
        """
        self.capacity = capacity
        self.map = dict()
        self.head = None
        self.end = None
        

    def get(self, key):
        """
        :type key: int
        :rtype: int
        """
        if not self.map.get(key):
            return -1
        else:
            self.setHead(key)
            return self.map.get(key).value
        

    def put(self, key, value):
        """
        :type key: int
        :type value: int
        :rtype: void
        """

        old = self.map.get(key)
        if not old:
            if len(self.map) >= self.capacity:
                self.remove_end()

            _node = Node(key, value)
            self.map[key] = _node
        else:
            # print("  -> setting ({}, {}) to ({}, {})".format(key, old.value, key, value))
            old.value = value
        self.setHead(key)

    def setHead(self, key):
        """
        To set the Node of the key to the head of the linked list
        """
        _new_node = self.map.get(key)
        if not self.head:
            self.head = _new_node
            self.end = _new_node
        else:
            if _new_node.key == self.head.key:
                return None
            else:
                _pre = _new_node.pre
                _next = _new_node.next
                if _next:
                    _pre.next = _next
                    _next.pre = _pre
                else:
                    # _new_node is currently the end
                    if _pre:
                        # if _new_node is not head
                        self.end = _pre
                        _pre.next = None
                _new_node.pre = None
                _old_head = self.head
                _new_node.next = _old_head
                self.head = _new_node
                _old_head.pre = _new_node
                # if _end_node.key == key:
                #     if _pre:
                #         self.end = _pre
                #         _pre.next = None
                # _old_head = self.head
                # _new_node.next = _old_head
                # self.head = _new_node
                # _old_head.pre = _new_node

    def remove_end(self):
        if not self.end:
            return None
        else:
            old_end_node = self.end
            # print("old_end_node is ", old_end_node.value)
            new_end_node = old_end_node.pre
            if new_end_node:
                self.end = new_end_node
                new_end_node.next = None
            self.map.pop(old_end_node.key, None)
            old_end_node = None

    def desc(self):
        pointer = self.head
        ret = ""
        while pointer:
            ret += "({}, {})".format(pointer.key, pointer.value)
            pointer = pointer.next
            if pointer:
                ret += " -> "
            # print("  -> half way ret = ", ret)

        return ret


# Your LRUCache object will be instantiated and called as such:
obj = LRUCache(3)
keys = ["LRUCache","put","get","put","get","get"]
values = [[1],[2,1],[2],[3,2],[2],[3]]

for i in range(len(keys)):
    obj.put(keys[i], values[i])
    print(obj.desc())
