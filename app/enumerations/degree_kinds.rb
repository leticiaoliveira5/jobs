class DegreeKinds < EnumerateIt::Base
  associate_values(
    diploma: 0,
    bachelor: 1,
    graduate: 2,
    master: 3,
    doctorate: 4
  )
end
