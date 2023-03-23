def stockpicker(array)
    currL = 0
    res = 0
    ret = []
    array.each_with_index{ |element,i|  
        if(element<array[currL.to_i])
            currL = i
        end
        if((element - array[currL])>res)
            res = element - array[currL]
            ret = [currL,i]
        end
    }
    ret
end

puts stockpicker([17,3,6,9,15,8,6,1,10])
puts 