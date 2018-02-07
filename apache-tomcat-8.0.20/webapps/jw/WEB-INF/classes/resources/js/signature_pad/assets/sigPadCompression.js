/** Reinflates a compressed signature string:
    resolution = a representation of the resolution in 
	pixels of the canvas which this signature will be drawn 
	e.g. {x:800,y:200}
*/
var inflateToJsonSignature = function (deflatedSig, resolution) {
    var components = [],
    	modifier = 1,
    	compressWithResolution = /^(?:\[(\d+)x(\d+)\])?([\w\W]*)/,
        parsedSigString = deflatedSig.match(compressWithResolution),
        widthModifier, heightModifier, i,
        sigString, deflatedLen,
        componentsLength;

    // If the previously compressed signature had a resolution, 
    // attempt to scale to fit the new canvas
    if (parsedSigString && resolution) {
        widthModifier = resolution.x / (parsedSigString[1] || 1);
        heightModifier = resolution.y / (parsedSigString[2] || 1);
        modifier = widthModifier < heightModifier ? widthModifier : heightModifier;
        deflatedSig = parsedSigString[3];
    }

    // Get each byte of the deflated signature as a unicode char
    // and convert to a decimal coordinate value. 
    // e.g. '}' => 125 
    // Stuff the result in our output array
    deflatedLen = deflatedSig.length;
    for (i = 0; i < deflatedSig.length; i++) {
        components.push((deflatedSig[i].charCodeAt()).toString());
    }

    // Rebuild the signature string from the result array above.
    // Every 4 chars represent the two sets of x,y coordinates
    componentsLength = components.length;
    sigString = "[";
    for (i = 0; i < componentsLength; i = i + 4) {
        sigString += (
            '{"lx":' + Math.round(components[i] * modifier) +
                ',"ly":' + Math.round(components[i + 1] * modifier) +
                    ',"mx":' + Math.round(components[i + 2] * modifier) +
                        ',"my":' + Math.round(components[i + 3] * modifier) + '},');
    }
    return sigString.substring(0, (sigString.length - 1)) + "]";
};

/** Deflates(compresses) a json signature string:
    resolution = a representation of the resolution in 
    pixels of the canvas which this signature came from  
    e.g. {x:800,y:200}
*/
var deflateFromJsonSignature = function (jsonSig, resolution) {
    var replacedSig,
        compressString = "",
        components,
        componentsLength, i;
        
    // Grab only the digits from the string
    components = jsonSig.match(/\d+/g);
        
    componentsLength = components.length
    for (i = 0; i < componentsLength; i = i + 1) {
        // don't save lines drawn outside the canvas. just draw to the edge.
        components[i] = components[i] < 0 ? 0 : components[i];
        // convert coordinate to a unicode value 
        // e.g. 125 => '}'
        // Append the result to the compressed string
        compressString += String.fromCharCode(parseInt(components[i].toString()));
    }
    // if a resolution was specified add it to the front of the compression string to allow
    // better scaling if the canvas changes size in the future
    if (resolution) {
        compressString = "[" + resolution.x + "x" + resolution.y + "]" + compressString;
    }
    return compressString;
}

