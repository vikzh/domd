#lang pyret
fun l-len(l):
  cases (List) l:
    | empty => 0
    | link(f, r) => 1 + l-len(r)
  end
end

check:
  l-len(empty) is 0
  l-len([list: 1, 2]) is 2
  l-len([list: 3, -5, 0]) is 3
end


fun l-sum(l):
  cases (List) l:
    | empty => 0
    | link(f, r) => f + l-sum(r)
  end
end

check:
  l-sum(empty) is 0
  l-sum([list: 1, 2, 3]) is 6
  l-sum([list: 1, -2]) is -1
end


fun l-str-len(l):
  cases (List) l:
    | empty => empty
    | link(f, r) => link(string-length(f), l-str-len(r))
  end
end

check:
  l-str-len([list: 'hi']) is [list: 2]
  l-str-len([list: ]) is [list: ]
  l-str-len([list: 'some', 'list']) is [list: 4, 4]
end


fun l-pos-nums(l):
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      if f >= 0:
        link(f, l-pos-nums(r))
      else:
        l-pos-nums(r)
      end
  end
end

check:
  l-pos-nums(empty) is empty
  l-pos-nums([list: 1, 2]) is [list: 1, 2]
  l-pos-nums([list: 1, -2, 3]) is [list: 1, 3]
  l-pos-nums([list: 5, -9, 8, 0, 12]) is [list: 5, 8 ,0, 12]
end


fun l-alternating(l):
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      cases (List) r:
        | empty => [list: f]
        | link(ff, rr) =>
          link(f, l-alternating(rr))
      end
  end
end

check:
  l-alternating(empty) is empty
  l-alternating([list: 1, 2]) is [list: 1]
  l-alternating([list: 1, 2, 3, 4, 5]) is [list: 1, 3, 5]
end


fun l-running-sum(l):
  cases (List) l:
    | empty => empty
    | link(f, r) => 
      fun rs-iter(acc, cur-list):
        cases (List) cur-list:
          | empty => [list: acc]
          | link(ff, rr) =>
            link(acc, rs-iter(acc + ff, rr))
        end
      end
      rs-iter(f, r)
  end
end


check:
  l-running-sum(empty) is empty
  l-running-sum([list: 1, 2, 3]) is [list: 1, 3, 6]
end


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


fun l-avg(l):
  cases (List) l:
    | empty => 'list is empty'
    | else => l-sum(l) / l-len(l)
  end
end

check:
  l-avg([list: 1, 2 ,3]) is 2
  l-avg([list: 1, 1]) is 1
end