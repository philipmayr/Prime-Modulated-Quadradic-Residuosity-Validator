# Prime Modulus Quadradic Residuosity Decider Algorithm

def exponentiate_modularly(base, index, modulus)
    residue = 1
    
    base %= modulus
    
    if base == 0
        return 0
    end
        
    while index > 0
        if index & 1
            residue = (residue * base) % modulus
        end
            
        base = (base * base) % modulus
        index >>= 1
    end
    
    return residue;   
end

def decide_quadradic_residuosity(base, prime)
    index = (p - 1) / 2
    base = exponentiate_modularly(base, index, prime)
    
    if base == 1
        return true 
    else 
        return false
    end
end

loop do
    # get prime modulus
    print "Enter a prime number modulus: "
    prime = gets.to_i
    
    # get quadradic residue base candidate
    print "Enter a quadradic residue base candidate modulo " + prime.to_s + ": "
    base = gets.to_i
    
    puts
    
    if decide_quadradic_residuosity(base, prime)
        puts base.to_s + " is a quadradic residue modulo " + prime.to_s + "."
    else
        puts base.to_s + " is a quadradic nonresidue modulo " + prime.to_s + "."
    end
    
    puts
end
