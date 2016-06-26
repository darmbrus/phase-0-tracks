def printProjectNames(a)
  a.each { |b|
    puts b[:name]
  }
end

def printProjectsWithTasks(a)
  a.each {|b|
    puts b[:name]
    b[:tasks].each { |c|
      puts "  " + c
    }
  }
end

projects = [
  {
    name: 'Manditory Pairing: Arrays',
    date_due: {
      month: 6,
      day: 27,
      year: 2016
    },
    tasks: [
      'Schedule pair',
      'Meet with pair',
      'Submit assignment'
    ],
    pct_complete: 50
  } ,
  {
    name: 'Symbols and Hashes',
    date_due: {
      month: 6,
      day: 24,
      year: 1999
    },
    tasks: [
      'Release 0',
      'Release 1',
      'Release 2',
      'Release 3'
    ],
    pct_complete: 100
  } ,
  {
    name: 'Solo Challenge',
    date_due: {
      month: 6,
      day: 27,
      year: 2017
    },
    tasks: [
      'Psudocode out the challenge',
      'Break out logical methods',
      'Test solutions'
    ],
    pct_complete: 0
  }
]

puts projects[2][:pct_complete]
puts projects[1][:date_due][:day]

printProjectNames(projects)
printProjectsWithTasks(projects)
