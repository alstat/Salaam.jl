function camel_disambig()
    disambig = pyimport("camel_tools.disambig.mle")   
    return disambig.MLEDisambiguator.pretrained()
end 

function disambig(s)
    return camel_disambig().disambiguate(s)
end