//! Code that does the testing
var assert = chai.assert;

describe("xyz", function() {

    beforeEach(function () {
        //! Give each test a manipulatable `DOMElement` to display results in.
        this.DOMElement = document.createElement('div');
        this.DOMElement.classList.add("dom-results");
    });
    afterEach(function () {
        //! Get test report elements;
        var t = document.getElementsByClassName('test'),
            testReport = t[t.length - 1];

        //! Append the `DOMElement`, if possible DOMElement isn't empty
        if (!testReport || this.DOMElement.innerHTML === '') {return;}
        testReport.appendChild(this.DOMElement);
    });

    describe(".escapeHTML()", function() {
        it("should escape HTML entities", function() {
            assert.equal(
                xyz.escapeHTML("<a href=\"javascript:alert('xss');\">click me lol</a>"),
                "&lt;a href&#x3D;&quot;javascript:alert(&#39;xss&#39;);&quot;&gt;click me lol&lt;&#x2F;a&gt;"
            );
            assert.equal(
                xyz.escapeHTML("<img src='brokenlink.jpg' onerror='alert(\"xssed\")'>"),
                "&lt;img src&#x3D;&#39;brokenlink.jpg&#39; onerror&#x3D;&#39;alert(&quot;xssed&quot;)&#39;&gt;"
            );
            assert.equal(
                xyz.escapeHTML("this & that"),
                "this &amp; that"
            );
        });
        it("should throw if not a string", function () {
            assert.throws(function() { xyz.escapeHTML(true); });
            assert.throws(function() { xyz.escapeHTML(null); });
            assert.throws(function() { xyz.escapeHTML(void 0); });
            assert.throws(function() { xyz.escapeHTML(1337); });
            assert.throws(function() { xyz.escapeHTML(Symbol()); });
            assert.throws(function() { xyz.escapeHTML({foo: "bar"}); });
        });
    });
    describe(".parseHTML()", function () {
        it("should parse a string and return an HTMLCollection or HTMLElement", function () {
            var one = xyz.parseHTML("<span>My simple span</span>"),
                two = xyz.parseHTML("<span>A span</span> <a href='#'>and a link</a>");
            assert.isTrue(one instanceof HTMLElement);
            assert.isTrue(two instanceof NodeList);
        });
        it("creates the tree as expected", function () {
            var parsedTree = xyz.parseHTML("<div><span>h</span></div>"),
                div  = document.createElement('div'),
                span = document.createElement('span');
            span.innerText = "h";
            div.appendChild(span);

            assert.isTrue(
                parsedTree.isEqualNode(div)
            );
        });
    });
    describe(".wait()", function () {
        it("should wait 10ms, then succeed", function (done) {
            xyz.wait(10).then(done);
        });
        it("should throw if time is negative, not a number, or Infinity", function () {
            assert.throws(function() { xyz.wait(-1000); });
            assert.throws(function() { xyz.wait(0 / 0); });
            assert.throws(function() { xyz.wait("String"); });
            assert.throws(function() { xyz.wait(Infinity); });
        });
    });
    describe(".ready()", function () {
        it("should execute function once DOM has been loaded", function (done) {
            xyz.ready(done);
        });
        it("should execute function immediately if DOM is already loaded", function () {
            xyz.ready(function () {
                var start = performance.now(), end;
                xyz.ready(function () {
                    end = performance.now();
                    assert.isAtMost(end - start, 3);
                });
            });
        });
    });
    describe(".hashUpdate()", function () {
        it("should log the hash when hash changed", function (done) {
            this.DOMElement.innerHTML =
                "<input type=\"text\" placeholder=\"New hash\"><button>Update hash</button>";
            var btn = this.DOMElement.querySelector('button');
            btn.addEventListener('click', function () {
                location.hash = this.previousElementSibling.value;
            });
            xyz.hashUpdate(function (h) {
                console.log("Hash updated: " + h)
            });
            done();
        });
    });
    describe(".download()", function () {
        it("should download plaintext as plaintext", function () {
            var d = this.DOMElement;
            d.innerHTML = [
                "<textarea placeholder=\"Content to be saved\" style=\"display:block;width:100%\"></textarea>",
                "<button>Save file</button>"
            ].join('');
            var btn = d.querySelector("button"),
                txt = d.querySelector("textarea");
            btn.addEventListener('click', function () {
                xyz.download("My plaintext file", txt.value, "text/plain", "utf-8");
            });
        });
    }); //! end describe .download()
    describe(".downloadBlob()", function () {
        it("should download blobs", function () {
            var btn = document.createElement("button");
            btn.innerHTML = "Download a JSON file created via Blob Constructor";
            btn.addEventListener('click', function () {
                xyz.downloadBlob("My JSON File", new Blob(
                    [JSON.stringify({
                        foo: "bar",
                        date: new Date(),
                        "random number between zero and one": Math.random()
                    }, null, 4)],
                    {type: "application/json"}
                ), "blob");
            });
            this.DOMElement.appendChild(btn);
        });
        it("should download blobs abstracted via an Object URL", function () {
            var btn = document.createElement("button"),
                blob = new Blob(
                    [JSON.stringify({hello: "world"}, null, 2)],
                    {type: "application/json"}
                ),
                blobURL = URL.createObjectURL(blob);
            btn.innerHTML = "Download a JSON file via blob URL";
            btn.addEventListener('click', function () {
                xyz.downloadBlob("My Blob via Object URL", blobURL, "application/json");
            });
            this.DOMElement.appendChild(btn);
        });
    });
}); //! end describe xyz
