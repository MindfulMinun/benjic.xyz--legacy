###
 * Downloads arbitrary data
 * @author MindfulMinun
 * @param {string} [filename] - The filename.
 * @param {string} [data] - The data to be saved
 * @param {string} [mimetype] - The file's MIME type.
 * @param {string} [encoding] - The file's encoding. Defaults to "base64"
 * @since 24 May 2018
 * @version 1.0.1
###
xyz.download = (filename, data, mimetype = "", encoding = "base64") ->
    _saver = (fname, uri) ->
        anchor = document.createElement 'a'
        anchor.setAttribute 'download', fname
        anchor.setAttribute 'style', 'display:none'
        anchor.setAttribute 'href', uri
        document.body.appendChild anchor
        anchor.click()
        document.body.removeChild anchor
        return

    _saver filename, [
        "data:#{mimetype};"
        "#{if encoding is "base64" then "base64" else "charset=#{encoding}"},"
        "#{encodeURIComponent data}"
    ].join('')
    return

###
 * Downloads a blob
 * @author MindfulMinun
 * @requires xyz.download
 * @param {string} [filename] - The filename.
 * @param {(Blob|string)} [data] - The blob or a URL referencing one
 * @param {string} [mimetype] - The file's MIME type. (Only required if `data` is a blob URL)
 * @since 24 May 2018
 * @version 1.0.1
###
xyz.downloadBlob = (filename, data, mimetype) ->
    _blobHandler = (blob, mime) ->
        f = new FileReader
        f.onload = (e) ->
            xyz.download(filename, e.target.result.replace(/^data:\S*?;\S*?,/g, ''), mime)
        f.readAsDataURL blob
        return

    if typeof data is "string"
        xhr = new XMLHttpRequest
        xhr.open "GET", data, true
        xhr.responseType = 'arraybuffer'
        xhr.onload = (e) ->
            if 200 <= this.status < 400
                console.log this.response
                _blobHandler new Blob([this.response], {type: mimetype}), mimetype
            else
                throw new Error "An error occurred while fetching blob URL."
        xhr.send()
    else
        _blobHandler data, data.type
    return

# blob = new Blob(
#     [JSON.stringify({hello: "world"}, null, 2)],
#     {type: "application/json"}
# )
# blobURL = URL.createObjectURL blob
#
#
# xyz.downloadBlob "My Blob", blob
# xyz.downloadBlob "My Blob via Object URL", blobURL, "application/json"
# xyz.download "My HTML file", """
#     <!DOCTYPE html>
#     <html lang="en" dir="ltr">
#         <head>
#             <meta charset="utf-8">
#             <title>My HTML File</title>
#         </head>
#         <body>
#             <h1>Hello world!</h1>
#         </body>
#     </html>
# """, "text/html", "utf-8"
