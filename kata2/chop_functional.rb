def chop(looking_for, values)
  recurse(looking_for, values, 0, values.size - 1)
end

def recurse(value, values, low, high)
  mid = midpoint(low, high)
  case
  when high < low then return -1
  when values[mid] > value then recurse(value, values, low, mid - 1)
  when values[mid] < value then recurse(value, values, mid + 1, high)
  else mid
  end
end

def midpoint(min, max)
  ((max - min) / 2) + min
end
