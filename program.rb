# Prime Modulated Quadradic Residuosity Validator

def exponentiate_modularly(base, index, modulus)
    return 0 if base == 0
    return 1 if index == 0
    
    if base > modulus
        base %= modulus
    end
    
    return base if index == 1
    
    residue = 1
    
    while index > 0
        if index & 1 == 1
            residue = (residue * base) % modulus
        end
        
        base = (base * base) % modulus
        index >>= 1
    end
    
    return residue
end

def validate_quadradic_residuosity(quadratic_residue_candidate, prime_modulus)
    index = (prime_modulus - 1) >> 1
    residue = exponentiate_modularly(quadratic_residue_candidate, index, prime_modulus)
    
    return (residue == 1) ? true : false
end

loop do
    print "Enter a prime modulus: "
    prime_modulus = gets.to_i
    
    print "Enter a quadradic residue candidate modulo " + prime_modulus.to_s + ": "
    quadratic_residue_candidate = gets.to_i
    
    puts
    
    if validate_quadradic_residuosity(quadratic_residue_candidate, prime_modulus)
        quadratic_residue = quadratic_residue_candidate
        puts quadratic_residue.to_s + " is a quadradic residue modulo " + prime_modulus.to_s + "."
    else
        quadratic_nonresidue = quadratic_residue_candidate
        puts quadratic_nonresidue.to_s + " is a quadradic nonresidue modulo " + prime_modulus.to_s + "."
    end
    
    puts
end
