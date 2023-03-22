def substring(string,dictionary)
    string.downcase!
    res = {}
    dictionary.each do |word|
        times = string.scan(word).length
        if times>0
            res[word] = times
        end
    end
    res
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substring("Howdy partner, sit down! How's it going?", dictionary)
