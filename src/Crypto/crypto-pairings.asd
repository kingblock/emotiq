#|
The MIT License

Copyright (c) 2017-2018 Refined Audiometrics Laboratory, LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
|#

(defsystem "crypto-pairings"
  :description "crypto-pairings: bilinear pairings (PBC) functions"
  :version     "1.1.0"
  :author      "D.McClain <dbm@refined-audiometrics.com>"
  :license     "Copyright (c) 2018 by Emotiq AG. All rights reserved."
  :serial       t
  :components  ((:file "pairing-curves")
		(:file "pbc-cffi"))
  :depends-on   ("core-crypto"
                 "cffi")
  :perform (compile-op :after (o c)
                    (unless (directory (asdf:system-relative-pathname
                                        :emotiq "../var/local/lib/libLispPBCIntf.*"))
                      (format *standard-output* "~&Attempting to build native libraries... hang on...")
                      (run-program `("bash" ,(namestring (system-relative-pathname
                                                          :emotiq "../etc/build-native-libs.bash")))
                                   :output :string :error :string)
                      (format *standard-output* "~tWhew!  Finished.~&"))))



