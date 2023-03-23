def bubble(array)
    n=array.length - 1
    for i in 0..n
        for j in i+1..n
            if(array[i]>array[j])
                array[i],array[j] = array[j],array[i]
            end
        end
    end
    array
end

p bubble([4,3,78,2,0,2])