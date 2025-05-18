# Prime Modulus Quadradic Residuosity Decider

def exponentiate_modularly(base, index, modulus)
    residue = 1
    
    base %= modulus
    
    if base == 0
        return 0
    end
    
    while index > 0
        if index & 1 == 1
            residue = (residue * base) % modulus
        end
        
        base = (base * base) % modulus
        index >>= 1
    end
    
    return residue;
end

def decide_quadradic_residuosity(quadratic_residue_candidate, prime)
    index = (prime - 1) / 2
    congruence = exponentiate_modularly(quadratic_residue_candidate, index, prime)
    
    if congruence == 1
        return true
    else 
        return false
    end
end

loop do
    # get prime modulus
    print "Enter a prime modulus: "
    prime = gets.to_i
    
    # get quadradic residue candidate
    print "Enter a quadradic residue candidate modulo " + prime.to_s + ": "
    quadratic_residue_candidate = gets.to_i
    
    puts
    
    if decide_quadradic_residuosity(quadratic_residue_candidate, prime)
        quadratic_residue = quadratic_residue_candidate
        puts quadratic_residue.to_s + " is a quadradic residue modulo " + prime.to_s + "."
    else
        puts quadratic_residue_candidate.to_s + " is a quadradic nonresidue modulo " + prime.to_s + "."
    end
    
    puts
end
