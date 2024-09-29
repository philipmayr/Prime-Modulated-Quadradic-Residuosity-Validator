# Prime Modulus Quadradic Residuosity Decider Algorithm

def decide_quadradic_residuosity(p, x)
    b = x ** (((p - 1) / 2) % p)
    
    if b == 1
        return true 
    else 
        return false
    end
end

# prime p
print "Enter a prime number: "
p = gets.to_i

# quadradic residue candidate
print "Enter a quadradic residue candidate modulo " + p.to_s + ": "
x = gets.to_i

puts

if decide_quadradic_residuosity(p, x)
    puts x.to_s + " is a quadradic residue modulo " + p.to_s + "."
else
    puts x.to_s + " is a quadradic nonresidue modulo " + p.to_s + "."
end
