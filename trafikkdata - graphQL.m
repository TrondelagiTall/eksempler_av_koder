// Her er eksempel av bruking av M-språk for nedlastning ghennom graphQl.
// I eksempel lastes det ned listen med punktmålinger fra vegvesen-traffikkdata, kjøretøyregistrering.

let
    Lenken = "https://www.vegvesen.no/trafikkdata/api/",
    HeadersList =[
            #"Content-Type"="application/json"
        ],
    
    PostContent=Text.ToBinary("
    { ""query"": ""{ trafficRegistrationPoints(searchQuery: {roadCategoryIds: [E] }) { id location { municipality { number }  } } }""}
    "),
    Kilde= Web.Contents(Lenken, [Headers=HeadersList, Content=PostContent]),
    data = Json.Document(Kilde)
in
    data



// Informasjon fra et punkt

let
    Lenken = "https://www.vegvesen.no/trafikkdata/api/",
    HeadersList =[
            #"Method"="POST",
            #"Content-Type"="application/json"
        ],
    
    PostContent=Text.ToBinary("{""query"": ""{ trafficData(trafficRegistrationPointId: \""44656V72812\"") { trafficRegistrationPoint{ name location{municipality{name}} } volume { byDay(from: \""2019-10-24T12:00:00+02:00\"", to: \""2019-10-24T14:00:00+02:00\"") { edges { node { from to total { volumeNumbers { volume } coverage { percentage } } byLengthRange{ total{ volumeNumbers{volume} } lengthRange { lowerBound upperBound } } } } } } }}""}"),
    Kilde= Web.Contents(Lenken, [Headers=HeadersList, Content=PostContent]),
    data = Json.Document(Kilde)   
in
    data