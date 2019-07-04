# Pyret List Processing

Basic function for manipulating lists

### Example

```pyret
fun l-max(l):
  cases (List) l:
    | empty => 'list is empty'
    | link(f, r) =>
      cases (List) r:
        | empty => f
        | else => num-max(f, l-max(r))
      end
  end
end

check:
  l-max([list: 1, 2 , 3, 4]) is 4
  l-max([list: 6, 8, -9]) is 8
end
```
