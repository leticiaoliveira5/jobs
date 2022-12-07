class Proficiencies < EnumerateIt::Base
  associate_values(
    beginner: 0,
    intermediate: 1,
    advanced: 2,
    fluent: 3
  )
end
