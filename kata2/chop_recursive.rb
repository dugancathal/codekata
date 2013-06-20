def chop(looking_for, values)
  chop_recurse(looking_for, values, 0, values.size - 1)
end

def chop_recurse(search, values, low, high)
  return -1 if high < low
  middle = midpoint(low, high)
  if values[middle] > search
    chop_recurse(search, values, low, middle - 1)
  elsif values[middle] < search
    chop_recurse(search, values, middle + 1, high)
  else
    middle
  end
end

def midpoint(min, max)
  ((max - min) / 2) + min
end
