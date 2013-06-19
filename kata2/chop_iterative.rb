def chop(looking_for, values)
  min_index = 0
  max_index = values.size - 1
  while max_index >= min_index
    midpoint_index = midpoint(min_index, max_index)
    return -1 unless values[midpoint_index]
    if values[midpoint_index] < looking_for
      min_index = midpoint_index + 1
    elsif values[midpoint_index] > looking_for
      max_index = midpoint_index - 1
    else
      return midpoint_index
    end
  end
  -1
end

def midpoint(min, max)
  ((max - min) / 2) + min
end
