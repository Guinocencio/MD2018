
  
  #Transformações
  
  
  orcamentaria <- rename(orcamentaria, `Empenho2000`= `Empenhado_2000..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2001`= `Empenhado_2001..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2002`= `Empenhado_2002..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2003`= `Empenhado_2003..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2004`= `Empenhado_2004..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2005`= `Empenhado_2005..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2006`= `Empenhado_2006..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2007`= `Empenhado_2007..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2008`= `Empenhado_2008..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2009`= `Empenhado_2009..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2010`= `Empenhado_2010..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2011`= `Empenhado_2011..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2012`= `Empenhado_2012..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2013`= `Empenhado_2013..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2014`= `Empenhado_2014..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2015`= `Empenhado_2015..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2016`= `Empenhado_2016..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2017`= `Empenhado_2017..R..milhões.`)
orcamentaria <- rename(orcamentaria, `Empenho2018`= `Empenhado..R..milhões.`)
orcamentaria <- rename(orcamentaria, `dotação atualizada`= `dotação.atualizada..R..milhões.`)



#Criando uma tabela para Classificar os dados da tabela Unidade.Orçamentaria



orcamentaria <- mutate(orcamentaria, Classifcadores = as.character(Unidade.Orçamentária))

#Outros

orcamentaria[orcamentaria$Unidade.Orçamentária == "Total Ministério da Defesa", 23] <- "Outros"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Indústria de Material Bélico do Brasil", 23] <- "Outros"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Fundação Osório", 23] <- "Outros"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Fundo do Ministério da Defesa", 23] <- "Outros"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Amazônia Azul Tecnologias de Defesa S.A", 23] <- "Outros"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Fundo Serviço Militar", 23] <- "Outros"

#Marinha

orcamentaria[orcamentaria$Unidade.Orçamentária == "Caixa de Construções de Casas para o Pessoal da Marinha", 23] <- "Marinha"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Comando da Marinha", 23] <- "Marinha"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Fundo de Desenvolvimento do Ensino Profissional Marítimo", 23] <- "Marinha"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Secretaria da Comissão Interministerial para os Recursos do Mar", 23] <- "Marinha"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Fundo Naval", 23] <- "Marinha"

#Aeronáutica


orcamentaria[orcamentaria$Unidade.Orçamentária == "Comando da Aeronáutica", 23] <- "Aeronáutica"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Caixa de Financiamento Imobiliário da Aeronáutica", 23] <- "Aeronáutica" 

orcamentaria[orcamentaria$Unidade.Orçamentária == "Fundo Aeronáutico", 23] <- "Aeronáutica"

#Exército

orcamentaria[orcamentaria$Unidade.Orçamentária == "Fundo do Exército", 23] <- "Exército"

orcamentaria[orcamentaria$Unidade.Orçamentária == "Comando do Exército", 23] <- "Exército" 

#Administração

orcamentaria[orcamentaria$Unidade.Orçamentária == "Fundo de Administração do Hospital das Forças Armadas", 23] <- "Administração" 

orcamentaria[orcamentaria$Unidade.Orçamentária == "Administração Direta", 23] <- "Administração"

#Para fazer utilizar o SVM tem que transformar em fator

orcamentaria$Classifcadores <- as.factor(orcamentaria$Classifcadores)
