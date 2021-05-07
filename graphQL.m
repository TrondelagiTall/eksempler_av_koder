// This script shows how to use M language (Power Query Formula Language) 
// to read data from GitHub API v4 using a POST request.
// This can come in handy when building PowerBI reports that utilize GraphQL endpoints for loading data.

let
    vUrl = "https://api.github.com/graphql",
    vHeaders =[
			#"Method"="POST",
			#"Content-Type"="application/json",
			#"Authorization"="Bearer <your_personal_token_here>"
		],
    // Notice the quote escaping here
    vContent=Text.ToBinary("{""query"": ""{   organization(login: \""github\"") { name  }}""}"),
    Source = Web.Contents(vUrl,	[Headers=vHeaders, Content=vContent]),
    #"JSON" = Json.Document(Source)
in
    #"JSON"