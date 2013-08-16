function generateURL() {
    var endpoint="https://sdb.amazonaws.com";
    var host = endpoint.replace(/.*:\/\//, "");
    var params = {};
    var payload = null;
    var displayUri = endpoint;
    var accessKeyId=document.getElementById('accesskey').value;
    var secretKey=document.getElementById('secretkey').value;
    var domain = "SIMIAN_ARMY"

  
    
for (var i = 0; i < form.elements.length; ++i) {
        var elementName = form.elements[i].name;
        var elementValue = null;
        if (form.elements[i].name == 'SelectExpression'  ) {
            elementValue = form.elements[i].value+domain;
        } 
        if (elementValue) {
            params[elementName] = elementValue;
        }
    }

    params.Action = "select";
    params.Version = "2009-04-15";
    var signer = new AWSV2Signer(accessKeyId, secretKey);
    params = signer.sign(params, new Date(), {
        "verb": "GET",
        "host": host,
        "uriPath": "/"
    });

    var encodedParams = [];
    for (var key in params) {
        if (params[key] !== null) {
            encodedParams.push(encodeURIComponent(key) + "=" + encodeURIComponent(params[key]));
        } else {
            encodedParams.push(encodeURIComponent(key));
        }
    }

    payload = encodedParams.join("&");
    displayUri += "?" + payload;

    return displayUri;

}