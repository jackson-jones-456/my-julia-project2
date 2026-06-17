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