function check_four_point(d)
    n = size(d, 1)
    for i in 1:n
        for j in i+1:n
            for k in j+1:n
                for l in k+1:n
                    s1 = d[i,j] + d[k,l]
                    s2 = d[i,k] + d[j,l]
                    s3 = d[i,l] + d[j,k]
                    sorted = sort([s1, s2, s3])
                    if sorted[2] < sorted[3]
                        return false
                    end
                end
            end
        end
    end
    return true
end

function is_metric(d)
    n = size(d, 1)
    
    # Check symmetry
    for i in 1:n
        for j in 1:n
            if d[i,j] != d[j,i]
                println("Fails symmetry at ($i,$j)")
                return false
            end
        end
    end
    
    # Check zero diagonal
    for i in 1:n
        if d[i,i] != 0
            println("Fails zero diagonal at ($i,$i)")
            return false
        end
    end
    
    # Check triangle inequality
    for i in 1:n
        for j in 1:n
            for k in 1:n
                if d[i,k] > d[i,j] + d[j,k]
                    println("Fails triangle inequality at ($i,$j,$k)")
                    return false
                end
            end
        end
    end
    
    return true
end

function is_tree_metric(d)
    if !is_metric(d)
        println("Fails metric conditions")
        return false
    end
    if !check_four_point(d)
        println("Fails four point condition")
        return false
    end
    return true
end