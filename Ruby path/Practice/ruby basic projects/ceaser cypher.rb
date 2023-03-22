#65-90 uppercase 97-122
def ceacypher(word,number)
    number = number.to_i
    res=""
    word.each_char{|l| 

    #upcase
    if(l.ord.between?(65,90))
            rl = l.ord + number
            if(rl.between?(65,90))
                res+=rl.chr
            else
                rl= 64 + (rl-90)
                res+=rl.chr
            end
        
    elsif(l.ord.between?(97,122))
            rl = l.ord + number
            if(rl.between?(97,122))
                res+=rl.chr
            else
                rl= 96 + (rl-122)
                res+=rl.chr
            end
        
    else
        res+=l
    end
        
    
    }
    puts res
end

input = gets
number = gets.chomp.to_i
ceacypher(input,number)
